package ptut.ptutback.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import ptut.ptutback.entity.Creneau;

public interface CreneauRepository extends JpaRepository<Creneau, Long> {

	@Modifying
	@Query(value = "TRUNCATE TABLE creneau RESTART IDENTITY", nativeQuery = true)
	void truncateAll();
}
