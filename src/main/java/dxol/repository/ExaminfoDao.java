package dxol.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import dxol.entity.ExamInfo;



public interface ExaminfoDao extends PagingAndSortingRepository<ExamInfo, Long>, JpaSpecificationExecutor<ExamInfo> {

	@Query("select examinfo from ExamInfo examinfo order by rand() ")
	List<ExamInfo> findbyIdentityId();
	@Query("select examinfo from ExamInfo examinfo where examinfo.course.id=?1")
	List<ExamInfo> findbyCourseId(Long id);
	@Query("select examinfo from ExamInfo examinfo where examinfo.course.id=null")
	List<ExamInfo> findAllExam();
	@Modifying
	@Query("delete from ExamInfo examinfo where course_id=?1")
	void deleteBycourseId(Long id);
}
