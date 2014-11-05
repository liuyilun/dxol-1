package dxol.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin/success")
public class AdminSuccessController {
	@RequestMapping(method = RequestMethod.GET)
	public String success() {
		return "/admin/view/acount/index";
	}

}
