package dxol.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import dxol.entity.ExamInfo;



public interface ExaminfoDao extends PagingAndSortingRepository<ExamInfo, Long>, JpaSpecificationExecutor<ExamInfo> {

}
