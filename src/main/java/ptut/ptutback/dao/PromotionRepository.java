package ptut.ptutback.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import ptut.ptutback.entity.Promotion;

public interface PromotionRepository extends JpaRepository<Promotion, Long> {
	Optional<Promotion> findByNom(String nom);

	Optional<Promotion> findByNomIgnoreCase(String nom);
}
