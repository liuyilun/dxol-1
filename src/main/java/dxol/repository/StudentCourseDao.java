package dxol.repository;


import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import dxol.entity.StudentCourse;
public interface StudentCourseDao extends PagingAndSortingRepository<StudentCourse, Long>, JpaSpecificationExecutor<StudentCourse> {

	@Modifying
	@Query("delete from StudentCourse ol_student_course where courseId=?1")
	void deleteByCourseId(Long id);


	
  
}
