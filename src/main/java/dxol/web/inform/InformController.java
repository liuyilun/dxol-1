package dxol.web.inform;

import java.util.Map;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springside.modules.web.Servlets;

import com.google.common.collect.Maps;

import dxol.entity.Inform;
import dxol.service.inform.InformService;

@Controller
@RequestMapping(value = "/inform")

public class InformController {
	
	
	private static final String PAGE_SIZE = "10";

	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("auto", "自动");
		sortTypes.put("title", "标题");
	}
	
	@Autowired
	InformService informService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String informList(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
			ServletRequest request){
		
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");

		Page<Inform> informs = informService.getInformList( searchParams, pageNumber, pageSize, sortType);

		model.addAttribute("informs", informs);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

		return "inform/view/list";
	}
	
	@RequestMapping(value="{id}")
	public String informView(@PathVariable("id") Long id,Model model){
		model.addAttribute("inform", informService.getInform(id));
		return "inform/view/view";
		
	}


}
