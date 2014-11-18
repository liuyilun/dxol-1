package dxol.web.fileoperate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dxol.entity.Student;
import dxol.service.student.StudentService;
import dxol.util.FileOperateUtil;
@Controller
@RequestMapping(value = "background/fileOperate")
public class FileDownloadController {
	@Autowired
	private StudentService studentService;
	/**
	 * 下载
	 * 
	 * @author liuwei
	 * @date 2012-3-29 下午5:24:14
	 * @param attachment
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/download/{id}")
	public ModelAndView download(@ModelAttribute("student") Student student,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String storeName = student.getSummary().getPath();
		String realName = student.getSummary().getFileName();
		String contentType = "application/octet-stream";

		FileOperateUtil.download(request, response, storeName, contentType,
				realName);

		return null;
	}

	@ModelAttribute
	public Student getStudentId(@PathVariable("id") Long id) {
		return studentService.findStudentbyName(id);
	}
}
