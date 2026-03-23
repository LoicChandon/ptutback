package ptut.ptutback.service;

import java.util.List;
import org.springframework.stereotype.Service;
import ptut.ptutback.dao.CreneauRepository;
import ptut.ptutback.entity.Creneau;

@Service
public class CreneauService {

    private final CreneauRepository creneauRepository;

    public CreneauService(CreneauRepository creneauRepository) {
        this.creneauRepository = creneauRepository;
    }

    public List<Creneau> findAll() {
        return creneauRepository.findAll();
    }

    public Creneau save(Creneau creneau) {
        return creneauRepository.save(creneau);
    }
}
