package dxol.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import dxol.entity.School;

public interface SchoolDao extends PagingAndSortingRepository<School, Long>,
		JpaSpecificationExecutor<School> {

	School findByName(String name);

	}
