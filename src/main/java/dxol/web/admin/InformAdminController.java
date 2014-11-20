package dxol.web.admin;

import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Maps;

import dxol.entity.Inform;
import dxol.service.inform.InformService;

@Controller
@RequestMapping(value = "/admin/informAdmin")
public class InformAdminController {

	private static final String PAGE_SIZE = "5";

	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("auto", "自动");
		sortTypes.put("title", "标题");
	}

	@Autowired
	private InformService informService;

	@RequestMapping(method = RequestMethod.GET)
	public String informList(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
			ServletRequest request) {

		// Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");

		// Page<Inform> infroms = informService.getInformList(searchParams, pageNumber, pageSize, sortType);

		model.addAttribute("informs", informService.getInformList());
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		// model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

		return "admin/view/inform/list";
	}

	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("inform", new Inform());
		model.addAttribute("action", "create");
		return "admin/view/inform/informForm";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@Valid Inform newInform, RedirectAttributes redirectAttributes) {

		informService.saveInform(newInform);
		redirectAttributes.addFlashAttribute("message", "添加成功");
		return "redirect:/admin/informAdmin";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes attributes) {
		informService.deleteInform(id);
		attributes.addFlashAttribute("message", "删除成功");
		return "redirect:/admin/informAdmin";

	}

	@RequestMapping(value = "modify/{id}", method = RequestMethod.GET)
	public String modifyForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("inform", informService.getInform(id));
		model.addAttribute("action", "modify");
		return "admin/view/inform/informForm";
	}

	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modify(@Valid @ModelAttribute("inform") Inform inform, RedirectAttributes redirectAttributes) {
		informService.saveInform(inform);
		redirectAttributes.addFlashAttribute("message", "修改成功");
		return "redirect:/admin/informAdmin";

	}
	@RequestMapping(value = "view/{id}",method = RequestMethod.GET)
	@ResponseBody
	public Inform view(@PathVariable("id") Long id){
		return informService.getInform(id);
	}

}
