package dxol.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;





import dxol.entity.Course;


public interface CourseDao extends PagingAndSortingRepository<Course, Long>, JpaSpecificationExecutor<Course> {

	@Query("select course from Course course where course.identity.id=?")
	List<Course> findbyIdentityId(Long id);
	
	@Query("select course.id,course.courseName,course.content from Course course where course.id=?")
	Object[][] findById(Long id);

}
