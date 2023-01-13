package project.healingcamp.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller
public class HomeController {
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		
		return "home";
	}
	
	@RequestMapping(value = "/program.do", method = RequestMethod.GET)
	public String program() {
		
		return "program";
	}
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String test() {
		
		return "psychologicaltest";
	}
	@RequestMapping(value = "/joinMain.do", method = RequestMethod.GET) //링크는 무조건 get방식 
	public String joinMain() {
		
		return "/user/joinMain";
		
}
	
}

