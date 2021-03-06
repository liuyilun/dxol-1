package dxol.web.account;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/success")
public class SuccessController {

	@RequestMapping(method = RequestMethod.GET)
	public String success() {

		if (SecurityUtils.getSubject().hasRole("student")) {
			return "redirect:/ol/success";
		} else if (SecurityUtils.getSubject().hasRole("admin")) {
			return "redirect:/admin/success";
		}
		return null;
	}
}
