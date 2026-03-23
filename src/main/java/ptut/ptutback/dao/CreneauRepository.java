package ptut.ptutback.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ptut.ptutback.entity.Creneau;

public interface CreneauRepository extends JpaRepository<Creneau, Long> {
}
