package project.healingcamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/page")
@Controller
public class PageController {
	
	@RequestMapping(value="/mypageRes.do", method=RequestMethod.GET)
	public String mypageRes() {
		
		return "page/mypageRes"; 
	}
	
	@RequestMapping(value="/pwConfirm.do", method=RequestMethod.GET)
	public String pwConfirm() {
		
		return "page/pwConfirm";
	}
	
	@RequestMapping(value="/userModify.do", method=RequestMethod.GET)
	public String userModify() {
		
		return "page/userModify";
	}
	
	@RequestMapping(value="userDel.do", method=RequestMethod.GET)
	public String userDel() {
		
		return "page/userDel";
	}
	
	@RequestMapping(value="mypageCouns.do", method=RequestMethod.GET)
	public String mypageCouns() {
		
		return "page/mypageCouns";
	}
	
	@RequestMapping(value="mypageCount.do", method=RequestMethod.GET)
	public String mypageCount() {
		
		return "page/mypageCount";
	}
	
	@RequestMapping(value="mypageWrite.do", method=RequestMethod.GET)
	public String mypageWrite() {
		
		return "page/mypageWrite";
	}
	@RequestMapping(value="mypageReview.do", method=RequestMethod.GET)
	public String mypageReview() {
		
		return "page/mypageReview";
	}
	@RequestMapping(value="mypageReviewList.do", method=RequestMethod.GET)
	public String mypageReviewList() {
		
		return "page/mypageReviewList";
	}
	@RequestMapping(value="mypageScrap.do", method=RequestMethod.GET)
	public String mypageScrap() {
		
		return "page/mypageScrap";
	}
}