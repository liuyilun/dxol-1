package dxol.service.course;




import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Component;

import dxol.entity.Course;
import dxol.entity.Student;
import dxol.repository.CourseDao;
import dxol.service.examinfo.ExaminfoService;
import dxol.service.student.StudentService;
import dxol.service.studentcourse.StudentCourseService;

// Course Bean的标识.
@Component
@Transactional
public class CourseService {

	@Autowired
	private CourseDao courseDao;
	@Autowired
	private StudentService studentService;
	@Autowired
	private StudentCourseService studentCourseService;
	@Autowired
	private ExaminfoService examinfoService;
	

	public Object[][]  getCourseinfo(Long id) {
		return courseDao.findById(id);
	}
	public Course getCourse(Long id){
		return courseDao.findOne(id);
	}

	public void saveCourse(Course course) {
		courseDao.save(course);
		
		List<Long> students = studentService.getStudentByIdentityId(course.getIdentity().getId());
		for(Long studentid : students){
			Student student = new Student();
			student.setId(studentid);
			course.addStudent(student);
		}
		studentCourseService.saveStudentCourse(course.getStudents());

	}
	public void deleteCourse(Long id) {
		courseDao.delete(id);
		studentCourseService.deleteStudentCourseByCourseId(id);
		examinfoService.deleteExaminfoByCourseId(id);
	}

	public List<Course> getAllCourse() {
		return (List<Course>) courseDao.findAll();
	}
	public Course getbyCourseId(Long id) {
		return courseDao.findbyCourseId(id);
	}
	public List<Course> getCourseByIdentityId(Long id) {
		return (List<Course>) courseDao.findbyIdentityId(id);
	}
	public Page<Course> getCourse(Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
		return courseDao.findAll(pageRequest);
	}
	/**
	 * 创建分页请求.
	 */
	private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
		Sort sort = null;
		if ("auto".equals(sortType)) {
			sort = new Sort(Direction.DESC, "id");
		} else if ("title".equals(sortType)) {
			sort = new Sort(Direction.ASC, "title");
		}

		return new PageRequest(pageNumber - 1, pagzSize, sort);
	}

	/**
	 * 创建动态查询条件组合.
	 
	private Specification<Course> buildSpecification(Long userId, Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		filters.put("user.id", new SearchFilter("user.id", Operator.EQ, userId));
		Specification<Course> spec = DynamicSpecifications.bySearchFilter(filters.values(), Task.class);
		return spec;
	}
*/
	@Autowired
	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}

	
}
