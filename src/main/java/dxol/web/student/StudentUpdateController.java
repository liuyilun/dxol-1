package dxol.web.student;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dxol.entity.Course;
import dxol.entity.Identity;
import dxol.entity.School;
import dxol.entity.Student;
import dxol.entity.Summary;
import dxol.service.course.CourseService;
import dxol.service.identity.IdentityService;
import dxol.service.school.SchoolService;
import dxol.service.student.StudentService;
import dxol.service.studentcourse.StudentCourseService;
import dxol.service.summary.SummaryService;

/**
 * List page:
 * 
 * @author liuwei 实现学生信息修改
 */
@Controller
@RequestMapping(value = "/admin/student")
public class StudentUpdateController {
	private static final String UPLOADDIR = "uploadDir/"; // 上传后放在哪个位置
	private StudentService studentService;
	@Autowired
	private SchoolService schoolService;
	@Autowired
	private IdentityService identityService;
	@Autowired
	private SummaryService summaryService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private StudentCourseService studentCourseService;
	@Autowired
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	// 当点击修改时，跳转到修改页面
	@RequiresPermissions("user:edit")
	@RequestMapping(value = "update/{id}")
	public String updateForm(Model model, @PathVariable("id") Long id) {
		List<School> schools = schoolService.findAllSchool();
		List<Identity> identities = identityService.findAllIdentity();
		model.addAttribute("identities", identities);
		model.addAttribute("schools", schools);
		model.addAttribute("student", studentService.findStudentbyName(id));
		return "/admin/view/student/studentForm";
	}

	// 将更改后的页面进行保存，并重定向到/student,然后重新查询所有的学生，让他们显示在studentList.jsp页面
	@RequestMapping(value = "save/{id}")
	public String update(@Valid @ModelAttribute("student") Student student, RedirectAttributes redirectAttributes,
			HttpServletRequest request, @PathVariable("id") Long id, @RequestParam(value = "school_id") Long schoolId,
			@RequestParam(value = "identity_id") Long identityId,String username1) {
		student.setUsername(username1);
		School school = new School();
		school.setId(schoolId);
		student.setSchool(school);
		Identity identity = new Identity();
		identity.setId(identityId);
		student.setIdentity(identity);
		
		Student student2 = studentService.findStudentbyName(id);
		System.out.println(identityId+"++++"+student2.getIdentity().getId());
		if (student2.getIdentity().getId() != identityId) {
			Summary summary=student2.getSummary();
			if ((summary != null) && (summary.getId() != null)) 
			summaryService.deletesummary(summary.getId());
			student.setGrade(0);
			student.setReqHour(0);
			student.setAltHour(0);
			student.setSummary(null);
			student.setSummaryUpTime(null);
			String ctxPath = request.getSession().getServletContext().getRealPath("/")
					+ StudentUpdateController.UPLOADDIR; // 获得服务器上存放下载资源的地址
			System.out.println(ctxPath);
			
			  String storeName = student2.getSummary().getPath();
			  String downLoadPath = ctxPath + storeName;
			  File file=new File(downLoadPath);
			  if(file.exists() && file.isFile())
			  file.delete();
			 
			List<Course> oldcourses = courseService.getCourseByIdentityId(student2.getIdentity().getId());
			for (Course course:oldcourses) {
				studentCourseService.deleteStudentCourseByCourseId(course.getId());
			}
			List<Course> courses = courseService.getCourseByIdentityId(student.getIdentity().getId());
			
			for (Course course : courses) {
				student.addCourse(course);
			}
			
			studentCourseService.saveStudentCourse(student.getCourses());
		}
		student.setRegisterDate(student2.getRegisterDate());
		student.setPassword(student2.getPassword());
		student.setSalt(student2.getSalt());
		studentService.updateStudent(student);
		redirectAttributes.addFlashAttribute("message", "更新" + student.getUsername() + "成功");
		return "redirect:/admin/student/";
	}

	/**
	 * 使用@ModelAttribute, 实现Struts2
	 * Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此本方法在该方法中执行.
	 */
	/*
	 * @ModelAttribute("student")
	 * public Student getStudentId(@PathVariable("id") Long id) {
	 * return studentService.findStudentbyName(id);
	 * }
	 */
}
