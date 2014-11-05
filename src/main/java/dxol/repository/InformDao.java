package dxol.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import dxol.entity.Inform;

public interface InformDao extends PagingAndSortingRepository<Inform, Long>, JpaSpecificationExecutor<Inform> {

}
