package ptut.ptutback.controller;

import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ptut.ptutback.entity.Creneau;
import ptut.ptutback.service.CreneauService;

@RestController
@RequestMapping("/api/creneaux")
public class CreneauController {

    private final CreneauService creneauService;

    public CreneauController(CreneauService creneauService) {
        this.creneauService = creneauService;
    }

    @GetMapping
    public List<Creneau> getAllCreneaux() {
        return creneauService.findAll();
    }

    @PostMapping
    public Creneau createCreneau(@RequestBody Creneau creneau) {
        return creneauService.save(creneau);
    }
}
