package dxol.web.ol;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dxol.entity.Student;
import dxol.service.account.ShiroDbRealm.ShiroUser;
import dxol.service.student.StudentService;

@Controller
@RequestMapping(value = "/ol/success")
public class OlSuccessController {

	@Autowired
	private StudentService studentService;

	@RequestMapping(method = RequestMethod.GET)
	public String success(Model model) {
		ShiroUser student = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		Student loginStudent = studentService.findStudentbyName(student.id);
		model.addAttribute("currentStudent", loginStudent);
		return "/ol/view/index";
	}
}
