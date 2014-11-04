package dxol.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin")
public class TController {
	@RequestMapping(method = RequestMethod.GET)
	public String index() {
		return "admin/view/acount/index";
	}

	@RequestMapping(value = "login")
	public String login() {
		return "admin/view/acount/login";
	}
}
