package dxol.web.ol;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dxol.entity.ExamInfo;
import dxol.entity.Student;
import dxol.service.account.ShiroDbRealm.ShiroUser;
import dxol.service.examinfo.ExaminfoService;
import dxol.service.student.StudentService;

@Controller
@RequestMapping(value = "/ol/test")
public class TestController {
	@Autowired
	private ExaminfoService examinfoService;
	@Autowired
	private StudentService studentService;

	@RequestMapping(value = "")
	public String list(Model model, HttpSession session) {
		List<ExamInfo> examInfos = examinfoService.getRandExaminfo();
		ShiroUser student = (ShiroUser) SecurityUtils.getSubject()
				.getPrincipal();

		Student currentStudent = studentService.findStudentbyName(student.id);
		/*
		 * Long[] a=new Long[examInfos.size()]; int i=0; for (ExamInfo
		 * examInfo:examInfos) { a[i]=examInfo.getId(); i++; } for (int j = 0; j
		 * < a.length; j++) { System.out.println(a[j]); }
		 */
		List<ExamInfo> list = new ArrayList<ExamInfo>();
		int i = 0;
		for (ExamInfo examInfo : examInfos) {

			if (examInfo.getIdentity().getId() == currentStudent.getIdentity()
					.getId() && i < 50) {
				System.out.println(examInfo.getId());
				list.add(examInfo);
				i++;

			}
		}

		model.addAttribute("list", list);
		session.setAttribute("list", list);
		if (currentStudent.getIsFinish() == 2)
			return "/ol/view/exam/startexam";
		return "/ol/view/exam/test";

	}

	@RequestMapping(value = "check")
	public String check(Model model, HttpSession session,
			RedirectAttributes redirectAttributes, HttpServletRequest request) {
		int grade = 0;
		int j = 0;
		String choice[] = new String[50];
		@SuppressWarnings("unchecked")
		List<ExamInfo> examInfos = (List<ExamInfo>) session
				.getAttribute("list");

		for (int i = 0; i < 50; i++)
			choice[i] = request.getParameter("choice" + "_" + i);
		for (int i = 0; i < 50; i++) {
			if (choice[i] != null)
				choice[i] =choice[i]; 
			else {
				choice[i] = "";
			}
		}
		for (ExamInfo examInfo : examInfos) {
			System.out.println(choice[j] + "*******"
					+ examInfo.getRightAnswer());
			if (choice[j].equals(examInfo.getRightAnswer()) && j < 50) {
				grade += 2;
			}
			j++;
		}
		
		System.out.println(request.getParameter("someTimer"));
		model.addAttribute("grade", grade);
		return "/ol/view/exam/grade";
	}
}