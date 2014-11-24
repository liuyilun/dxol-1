package dxol.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import dxol.entity.Student;

public interface StudentDao extends PagingAndSortingRepository<Student, Long>, JpaSpecificationExecutor<Student> {

	Student findByUsername(String username);
	@Query("select student from Student student where student.school.id=?")
	List<Student> findbySchoolId(Long schoolid);

}
