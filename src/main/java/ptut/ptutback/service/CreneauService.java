package ptut.ptutback.service;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Service;

import ptut.ptutback.dao.CreneauRepository;
import ptut.ptutback.dao.PromotionRepository;
import ptut.ptutback.entity.Creneau;
import ptut.ptutback.entity.Promotion;

@Service
public class CreneauService {

    private final CreneauRepository creneauRepository;
    private final PromotionRepository promotionRepository;
    private final HttpClient httpClient;

    private static final Pattern GROUP_PATTERN = Pattern.compile("(GRP[- ]?\\d+)", Pattern.CASE_INSENSITIVE);
    private static final Pattern COURSE_TYPE_PATTERN = Pattern.compile("\\b(CM|TD|TP)\\b", Pattern.CASE_INSENSITIVE);

    public CreneauService(CreneauRepository creneauRepository, PromotionRepository promotionRepository) {
        this.creneauRepository = creneauRepository;
        this.promotionRepository = promotionRepository;
        this.httpClient = HttpClient.newBuilder().build();
    }

    public List<Creneau> findAll() {
        return creneauRepository.findAll();
    }

    public Creneau save(Creneau creneau) {
        return creneauRepository.save(creneau);
    }

    public ImportResult importFromPromotionLinks(boolean replaceExisting) {
        List<Promotion> promotions = promotionRepository.findAll();
        List<Creneau> importedCreneaux = new ArrayList<>();
        List<String> warnings = new ArrayList<>();

        if (replaceExisting) {
            creneauRepository.deleteAllInBatch();
        }

        int linkedPromotionCount = 0;
        for (Promotion promotion : promotions) {
            String lienIcal = promotion.getLienIcal();
            if (lienIcal == null || lienIcal.isBlank()) {
                continue;
            }

            linkedPromotionCount++;
            try {
                List<Creneau> promotionCreneaux = parseIcsFromUrl(lienIcal);
                for (Creneau creneau : promotionCreneaux) {
                    creneau.setClasse(promotion.getNom());
                }
                importedCreneaux.addAll(promotionCreneaux);
            } catch (IOException ex) {
                warnings.add("Promotion " + promotion.getNom() + " : " + ex.getMessage());
            } catch (InterruptedException ex) {
                Thread.currentThread().interrupt();
                warnings.add("Promotion " + promotion.getNom() + " : interruption pendant l'import ICS");
            }
        }

        creneauRepository.saveAll(importedCreneaux);
        return new ImportResult(promotions.size(), linkedPromotionCount, importedCreneaux.size(), warnings);
    }

    public ImportResult importFromSingleIcalLink(String iCalUrl, boolean replaceExisting) {
        List<Creneau> importedCreneaux = new ArrayList<>();
        List<String> warnings = new ArrayList<>();

        if (replaceExisting) {
            creneauRepository.deleteAllInBatch();
        }

        try {
            importedCreneaux.addAll(parseIcsFromUrl(iCalUrl));
        } catch (IOException ex) {
            warnings.add("Import direct : " + ex.getMessage());
        } catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
            warnings.add("Import direct : interruption pendant l'import ICS");
        }

