package dxol.service.studentcourse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import dxol.entity.StudentCourse;
import dxol.repository.StudentCourseDao;

@Component
@Transactional
public class StudentCourseService {

	@Autowired
	private StudentCourseDao studentCourseDao;

	public void saveStudentCourse(StudentCourse studentCourse) {
		studentCourseDao.save(studentCourse);
	}
	

	public void saveStudentCourse(Iterable<StudentCourse> studentCourses) {
		studentCourseDao.save(studentCourses);
	}

	public void deleteStudentCourseByCourseId(Long id) {
		studentCourseDao.deleteByCourseId(id);
	}

	public void deleteStudentCourseByStudentId(Long id) {
		studentCourseDao.deleteByStudentId(id);
	}

	public StudentCourse findByCourseStudentID(Long cid, Long sid) {
		return studentCourseDao.findByid(cid, sid);
	}
}
