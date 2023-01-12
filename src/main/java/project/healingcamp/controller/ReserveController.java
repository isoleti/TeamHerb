package project.healingcamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/res")
@Controller
public class ReserveController {

	@RequestMapping(value="/findcenter.do" , method = RequestMethod.GET)
	public String findcenter() {
		
		return "res/findcenter";
	}
	
	@RequestMapping(value="/findcounselor.do" , method = RequestMethod.GET)
	public String findcounselor() {
		
		return "res/findcounselor";
	}
	
	@RequestMapping(value="/center.do" , method = RequestMethod.GET)
	public String center() {
		
		return "res/center";
	}
	
	@RequestMapping(value="/respage.do" , method = RequestMethod.GET)
	public String page() {
		
		return "res/respage";
	}
	
	@RequestMapping(value="/resf.do" , method = RequestMethod.GET)
	public String res() {
		
		return "res/resf";
	}
}
