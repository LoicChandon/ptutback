package ptut.ptutback.dao;

import java.time.LocalDateTime;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import ptut.ptutback.entity.Creneau;

public interface CreneauRepository extends JpaRepository<Creneau, Long> {

	@Modifying
	@Query(value = "TRUNCATE TABLE creneau RESTART IDENTITY", nativeQuery = true)
	void truncateAll();

	@Modifying
	@Query("DELETE FROM Creneau c WHERE c.startTime >= :now")
	void deleteFutureCreneaux(@Param("now") LocalDateTime now);
}
