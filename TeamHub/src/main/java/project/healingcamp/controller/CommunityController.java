package project.healingcamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/community")
@Controller
public class CommunityController {
	
	@RequestMapping(value="/community_list.do",method=RequestMethod.GET)
	public String community_list() {
		return "community/community_list";
	}
	
	@RequestMapping(value="/community_write.do",method=RequestMethod.GET)
	public String community_write() {
		return "community/community_write";
	}

}
