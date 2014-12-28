package dxol.web.help;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value ="help")
public class HelpController {
	@RequestMapping(method= RequestMethod.GET)
	public String view(){
		return "inform/view/help";
	}

}
