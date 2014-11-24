package dxol.web.student;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javassist.expr.NewArray;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
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
import dxol.entity.StudentCourse;
import dxol.entity.Summary;
import dxol.repository.CourseDao;
import dxol.service.account.ShiroDbRealm.ShiroUser;
import dxol.service.admin.AdminService;
import dxol.service.course.CourseService;
import dxol.service.identity.IdentityService;
import dxol.service.school.SchoolService;
import dxol.service.student.StudentService;
import dxol.service.studentcourse.StudentCourseService;
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
	private CourseService courseService;
	@Autowired
	private StudentCourseService studentCourseService;
	// private static final String PAGE_SIZE = "3";

	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("auto", "自动");
		sortTypes.put("title", "标题");
	}

	/**
	 * 取出Shiro中的当前用户的学院信息.
	 */

	private Long getCurrentUserschool() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		Admin admin = adminService.findAdminbyName(user.id);
		return admin.getSchool().getId();
	}

	// 查询所有的学生，让他们显示在studentList.jsp页面
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
	@RequestMapping(value = { "list", "" })
	public String list(Model model) {
		if (SecurityUtils.getSubject().hasRole("super")) {
			List<Student> students = studentService.findAllStudent();
			model.addAttribute("students", students);
		} else if (SecurityUtils.getSubject().hasRole("admin")) {
			List<Student> students = studentService
					.findstudentbyschool(getCurrentUserschool());
			model.addAttribute("students", students);
		}
		return "/admin/view/student/studentList";

	}

	// 创建一个学生用户
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("student", new Student());
		List<School> schools = schoolService.findAllSchool();
		List<Identity> identities = identityService.findAllIdentity();
		model.addAttribute("identities", identities);
		model.addAttribute("schools", schools);
		return "/admin/view/student/studentForm";
	}

	// 保存新创建的用户
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String create(Student newstudent,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "school_id") Long schoolId,
			@RequestParam(value = "identity_id") Long identityId) {
		School school = new School();
		school.setId(schoolId);
		newstudent.setSchool(school);
		Identity identity = new Identity();
		identity.setId(identityId);
		newstudent.setIdentity(identity);
		List<Course> courses = courseService.getCourseByIdentityId(identityId);
		//List<StudentCourse> studentCourses=new ArrayList<StudentCourse>();
		for (Course course : courses) {
			System.out.println("#######" + course.getId());
			StudentCourse studentCourse = new StudentCourse();
			studentCourse.setCourse_id(course.getId());;
			studentCourse.setStudent_id(newstudent.getId());;
			studentCourse.setTime(0);
			studentCourse.setHour(0);
			//newstudent.getCourses().add(studentCourse);
			//course.getStudents().add(studentCourse);
			//studentCourses.add(studentCourse);
			studentCourseService.saveStudentCourse(studentCourse);

		}
		//newstudent.setCourses(studentCourses);
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
		if (summary != null && summary.getId() != null)
			summaryService.deletesummary(summary.getId());
		studentService.deleteStudent(id);
		redirectAttributes.addFlashAttribute("message", "删除任务成功");
		return "redirect:/admin/student/";
	}

	@RequestMapping(value = "detail/{id}")
	public void detail(@PathVariable("id") Long id, Model model) {
		Student student = studentService.findStudentbyName(id);
		model.addAttribute("student", student);
	}
}
