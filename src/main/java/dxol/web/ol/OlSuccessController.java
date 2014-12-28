package dxol.web.ol;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String success(HttpSession session) {
		if (SecurityUtils.getSubject().isAuthenticated() && (session.getAttribute("currentStudent") != null)) {
			return "/ol/view/index";
		}
		ShiroUser student = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		Student loginStudent = studentService.findStudentbyName(student.id);
		session.setAttribute("currentStudent", loginStudent);
		return "/ol/view/index";
	}
}
