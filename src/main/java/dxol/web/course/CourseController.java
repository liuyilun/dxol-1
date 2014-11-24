package dxol.web.course;


import java.util.Map;
import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.web.Servlets;
import com.google.common.collect.Maps;

import dxol.entity.Course;
import dxol.entity.Identity;
import dxol.repository.IdentityDao;
import dxol.service.course.CourseService;

/**
 * Course管理的Controller, 使用Restful风格的Urls:
 * 
 * List page : GET /task/
 * Create page : GET /task/create
 * Create action : POST /task/create
 * Update page : GET /task/update/{id}
 * Update action : POST /task/update
 * Delete action : GET /task/delete/{id}
 * 
 * @author calvin
 */ 
@Controller
@RequestMapping(value = "/admin/course")
public class CourseController{

	private static final String PAGE_SIZE = "3";

	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("auto", "自动");
		sortTypes.put("title", "标题");
	}

	@Autowired
	private CourseService courseService;
	@Autowired
	private IdentityDao identityDao;

	@RequestMapping(method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
			ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		
		model.addAttribute("courses", courseService.getAllCourse());
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

		return "admin/view/course/courseList";
	}

	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("course", new Course());
		model.addAttribute("action", "create");
		return "admin/view/course/courseForm";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@Valid Course newCourse, RedirectAttributes redirectAttributes,Long identity_id) {
		Identity identity = new Identity();
		identity.setId(identity_id);
		newCourse.setIdentity(identity);
		courseService.saveCourse(newCourse);
		redirectAttributes.addFlashAttribute("message", "创建课程成功");
		return "redirect:/admin/course";
	}

	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("course", courseService.getCourse(id));
		model.addAttribute("action", "update");
		return "admin/view/course/courseForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("course") Course course, RedirectAttributes redirectAttributes,
			Long identity_id) {
		Identity identity = identityDao.findOne(identity_id);
		course.setIdentity(identity);
		courseService.saveCourse(course);
		redirectAttributes.addFlashAttribute("message", "更新课程成功");
		return "redirect:/admin/course";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		courseService.deleteCourse(id);
		redirectAttributes.addFlashAttribute("message", "删除课程成功");
		return "redirect:/admin/course";
	}

	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getCourse(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("course", courseService.getCourse(id));
		}
	}

}
