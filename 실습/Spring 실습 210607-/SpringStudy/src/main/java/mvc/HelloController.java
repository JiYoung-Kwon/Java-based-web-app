package mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {
	
	@RequestMapping(value = "/hello.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView hello() {
		ModelAndView mv = new ModelAndView();
	
		//Model : model.addAttribute("msg", "~~~~")와 동일
		mv.addObject("msg", "Hi...spring !!!!");
		mv.setViewName("hello");
		
		return mv;
	}
}
