package dxol.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import dxol.entity.Summary;


public interface SummaryDao  extends PagingAndSortingRepository<Summary, Long>, JpaSpecificationExecutor<Summary>{

}
