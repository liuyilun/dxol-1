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
import dxol.repository.CourseDao;

// Course Bean的标识.
@Component
@Transactional
public class CourseService {

	private CourseDao courseDao;

	public Course getCourse(Long id) {
		return courseDao.findOne(id);
	}

	public void saveCourse(Course entity) {
		courseDao.save(entity);
	}
	public void deleteCourse(Long id) {
		courseDao.delete(id);
	}

	public List<Course> getAllCourse() {
		return (List<Course>) courseDao.findAll();
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
