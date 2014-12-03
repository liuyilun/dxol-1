package dxol.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import dxol.entity.Student;

public interface StudentDao extends PagingAndSortingRepository<Student, Long>, JpaSpecificationExecutor<Student> {

	Student findByUsername(String username);

	@Query("select student from Student student where student.school.id=?")
	Page<Student> findbySchoolId(Long schoolid, Pageable pageable);

	@Query("select student from Student student where (student.username like %?1% or student.name like %?1% or student.depart like %?1%)")
	Page<Student> findBySearchPara(String searchPara, Pageable pageable);

	@Query("select student from Student student where (student.username like %?1% or student.name like %?1% or student.depart like %?1%) and student.school.id =?2")
	Page<Student> findBySearchParaAndSchool(String searchPara, Long currentUserschool, Pageable pageable);

	@Query("select id from Student student where student.identity.id=?")
	List<Long> findbyIdentityId(Long id);

}
