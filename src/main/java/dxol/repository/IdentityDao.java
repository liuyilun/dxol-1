package dxol.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import dxol.entity.Identity;

public interface IdentityDao extends PagingAndSortingRepository<Identity, Long>, JpaSpecificationExecutor<Identity> {
}
