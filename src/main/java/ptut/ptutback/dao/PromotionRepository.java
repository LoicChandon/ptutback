package ptut.ptutback.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import ptut.ptutback.entity.Promotion;

public interface PromotionRepository extends JpaRepository<Promotion, Long> {
}
