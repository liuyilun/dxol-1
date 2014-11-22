package dxol.web.student;

import java.util.List;
import java.util.Map;

import javassist.expr.NewArray;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpRequest;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.web.Servlets;

import com.google.common.collect.Maps;

import dxol.entity.Admin;
import dxol.entity.Course;
import dxol.entity.Identity;
import dxol.entity.School;
import dxol.entity.Student;
import dxol.entity.Summary;
import dxol.repository.CourseDao;
import dxol.service.account.ShiroDbRealm.ShiroUser;
import dxol.service.admin.AdminService;
import dxol.service.course.CourseService;
import dxol.service.identity.IdentityService;
import dxol.service.school.SchoolService;
import dxol.service.student.StudentService;
import dxol.service.summary.SummaryService;

/**
 * List page:
 * 
 * @author liuwei 实现学生信息增、删、查
 */
@Controller
@RequestMapping(value = "/admin/student")
public class StudentController {
	@Autowired
	private StudentService studentService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private SummaryService summaryService;
	@Autowired
	private SchoolService schoolService;
	@Autowired
	private IdentityService identityService;
	@Autowired
	private CourseDao courseDao;
	//private static final String PAGE_SIZE = "3";

	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("auto", "自动");
		sortTypes.put("title", "标题");
	}

	/**
	 * 取出Shiro中的当前用户Id.
	 */
	/*
	 * private Long getCurrentUserId() { ShiroUser user = (ShiroUser)
	 * SecurityUtils.getSubject().getPrincipal(); return user.id; }
	 */
	// 查询所有的学生，让他们显示在studentList.jsp页面
	@RequestMapping(value = { "list", "" })
	/*
	 * public String list(@RequestParam(value = "page", defaultValue = "1") int
	 * pageNumber,
	 * 
	 * @RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int
	 * pageSize,
	 * 
	 * @RequestParam(value = "sortType", defaultValue = "auto") String sortType,
	 * Model model, ServletRequest request) { Map<String, Object> searchParams =
	 * Servlets.getParametersStartingWith(request, "search_"); Long userId =
	 * getCurrentUserId();
	 * System.out.println("----------------------->>>>>>>>"+userId);
	 * Page<Student> students = studentService.getStudent(searchParams,
	 * pageNumber, pageSize, sortType);
	 * 
	 * System.out.println("----------------------->>>>>>>>");
	 * 
	 * for (Student student : students) {
	 * 
	 * System.out.println( student.getIdentity().getIdentityName()); }
	 * 
	 * model.addAttribute("students", students); model.addAttribute("sortType",
	 * sortType); model.addAttribute("sortTypes", sortTypes); //
	 * 将搜索条件编码成字符串，用于排序，分页的URL model.addAttribute("searchParams",
	 * Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
	 * 
	 * return "/admin/view/student/studentList";
	 * 
	 * }
	 */
	public String list(Model model) {
		List<Student> students = studentService.findAllStudent();

		model.addAttribute("students", students);
		System.out.println("<<<<<<<<-----------<<<<<<<");
		System.out.println(students);
		/*
		 * List<Admin> admins=adminService.findAllAdmin();
		 * System.out.println("<<<<<<<<-----------<<<<<<<");
		 * System.out.println(admins);
		 */
		return "/admin/view/student/studentList";

	}

	// 创建一个学生用户
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("student", new Student());
		List<School> schools = schoolService.findAllSchool();
		List<Identity> identities=identityService.findAllIdentity();
		model.addAttribute("identities",identities);
		model.addAttribute("schools", schools);
		/*
		 * Summary summary = new Summary(); summaryService.savesummary(summary);
		 * model.addAttribute("summary", summary);
		 */
		return "/admin/view/student/studentForm";
	}

	// 保存新创建的用户
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String create(Student newstudent,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "school_id") Long schoolId,
			@RequestParam(value = "identity_id") Long identityId) {
		System.out.println("<<<<<<<<<<<<<<<<--------->>>");
		// System.out.println(request.getParameter("school_id"));
		System.out.println(schoolId);
		System.out.println(identityId);
		/*
		 * String fileName = newstudent.getSummary().getFileName();
		 * System.out.println("----------->" + fileName);
		 */
		/*String identityName = newstudent.getIdentity().getIdentityName();
		System.out.println("----------->" + identityName);
*/
		/*
		 * String schoolName = newstudent.getSchool().getName();
		 * System.out.println("----------->" + schoolName);
		 */
		// newsummary.setFileName(fileName);
		// summary.setStudent(newstudent);
		/*
		 * System.out.println("----------->" + newsummary.getFileName()); //
		 * System
		 * .out.println("----------->"+summary.getStudent().getSchool().getName
		 * ()); System.out.println("----------->" + newsummary.getId());
		 * System.out.println("----------->" + newstudent.getId());
		 */
		// newstudent.setSummary(newsummary);
		// summaryService.savesummary(newsummary);
		// 找出数据库中所有的身份信息
		/*List<Identity> identities = identityService.findAllIdentity();
		// 将管理员输入的身份名与数据库中的身份名对比，找到相同的就将该相同身份名所对应的identity对象保存到student中
		// 从而实现数据库中student中identity_id字段的更新
		for (Identity identity : identities) {
			if (identityName.equals(identity.getIdentityName())) {
				newstudent.setIdentity(identity);
			}

		}*/
		/*
		 * List<School> schools = schoolService.findAllSchool(); for (School
		 * school : schools) { if (schoolName.equals(school.getName())) {
		 * newstudent.setSchool(school); } }
		 */
		School school = new School();
		school.setId(schoolId);
		newstudent.setSchool(school);
		Identity identity=new Identity();
		identity.setId(identityId);
		newstudent.setIdentity(identity);
		List<Course> courses=courseDao.findbyIdentityId(identityId);
		
		for (Course course : courses) {
			/*newstudent.getCourses().add(course);*/
			System.out.println("++++++++"+course);

		}
		studentService.saveStudent(newstudent);
		
		redirectAttributes.addFlashAttribute("message",
				"创建" + newstudent.getUsername() + "成功");

		return "redirect:/admin/student/";
	}

	// 删除当前用户

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id,
			RedirectAttributes redirectAttributes) {
		Student student = studentService.findStudentbyName(id);
		// 现根据学生id找到对应的summary，再根据summaryid将该summary删除 Summary
	
		Summary summary = student.getSummary(); // summary.setId(id);
		if (summary!=null&&summary.getId() != null)
			summaryService.deletesummary(summary.getId());
		studentService.deleteStudent(id);
		redirectAttributes.addFlashAttribute("message", "删除任务成功");
		return "redirect:/admin/student/";
	}
	@RequestMapping(value = "detail/{id}")
	public void detail(@PathVariable("id") Long id,
			Model model) {
		Student student = studentService.findStudentbyName(id);
		model.addAttribute("student", student);
}
}
