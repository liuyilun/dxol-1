package dxol.service.student;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.Clock;
import org.springside.modules.utils.Encodes;

import dxol.entity.Student;
import dxol.entity.Summary;
import dxol.entity.User;
import dxol.repository.StudentDao;


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
	private StudentDao studentDao;
	

	@Autowired
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
		student.setRegisterDate(clock.getCurrentDate());
		
		studentDao.save(student);
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

	public Page<Student> getStudent(Map<String, Object> searchParams,
			int pageNumber, int pageSize, String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize,
				sortType);
		Specification<Student> spec = buildSpecification(searchParams);

		return studentDao.findAll(spec, pageRequest);
	}

	/**
	 * 创建分页请求.
	 */
	private PageRequest buildPageRequest(int pageNumber, int pagzSize,
			String sortType) {
		Sort sort = null;
		if ("auto".equals(sortType)) {
			sort = new Sort(Direction.DESC, "id");
		} else if ("title".equals(sortType)) {
			sort = new Sort(Direction.ASC, "username");
		}

		return new PageRequest(pageNumber - 1, pagzSize, sort);
	}

	/**
	 * 创建动态查询条件组合.
	 */
	private Specification<Student> buildSpecification(
			Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		/*
		 * filters.put("user.id", new SearchFilter("user.id", Operator.EQ,
		 * userId));
		 */
		Specification<Student> spec = DynamicSpecifications.bySearchFilter(
				filters.values(), Student.class);
		return spec;
	}

	private void entryptPassword(User user) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));

		byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(),
				salt, HASH_INTERATIONS);
		user.setPassword(Encodes.encodeHex(hashPassword));
	}

}
