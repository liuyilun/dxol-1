package dxol.web.admin;

import java.util.List;

import javax.validation.Valid;

import javassist.expr.NewArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dxol.entity.Admin;
import dxol.entity.School;
import dxol.service.admin.AdminService;
import dxol.service.school.SchoolService;

/**
 * List page:
 * 
 * @author liuwei 实现管理员信息增、删、查
 */
@Controller
@RequestMapping(value = "/manager")
public class AdminUpdateController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private SchoolService schoolService;

	// 当点击修改时，跳转到修改页面
	@RequestMapping(value = "update/{id}")
	public String updateForm(Model model) {
		List<School> schools = schoolService.findAllSchool();
		model.addAttribute("schools", schools);
		return "/admin/view/admins/adminForm";
	}

	// 将更改后的页面进行保存，并重定向到/student,然后重新查询所有的学生，让他们显示在studentList.jsp页面
	@RequestMapping(value = "save/{id}")
	public String update(@ModelAttribute("admin") Admin admin,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "school_id") Long schoolId) {
		School school=new School();
		school.setId(schoolId);
		admin.setSchool(school);
		adminService.updateAdmin(admin);
		redirectAttributes.addFlashAttribute("message",
				"更新" + admin.getUsername() + "成功");
		return "redirect:/manager/";
	}

	/**
	 * 使用@ModelAttribute, 实现Struts2
	 * Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此本方法在该方法中执行.
	 */
	@ModelAttribute("admin")
	public Admin getAdminId(@PathVariable("id") Long id) {
		return adminService.findAdminbyName(id);
	}
}
