package project.healingcamp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.healingcamp.service.PageService;
import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.ReviewVo;

@RequestMapping("/page")
@Controller
public class PageController {
	
	@Autowired
	private PageService pageService;
	
	//마이페이지
	@RequestMapping(value="/mypageRes.do", method=RequestMethod.GET)
	public String mypageRes() {
		
		return "page/mypageRes"; 
	}
	@RequestMapping(value="/pwConfirm.do", method=RequestMethod.GET)
	public String pwConfirm() {
		
		return "page/pwConfirm";
	}
	
	@RequestMapping(value="/checkPw.do", method=RequestMethod.POST)
	public String checkPw(String pw) {
		
		return "page/userModify";
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
	
	@RequestMapping(value="mypageScrap.do", method=RequestMethod.GET)
	public String mypageScrap() {
		
		return "page/mypageScrap";
	}
	
	//상담사 페이지
	@RequestMapping(value="/counspageRes.do", method=RequestMethod.GET)
	public String counspageRes(Model model, ReserveVO vo) {
		
		List<ReserveVO> list = pageService.list(vo);
		
		model.addAttribute("datalist", list);
		
		return "page/counspageRes"; 
	}
	
	
	
	@RequestMapping(value="/counspageCou.do", method=RequestMethod.GET)
	public String counspageCou() {
		
		return "page/counspageCou"; 
	}
	
	@RequestMapping(value="/counspageWrite.do", method=RequestMethod.GET)
	public String counspageWrite() {
		
		return "page/counspageWrite"; 
	}
}