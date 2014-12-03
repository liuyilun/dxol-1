package dxol.web.ol;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springside.modules.utils.Clock;

import dxol.entity.Student;
import dxol.entity.Summary;
import dxol.service.account.ShiroDbRealm.ShiroUser;
import dxol.service.student.StudentService;
import dxol.service.summary.SummaryService;
import dxol.util.FileOperateUtil;

@Controller
@RequestMapping(value = "/ol/summary")
public class SummaryUploadController {

	@Autowired
	private StudentService studentService;
	@Autowired
	private SummaryService summaryService;

	@RequestMapping(method = RequestMethod.POST)
	public String upload(HttpServletRequest request, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		// 别名
		String[] alaises = ServletRequestUtils.getStringParameters(request, "alais");
		System.out.println("!!!!!!!!!!!!");
		System.out.println(alaises);
		String[] params = new String[] { "alais" };
		Map<String, Object[]> values = new HashMap<String, Object[]>();

		List<Map<String, Object>> result = FileOperateUtil.upload(request, params, values);

		String storeName = null;
		// result.get("storeName");
		String realName = null;
		// result.get("realName");
		for (Map<String, Object> map2 : result) {
			for (Map.Entry<String, Object> r : map2.entrySet()) {
				if ("realName".equals(r.getKey())) {
					realName = (String) r.getValue();
				}
				if ("storeName".equals(r.getKey())) {
					storeName = (String) r.getValue();
				}
			}
		}
		System.out.println("storeName = = = " + storeName + "realName = = =" + realName);
		Student currentStudent = getCurrentStudent();
		Summary summary = new Summary();
		summary.setPath(storeName);
		summary.setFileName(realName);
		summary.setStudent(currentStudent);

		summaryService.savesummary(summary);
		currentStudent.setSummary(summary);
		currentStudent.setSummaryUpTime(Clock.DEFAULT.getCurrentDate());
		studentService.saveStudent(currentStudent);
		map.put("result", result);
		return "redirect:/ol/success";
	}

	private Student getCurrentStudent() {
		ShiroUser student = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		Student loginStudent = studentService.findStudentbyName(student.id);
		return loginStudent;
	}

}
