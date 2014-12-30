package dxol.web.examinfo;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dxol.entity.Course;
import dxol.entity.ExamInfo;
import dxol.entity.Identity;
import dxol.repository.ExaminfoDao;
import dxol.repository.IdentityDao;
import dxol.service.course.CourseService;
import dxol.service.examinfo.ExaminfoService;

/**
 * Examinfo管理的Controller, 使用Restful风格的Urls:
 * 
 * List page : GET /task/
 * Create page : GET /task/create
 * Create action : POST /task/create
 * Update page : GET /task/update/{id}
 * Update action : POST /task/update
 * Delete action : GET /task/delete/{id}
 * 
 * @author calvin
 */
@Controller
@RequestMapping(value = "/admin/examinfo")
public class ExaminfoController {

	@Autowired
	private ExaminfoService examinfoService;
	@Autowired
	private IdentityDao identityDao;
	@Autowired
	private CourseService courseService;
	//将所有的考题显示到页面
	@RequestMapping(method = RequestMethod.GET)
	public String list( Model model,ServletRequest request) {
		List<ExamInfo> examinfos = new ArrayList<ExamInfo>();
		examinfos = examinfoService.getAllExaminfo();
		model.addAttribute("examinfos", examinfos);

		return "admin/view/examinfo/examinfoList";
	}
//请求创建考题页面
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("examinfo", new ExamInfo());
		model.addAttribute("action", "create");
		return "admin/view/examinfo/examinfoForm";
	}
   //提交创建考题请求
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@Valid ExamInfo newExaminfo, RedirectAttributes redirectAttributes,Long identity_id) {
		Identity identity = new Identity();
		identity.setId(identity_id);
		newExaminfo.setIdentity(identity);
		examinfoService.saveExaminfo(newExaminfo);
		
		redirectAttributes.addFlashAttribute("message", "创建试题成功");
		return "redirect:/admin/examinfo";
	}
 //请求修改考题页面
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("examinfo", examinfoService.getExaminfo(id));
		model.addAttribute("action", "update");
		return "admin/view/examinfo/examinfoForm";
	}
   //提交修改考题请求
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("examinfo") ExamInfo examinfo, 
			RedirectAttributes redirectAttributes,Long identity_id ) {
		Identity identity = identityDao.findOne(identity_id);
		examinfo.setIdentity(identity);
		examinfoService.saveExaminfo(examinfo);
		
		redirectAttributes.addFlashAttribute("message", "更新试题成功");
		return "redirect:/admin/examinfo";
	}
   //提交删除考题请求
	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		examinfoService.deleteExaminfo(id);
		
		redirectAttributes.addFlashAttribute("message", "删除试题成功");
		return "redirect:/admin/examinfo";
	}
	
	//将所有属于该课程的习题显示到页面
	@RequestMapping(value="show/{id}", method = RequestMethod.GET)
	public String showlist(@PathVariable("id") Long id, Model model){
		List<ExamInfo> examinfos = new ArrayList<ExamInfo>();
		examinfos = examinfoService.getExaminfoBycourseId(id);
		
		model.addAttribute("examinfos", examinfos);
		model.addAttribute("courseid", id);
		
		
		return "admin/view/exercise/exerciseList";
	}
	//请求增加习题页面
	@RequestMapping(value = "add/{id}",method = RequestMethod.GET)
	   public String addForm(Model model,@PathVariable("id")Long id){
			Course course = courseService.getCourse(id);
			model.addAttribute("examinfo", new ExamInfo());
			model.addAttribute("course",course);
			model.addAttribute("action", "add");
			
			return "admin/view/exercise/exerciseForm";
		   
	   }
	//提交增加习题请求
	@RequestMapping(value = "add",method= RequestMethod.POST)
	public String add(@Valid ExamInfo newExaminfo, RedirectAttributes redirectAttributes,
			Long identity_id,Long courseid){
		Identity identity = new Identity();
		identity.setId(identity_id);
		newExaminfo.setIdentity(identity);
		if(courseid != null){
			Course course = new Course();
			course.setId(courseid);
			newExaminfo.setCourse(course);
		}
		examinfoService.saveExaminfo(newExaminfo);
		redirectAttributes.addFlashAttribute("message", "创建练习题成功");
		
	return "redirect:show/"+courseid;
	//请求修改习题的页面
	}
	 @RequestMapping(value = "modify/{id}",method=RequestMethod.GET)
	    public String modifyForm(@PathVariable("id")Long id,Model model){
		 
	    	ExamInfo examinfo = examinfoService.getExaminfo(id);
	    	Course course = examinfo.getCourse();
	    	
	    	model.addAttribute("examinfo", examinfo);
	    	model.addAttribute("course", course);
	    	model.addAttribute("action","modify");
	    	return "admin/view/exercise/exerciseForm";
	    	
	}
	 //提交修改习题的请求
	 @RequestMapping(value ="modify",method=RequestMethod.POST)
	   public String modify(@Valid @ModelAttribute("examinfo") ExamInfo examinfo, 
				RedirectAttributes redirectAttributes){
		   Identity identity = identityDao.findOne(examinfo.getIdentity().getId());
			examinfo.setIdentity(identity);	
			Course course = courseService.getCourse(examinfo.getCourse().getId());
			examinfo.setCourse(course);
			Long courseid = course.getId();
			
			examinfoService.saveExaminfo(examinfo);
			redirectAttributes.addFlashAttribute("message", "更新练习题成功");	
			
			return "redirect:show/"+courseid;
		   
	   }
	 //提交删除习题请求
	@RequestMapping(value = "remove/{id}")
	public String remove(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		Long courseid = examinfoService.getExaminfo(id).getCourse().getId();
		examinfoService.deleteExaminfo(id);
		redirectAttributes.addFlashAttribute("message", "删除练习题成功");
		return "redirect:/admin/examinfo/show/"+courseid;
	}
	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getExaminfo(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("examinfo", examinfoService.getExaminfo(id));
		}
	}

	
}
