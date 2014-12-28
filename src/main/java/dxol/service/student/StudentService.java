package dxol.service.student;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.Clock;
import org.springside.modules.utils.Encodes;

import dxol.entity.Admin;
import dxol.entity.Course;
import dxol.entity.Student;
import dxol.entity.Summary;
import dxol.entity.User;
import dxol.repository.StudentCourseDao;
import dxol.repository.StudentDao;
import dxol.service.account.ShiroDbRealm.ShiroUser;
import dxol.service.admin.AdminService;
import dxol.service.course.CourseService;
import dxol.service.studentcourse.StudentCourseService;

/**
 * 学生管理类.
 * 
 * @author liuwei
 */
// Spring Service Bean的标识.
@Component
@Transactional
public class StudentService {
	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	private static final int SALT_SIZE = 8;
	private Clock clock = Clock.DEFAULT;
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private StudentCourseDao studentCourseDao;
	@Autowired
	private CourseService courseService;
	@Autowired
	private StudentCourseService studentCourseService;
	@Autowired
	private AdminService adminService;

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	public void setClock(Clock clock) {
		this.clock = clock;
	}

	public Student findStudentbyName(Long id) {
		return studentDao.findOne(id);
	}

	@Transactional(readOnly = false)
	public void deleteStudent(Long id) {
		studentDao.delete(id);

	}

	@Transactional(readOnly = false)
	public void saveStudent(Student student) {
		if (StringUtils.isNotBlank(student.getPlainPassword())) {
			entryptPassword(student);
		}
		boolean isNewStudent = false;
		if (student.getId() == null) {
			student.setRegisterDate(clock.getCurrentDate());
			isNewStudent = true;
		}
		studentDao.save(student);

		if (isNewStudent) {

			List<Course> courses = courseService.getCourseByIdentityId(student
					.getIdentity().getId());

			for (Course course : courses) {
				student.addCourse(course);
			}
			studentCourseService.saveStudentCourse(student.getCourses());
		}
	}

	public void updateStudent(Student student) {
		if (StringUtils.isNotBlank(student.getPlainPassword())) {
			entryptPassword(student);
		}

		studentDao.save(student);
	}

	public Summary findSummarybystudentId(Student student) {

		return student.getSummary();

	}

	public List<Student> findAllStudent() {
		return (List<Student>) studentDao
				.findAll(new Sort(Direction.ASC, "id"));
	}

	public Page<Student> getStudent(String searchPara, int pageNumber,
			int pageSize, String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize,
				sortType);
		if (SecurityUtils.getSubject().hasRole("super")) {
			if (StringUtils.isNoneBlank(searchPara)) {
				return studentDao.findBySearchPara(searchPara, pageRequest);
			} else {
				return studentDao.findAll(pageRequest);
			}
		} else {
			if (StringUtils.isNoneBlank(searchPara)) {
				return studentDao.findBySearchParaAndSchool(searchPara,
						getCurrentUserschool(), pageRequest);
			} else {
				return studentDao.findbySchoolId(getCurrentUserschool(),
						pageRequest);
			}
		}
	}

	private Long getCurrentUserschool() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		Admin admin = adminService.findAdminbyName(user.id);
		return admin.getSchool().getId();
	}

	/**
	 * 创建分页请求.
	 */
	private PageRequest buildPageRequest(int pageNumber, int pagzSize,
			String sortType) {
		Sort sort = null;
		if ("auto".equals(sortType)) {
			sort = new Sort(Direction.DESC, "id");
		} else if ("username".equals(sortType)) {
			sort = new Sort(Direction.ASC, "username");
		} else if ("name".equals(sortType)) {
			sort = new Sort(Direction.ASC, "name");
		} else if ("depart".equals(sortType)) {
			sort = new Sort(Direction.ASC, "depart");
		}

		return new PageRequest(pageNumber - 1, pagzSize, sort);
	}

	private void entryptPassword(User user) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));

		byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(),
				salt, HASH_INTERATIONS);
		user.setPassword(Encodes.encodeHex(hashPassword));
	}

	public Student findStudentbyUserName(String username) {
		// TODO Auto-generated method stub
		return studentDao.findByUsername(username);
	}

	public List<Long> getStudentByIdentityId(Long id) {
		// TODO Auto-generated method stub
		return studentDao.findbyIdentityId(id);
	}

}
