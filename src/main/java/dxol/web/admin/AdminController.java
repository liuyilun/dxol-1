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
import org.springframework.web.bind.annotation.ResponseBody;
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
@RequestMapping(value = "/admin/manager")
public class AdminController {
	private AdminService adminService;

	@Autowired
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@Autowired
	private SchoolService schoolService;

	// @RequestMapping(value = { "adminlist", "" })
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		List<Admin> admins = adminService.findAllAdmin();
		System.out.println("<<<<<<<<-----------<<<<<<<");
		System.out.println(admins);
		model.addAttribute("admins", admins);
		return "/admin/view/admins/adminList";

	}

	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		List<School> schools = schoolService.findAllSchool();
		model.addAttribute("schools", schools);
		model.addAttribute("admin", new Admin());
		return "/admin/view/admins/adminForm";
	}

	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String create(@Valid Admin newadmin,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "school_id") Long schoolId) {
		//String schoolName = newadmin.getSchool().getName();
		//System.out.println("----------->" + schoolName);
		/*List<School> schools = schoolService.findAllSchool();
		for (School school : schools) {
			if (schoolName.equals(school.getName())) {
				newadmin.setSchool(school);
			}
		}*/
		School school=new School();
		school.setId(schoolId);
		newadmin.setSchool(school);
		adminService.saveAdmin(newadmin);
		redirectAttributes.addFlashAttribute("message",
				"创建" + newadmin.getUsername() + "成功");
		return "redirect:/admin/manager/";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id,
			RedirectAttributes redirectAttributes) {
		adminService.deleteAdmin(id);
		redirectAttributes.addFlashAttribute("message", "删除任务成功");
		return "redirect:/admin/manager/";
	}
	
	/**
	 * Ajax请求校验loginName是否唯一。
	 */
	@RequestMapping(value = "checkUserName")
	@ResponseBody
	public String checkLoginName(@RequestParam("username") String username) {
		if (adminService.findAdminbyUserName(username) == null) {
			return "true";
		} else {
			return "false";
		}
	}
}
