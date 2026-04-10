package ptut.ptutback.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ptut.ptutback.entity.Promotion;
import ptut.ptutback.service.PromotionService;

@RestController
@RequestMapping("/api/promotions")
public class PromotionController {

    private final PromotionService promotionService;

    public PromotionController(PromotionService promotionService) {
        this.promotionService = promotionService;
    }

    @GetMapping("/ical")
    public List<PromotionIcalResponse> getPromotionIcal(@RequestParam(required = false) String nom) {
        if (nom == null || nom.isBlank()) {
            return promotionService.findAll().stream()
                    .map(promotion -> new PromotionIcalResponse(promotion.getNom(), promotion.getLienIcal()))
                    .toList();
        }

        Promotion promotion = promotionService.findByNom(nom);
        return List.of(new PromotionIcalResponse(promotion.getNom(), promotion.getLienIcal()));
    }

    @PostMapping("/ical")
    public PromotionIcalResponse updatePromotionIcal(
            @RequestParam String nom,
            @RequestBody UpdatePromotionIcalRequest request) {
        Promotion updated = promotionService.updateLienIcal(nom, request.lienIcal());
        return new PromotionIcalResponse(updated.getNom(), updated.getLienIcal());
    }

    public record UpdatePromotionIcalRequest(String lienIcal) {
    }

    public record PromotionIcalResponse(String nom, String lienIcal) {
    }
}
