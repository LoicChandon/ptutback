package ptut.ptutback.service;

import java.net.URI;
import java.util.List;
import java.util.Locale;

import static org.springframework.http.HttpStatus.BAD_REQUEST;
import static org.springframework.http.HttpStatus.NOT_FOUND;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import ptut.ptutback.dao.PromotionRepository;
import ptut.ptutback.entity.Promotion;

@Service
public class PromotionService {

    private final PromotionRepository promotionRepository;

    public PromotionService(PromotionRepository promotionRepository) {
        this.promotionRepository = promotionRepository;
    }

    public Promotion findByNom(String nom) {
        String normalizedNom = normalizePromotionName(nom);
        return promotionRepository.findByNomIgnoreCase(normalizedNom)
                .orElseThrow(() -> new ResponseStatusException(
                        NOT_FOUND,
                        "Promotion introuvable: " + normalizedNom));
    }

    public List<Promotion> findAll() {
        return promotionRepository.findAll();
    }

    @Transactional
    public Promotion updateLienIcal(String nom, String lienIcal) {
        Promotion promotion = findByNom(nom);
        String validatedLien = validateIcalUrl(lienIcal);
        promotion.setLienIcal(validatedLien);
        return promotionRepository.save(promotion);
    }

    private String normalizePromotionName(String nom) {
        if (nom == null || nom.isBlank()) {
            throw new ResponseStatusException(BAD_REQUEST, "Le paramètre 'nom' est obligatoire");
        }
        return nom.trim().toUpperCase(Locale.ROOT);
    }

    private String validateIcalUrl(String lienIcal) {
        if (lienIcal == null || lienIcal.isBlank()) {
            throw new ResponseStatusException(BAD_REQUEST, "Le champ 'lienIcal' est obligatoire");
        }

        String trimmed = lienIcal.trim();
        URI uri;
        try {
            uri = URI.create(trimmed);
        } catch (IllegalArgumentException ex) {
            throw new ResponseStatusException(BAD_REQUEST, "URL iCal invalide");
        }

        String scheme = uri.getScheme();
        if (scheme == null ||
                (!"http".equalsIgnoreCase(scheme) && !"https".equalsIgnoreCase(scheme))) {
            throw new ResponseStatusException(BAD_REQUEST, "L'URL iCal doit commencer par http:// ou https://");
        }

        if (uri.getHost() == null || uri.getHost().isBlank()) {
            throw new ResponseStatusException(BAD_REQUEST, "L'URL iCal doit contenir un hôte valide");
        }

        return trimmed;
    }
}
