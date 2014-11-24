package dxol.service.examinfo;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import dxol.entity.ExamInfo;
import dxol.repository.ExaminfoDao;

// ExamInfo Bean的标识.
@Component
// 类中所有public函数都纳入事务管理的标识.
@Transactional
public class ExaminfoService  {

	private ExaminfoDao examinfoDao;

	public ExamInfo getExaminfo(Long id) {
		return examinfoDao.findOne(id);
	}

	public void saveExaminfo(ExamInfo entity) {
		examinfoDao.save(entity);
	}

	public void deleteExaminfo(Long id) {
		examinfoDao.delete(id);
	}

	public List<ExamInfo> getAllExaminfo() {
		return (List<ExamInfo>) examinfoDao.findAll();
	}

	public Page<ExamInfo> getExaminfo(Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
		return examinfoDao.findAll(pageRequest);
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
	 
	private Specification<Task> buildSpecification(Long userId, Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		filters.put("user.id", new SearchFilter("user.id", Operator.EQ, userId));
		Specification<Task> spec = DynamicSpecifications.bySearchFilter(filters.values(), Task.class);
		return spec;
	}
*/
	@Autowired
	public void setExaminfoDao(ExaminfoDao examinfoDao) {
		this.examinfoDao = examinfoDao;
	}
}
