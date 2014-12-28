package dxol.web.student;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.assertj.core.util.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Maps;

import dxol.entity.Course;
import dxol.entity.Identity;
import dxol.entity.School;
import dxol.entity.Student;
import dxol.entity.Summary;
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
	private static final String UPLOADDIR = "uploadDir/"; // 上传后放在哪个位置
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
	private static final String PAGE_SIZE = "10";
	
	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	private static List<String> paraNames = Lists.newArrayList();
	static {
		sortTypes.put("auto", "自动");
		sortTypes.put("username", "学号");
		sortTypes.put("name", "姓名");
		sortTypes.put("depart", "专业");
		paraNames.add("LIKE_username");
		paraNames.add("LIKE_name");
		paraNames.add("LIKE_depart");
	}
	/**
	 * Ajax请求校验loginName是否唯一。
	 */
	@RequestMapping(value = "checkUserName")
	@ResponseBody
	public String checkLoginName(@RequestParam("username") String username) {
		if (studentService.findStudentbyUserName(username) == null) {
			return "true";
		} else {
			return "false";
		}
	}

	/**
	 * 取出Shiro中的当前用户的学院信息.
	 */

	// 查询所有的学生，让他们显示在studentList.jsp页面

	@RequestMapping(method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
			ServletRequest request, @RequestParam(value = "searchPara", defaultValue = "") String searchPara) {

		Page<Student> students = studentService.getStudent(searchPara, pageNumber, pageSize, sortType);

		model.addAttribute("students", students);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		// 将搜索条件编码成字符串，用于排序，分页的URL

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
	public String create(Student newstudent, RedirectAttributes redirectAttributes,
			@RequestParam(value = "school_id") Long schoolId, @RequestParam(value = "identity_id") Long identityId) {

		School school = new School();
		school.setId(schoolId);
		newstudent.setSchool(school);

		Identity identity = new Identity();
		identity.setId(identityId);
		newstudent.setIdentity(identity);
		//List<Course> courses = courseService.getCourseByIdentityId(identityId);
		studentService.saveStudent(newstudent);
	/*	//List<StudentCourse> studentCourses=new ArrayList<StudentCourse>();
		for (Course course : courses) {
			System.out.println("#######" + course.getId());
			StudentCourse studentCourse = new StudentCourse();
			studentCourse.setCourse(course);
			studentCourse.setStudent(newstudent);
			studentCourse.setCourseId(course.getId());;
			studentCourse.setStudentId(newstudent.getId());;
			studentCourse.setTime(0);
			studentCourse.setHour(0);
			newstudent.getCourses().add(studentCourse);
			course.getStudents().add(studentCourse);
			//studentCourses.add(studentCourse);
			//studentCourseService.saveStudentCourse(studentCourse);

		studentCourseService.saveStudentCourse(newstudent.getCourses());*/
		

		// List<Course> courses = courseService.getCourseByIdentityId(identityId);
		//
		// for (Course course : courses) {
		// newstudent.addCourse(course);
		// }
		//
		// studentCourseService.saveStudentCourse(newstudent.getCourses());

		redirectAttributes.addFlashAttribute("message", "创建" + newstudent.getUsername() + "成功");

		return "redirect:/admin/student/";
	}

	// 删除当前用户

		@RequestMapping(value = "delete/{id}")
		public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes, HttpServletRequest request) {
			Student student = studentService.findStudentbyName(id);
			// 现根据学生id找到对应的summary，再根据summaryid将该summary删除 Summary

			Summary summary = student.getSummary(); // summary.setId(id);
			if ((summary != null) && (summary.getId() != null)) {
				summaryService.deletesummary(summary.getId());
				String ctxPath = request.getSession().getServletContext().getRealPath("/") + StudentController.UPLOADDIR; // 获得服务器上存放下载资源的地址
				System.out.println(ctxPath);

				String storeName = student.getSummary().getPath();
				String downLoadPath = ctxPath + storeName;
				File file = new File(downLoadPath);
				if (file.exists() && file.isFile()) {
					file.delete();
				}
			}
			// List<Course> oldcourses = courseService.getCourseByIdentityId(student.getIdentity().getId());
			// for (Course course : oldcourses) {
			studentCourseService.deleteStudentCourseByStudentId(student.getId());
			// }

			studentService.deleteStudent(id);
			redirectAttributes.addFlashAttribute("message", "删除成功");
			return "redirect:/admin/student/";
		}

		@RequestMapping(value = "detail/{id}")
		public void detail(@PathVariable("id") Long id, Model model) {
			Student student = studentService.findStudentbyName(id);
			model.addAttribute("student", student);
		}
	}
