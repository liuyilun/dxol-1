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
	private StudentCourseDao studentCourseDao ;
	public void saveStudentCourse(StudentCourse studentCourse ){
		studentCourseDao.save(studentCourse);
	}
}
