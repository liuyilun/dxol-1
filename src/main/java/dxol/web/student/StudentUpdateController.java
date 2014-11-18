package dxol.web.student;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dxol.entity.Identity;
import dxol.entity.School;
import dxol.entity.Student;
import dxol.service.identity.IdentityService;
import dxol.service.school.SchoolService;
import dxol.service.student.StudentService;

/**
 * List page:
 * 
 * @author liuwei 实现学生信息修改
 */
@Controller
@RequestMapping(value = "/student")
public class StudentUpdateController {
	private StudentService studentService;
	@Autowired
	private SchoolService schoolService;
	@Autowired
	private IdentityService identityService;

	@Autowired
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	// 当点击修改时，跳转到修改页面
	@RequiresPermissions("user:edit")
	@RequestMapping(value = "update/{id}")
	public String updateForm(Model model) {
		List<School> schools = schoolService.findAllSchool();
		List<Identity> identities = identityService.findAllIdentity();
		model.addAttribute("identities", identities);
		model.addAttribute("schools", schools);
		return "/admin/view/student/studentForm";
	}

	// 将更改后的页面进行保存，并重定向到/student,然后重新查询所有的学生，让他们显示在studentList.jsp页面
	@RequestMapping(value = "save/{id}")
	public String update(@ModelAttribute("student") Student student,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "school_id") Long schoolId,
			@RequestParam(value = "identity_id") Long identityId) {
		School school = new School();
		school.setId(schoolId);
		student.setSchool(school);
		Identity identity=new Identity();
		identity.setId(identityId);
		student.setIdentity(identity);
		studentService.updateStudent(student);
		redirectAttributes.addFlashAttribute("message",
				"更新" + student.getUsername() + "成功");
		return "redirect:/student/";
	}

	/**
	 * 使用@ModelAttribute, 实现Struts2
	 * Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此本方法在该方法中执行.
	 */
	@ModelAttribute("student")
	public Student getStudentId(@PathVariable("id") Long id) {
		return studentService.findStudentbyName(id);
	}
}
