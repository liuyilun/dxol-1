package dxol.repository;

import java.util.List;

import java.util.List;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import dxol.entity.StudentCourse;

	
  
public interface StudentCourseDao extends PagingAndSortingRepository<StudentCourse, Long>,
		JpaSpecificationExecutor<StudentCourse> {

	@Modifying
	@Query("delete from StudentCourse ol_student_course where courseid=?1")
	void deleteByCourseId(Long id);

	@Modifying
	@Query("delete from StudentCourse ol_student_course where studentid=?1")
	void deleteByStudentId(Long id);

	@Query("select ol_student_course.courseId from StudentCourse ol_student_course where studentid=?1")
	List<Long> findByStudentId(Long id);

	@Query("select studentCourse from StudentCourse studentCourse where courseid=?1 and studentid=?2")
	StudentCourse findByid(Long cid, Long sid);

}
