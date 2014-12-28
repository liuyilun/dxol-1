package dxol.web.ol;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.utils.Clock;

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
	private final static int QUESTION_NUMBER=50;
	private Clock clock = Clock.DEFAULT;
	//随机出题
	@RequestMapping(value = "")
	public String list(Model model, HttpSession session) {
		ShiroUser student = (ShiroUser) SecurityUtils.getSubject()
				.getPrincipal();

		Student currentStudent = studentService.findStudentbyName(student.id);
		/*SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");*/ 
		if(session.getAttribute("list")==null){
		List<ExamInfo> examInfos = examinfoService.getRandExaminfo();
		/*
		 * Long[] a=new Long[examInfos.size()]; int i=0; for (ExamInfo
		 * examInfo:examInfos) { a[i]=examInfo.getId(); i++; } for (int j = 0; j
		 * < a.length; j++) { System.out.println(a[j]); }
		 */
		List<ExamInfo> list = new ArrayList<ExamInfo>();
		int i = 0;
		for (ExamInfo examInfo : examInfos) {

			if (examInfo.getIdentity().getId() == currentStudent.getIdentity()
					.getId() && i < QUESTION_NUMBER&&examInfo.getCourse()==null) {
				System.out.println(examInfo.getId());
				list.add(examInfo);
				i++;

			}
		}
		
		model.addAttribute("list", list);
		session.setAttribute("list", list);
		
		Date dateStart=clock.getCurrentDate();
		session.setAttribute("currentTime", dateStart.getTime());
		}
		Date dateStop=clock.getCurrentDate();
		session.setAttribute("refreshcurrentTime", dateStop.getTime());
		
	    //毫秒ms
		long diff=(Long)session.getAttribute("refreshcurrentTime")-(Long) session.getAttribute("currentTime");
	    long diffs=diff/1000%60+60*(diff/(60*1000)%60); 
	    session.setAttribute("diffs", 2700-diffs);//考试时间
	    session.setAttribute("warnTime", 2400000-diffs*1000);//考试剩5分钟提醒
	    session.setAttribute("autosmtTime", 2700000-diffs*1000);//自动提交时间
		if (currentStudent.getIsFinish() == 2&&currentStudent.getExamTime()>0)
			return "/ol/view/exam/startexam";
		model.addAttribute("examTime", currentStudent.getExamTime());
		return "/ol/view/exam/test";
		
	}
	//批改试卷
	@RequestMapping(value = "check")
	public String check(Model model, HttpSession session,
			RedirectAttributes redirectAttributes, HttpServletRequest request) {
		ShiroUser student = (ShiroUser) SecurityUtils.getSubject()
				.getPrincipal();

		Student currentStudent = studentService.findStudentbyName(student.id);
		int grade = 0;
		int j = 0;
		String choice[] = new String[QUESTION_NUMBER];
		@SuppressWarnings("unchecked")
		List<ExamInfo> examInfos = (List<ExamInfo>) session
				.getAttribute("list");

		for (int i = 0; i < QUESTION_NUMBER; i++)
			choice[i] = request.getParameter("choice" + "_" + i);
		for (int i = 0; i < QUESTION_NUMBER; i++) {
			if (choice[i] != null)
				choice[i] =choice[i]; 
			else {
				choice[i] = "";
			}
		}
		for (ExamInfo examInfo : examInfos) {
			System.out.println(choice[j] + "*******"
					+ examInfo.getRightAnswer());
			if (choice[j].equals(examInfo.getRightAnswer()) && j < QUESTION_NUMBER) {
				grade += 2;
			}
			j++;
		}
		session.removeAttribute("list");
		model.addAttribute("grade", grade);
		Integer examTime=currentStudent.getExamTime();
		examTime--;
		if(studentService.findStudentbyName(currentStudent.getId()).getGrade()<grade)
		currentStudent.setGrade(grade);
		currentStudent.setExamTime(examTime);
		studentService.saveStudent(currentStudent);
		model.addAttribute("examTime", examTime);
		return "/ol/view/exam/grade";
	}
}