package dxol.web.ol;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/ol/success")
public class OlSuccessController {
	@RequestMapping(method = RequestMethod.GET)
	public String success() {
		return "/ol/view/index";
	}

}
