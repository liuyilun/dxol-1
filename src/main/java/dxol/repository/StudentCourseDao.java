package dxol.repository;


import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import dxol.entity.StudentCourse;
public interface StudentCourseDao extends PagingAndSortingRepository<StudentCourse, Long>, JpaSpecificationExecutor<StudentCourse> {
	

}
