package dxol.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import dxol.entity.Student;

public interface StudentDao extends PagingAndSortingRepository<Student, Long>, JpaSpecificationExecutor<Student> {

	Student findByUsername(String username);

}
