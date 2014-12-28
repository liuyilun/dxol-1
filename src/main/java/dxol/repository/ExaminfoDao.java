package dxol.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import dxol.entity.ExamInfo;



public interface ExaminfoDao extends PagingAndSortingRepository<ExamInfo, Long>, JpaSpecificationExecutor<ExamInfo> {

	@Query("select examinfo from ExamInfo examinfo order by rand() ")
	List<ExamInfo> findbyIdentityId();
	@Query("select examinfo from ExamInfo examinfo where examinfo.course.id=?1")
	List<ExamInfo> findbyCourseId(Long id);
	

}