        creneauRepository.saveAll(importedCreneaux);
        return new ImportResult(0, 1, importedCreneaux.size(), warnings);
    }

    private List<Creneau> parseIcsFromUrl(String url) throws IOException, InterruptedException {
        HttpRequest request = HttpRequest.newBuilder(URI.create(url)).GET().build();
        HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());

        if (response.statusCode() < 200 || response.statusCode() >= 300) {
            throw new IOException("HTTP " + response.statusCode() + " pendant la récupération du fichier ICS");
        }

        return parseIcsContent(response.body());
    }

    private List<Creneau> parseIcsContent(String content) {
        List<String> lines = unfoldLines(content);
        List<Creneau> result = new ArrayList<>();

        Map<String, String> eventFields = null;
        for (String line : lines) {
            if ("BEGIN:VEVENT".equals(line)) {
                eventFields = new HashMap<>();
                continue;
            }

            if ("END:VEVENT".equals(line)) {
                if (eventFields != null) {
                    Creneau creneau = toCreneau(eventFields);
                    if (creneau != null) {
                        result.add(creneau);
                    }
                }
                eventFields = null;
                continue;
            }

            if (eventFields == null) {
                continue;
            }

            int separator = line.indexOf(':');
            if (separator < 0) {
                continue;
            }

            String rawKey = line.substring(0, separator);
            String value = line.substring(separator + 1);
            String key = rawKey.split(";", 2)[0].toUpperCase(Locale.ROOT);
            eventFields.put(key, value);
        }

        return result;
    }

    private List<String> unfoldLines(String content) {
        String[] rawLines = content.split("\\r?\\n");
        List<String> unfolded = new ArrayList<>();

        for (String line : rawLines) {
            if ((line.startsWith(" ") || line.startsWith("\t")) && !unfolded.isEmpty()) {
                int last = unfolded.size() - 1;
                unfolded.set(last, unfolded.get(last) + line.substring(1));
            } else {
                unfolded.add(line);
            }
        }

        return unfolded;
    }

    private Creneau toCreneau(Map<String, String> fields) {
        String summary = fields.get("SUMMARY");
        String dtStart = fields.get("DTSTART");
        String dtEnd = fields.get("DTEND");

        if (summary == null || dtStart == null || dtEnd == null) {
            return null;
        }

        String description = unescapeIcsText(fields.get("DESCRIPTION"));
        String normalizedLocation = normalizeLocation(unescapeIcsText(fields.get("LOCATION")));

        Creneau creneau = new Creneau();
        creneau.setTitle(unescapeIcsText(summary));
        creneau.setLocation(normalizedLocation);
        creneau.setStartTime(parseIcsDateTime(dtStart));
        creneau.setEndTime(parseIcsDateTime(dtEnd));
        creneau.setProfessor(extractProfessor(description));
        creneau.setGroupName(extractGroup(summary, description));
        creneau.setCourseType(extractCourseType(summary, description));
        creneau.setDescription(description);
        return creneau;
    }

    private LocalDateTime parseIcsDateTime(String rawValue) {
        String value = rawValue.trim();

        if (value.endsWith("Z")) {
            OffsetDateTime odt = OffsetDateTime.parse(value, DateTimeFormatter.ofPattern("yyyyMMdd'T'HHmmssX"));
            return odt.atZoneSameInstant(ZoneId.systemDefault()).toLocalDateTime();
        }

        if (value.length() == 15) {
            return LocalDateTime.parse(value, DateTimeFormatter.ofPattern("yyyyMMdd'T'HHmmss"));
        }

        if (value.length() == 13) {
            return LocalDateTime.parse(value, DateTimeFormatter.ofPattern("yyyyMMdd'T'HHmm"));
        }

        if (value.length() == 8) {
            return LocalDate.parse(value, DateTimeFormatter.BASIC_ISO_DATE).atStartOfDay();
        }

        throw new IllegalArgumentException("Format de date ICS non supporté: " + rawValue);
    }

    private String normalizeLocation(String location) {
        if (location == null || location.isBlank()) {
            return null;
        }

        String cleaned = location.trim();
        int dashIndex = cleaned.lastIndexOf('-');
        if (dashIndex >= 0 && dashIndex < cleaned.length() - 1) {
            cleaned = cleaned.substring(dashIndex + 1).trim();
        }

        return cleaned.isBlank() ? null : cleaned;
    }

    private String extractProfessor(String description) {
        if (description == null || description.isBlank()) {
            return null;
        }

        String[] lines = description.split("\\r?\\n");
        for (int i = 1; i < lines.length; i++) {
            String current = lines[i].trim().toLowerCase(Locale.ROOT);
            if (current.contains("export")) {
                String candidate = lines[i - 1].trim();
                if (!candidate.isBlank() && !candidate.toUpperCase(Locale.ROOT).contains("GRP")) {
                    return candidate;
                }
            }
        }

        return null;
    }

    private String extractGroup(String summary, String description) {
        String fromSummary = findFirstMatch(summary, GROUP_PATTERN);
        if (fromSummary != null) {
            return fromSummary.toUpperCase(Locale.ROOT).replace(" ", "-");
        }

        String fromDescription = findFirstMatch(description, GROUP_PATTERN);
        if (fromDescription != null) {
            return fromDescription.toUpperCase(Locale.ROOT).replace(" ", "-");
        }

        return null;
    }

    private String extractCourseType(String summary, String description) {
        String fromSummary = findFirstMatch(summary, COURSE_TYPE_PATTERN);
        if (fromSummary != null) {
            return fromSummary.toUpperCase(Locale.ROOT);
        }

        String fromDescription = findFirstMatch(description, COURSE_TYPE_PATTERN);
        if (fromDescription != null) {
            return fromDescription.toUpperCase(Locale.ROOT);
        }

        return null;
    }

    private String findFirstMatch(String source, Pattern pattern) {
        if (source == null || source.isBlank()) {
            return null;
        }

        Matcher matcher = pattern.matcher(source);
        if (matcher.find()) {
            return matcher.group(1);
        }
        return null;
    }

    private String unescapeIcsText(String value) {
        if (value == null) {
            return null;
        }

        return value
                .replace("\\\\n", "\n")
                .replace("\\\\N", "\n")
                .replace("\\\\,", ",")
                .replace("\\\\;", ";")
                .trim();
    }

    public record ImportResult(
            int promotionCount,
            int linkedPromotionCount,
            int importedCreneauCount,
            List<String> warnings) {
    }
}
