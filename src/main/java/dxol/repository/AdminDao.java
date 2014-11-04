package dxol.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import dxol.entity.Admin;

public interface AdminDao extends PagingAndSortingRepository<Admin, Long>, JpaSpecificationExecutor<Admin> {
	Admin findByUsername(String username);
}
