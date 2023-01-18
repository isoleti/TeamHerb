package project.healingcamp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.healingcamp.service.AdminService;
import project.healingcamp.vo.PageVO;
import project.healingcamp.vo.SearchVO;
import project.healingcamp.vo.UserVo;

@RequestMapping(value="/adminPage")
@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	//회원 관리페이지 이동
	@RequestMapping(value="/adminPage_Member_List.do",method=RequestMethod.GET)
	public String adminPage_Member_List(Model model,SearchVO searchVO) {
		
		PageVO pageVO = new PageVO(searchVO,adminService.tatal(searchVO));
		List<UserVo> member_List = adminService.member_List(searchVO);
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("memberList", member_List);
		
		return "adminPage/adminPage_Member_List";
	}

	//회원탈퇴
	@RequestMapping(value="/member_delete.do",method=RequestMethod.POST)
	public String member_delete(int uidx) {
		
		int result = adminService.delete_member(uidx);
		System.out.println("result:"+result);
		return "redirect:adminPage_Member_List.do";
	}
	
	//상담사 관리페이지 이동
	@RequestMapping(value="/adminPage_Counseller_List.do",method=RequestMethod.GET)
	public String adminPage_Counseller_List() {
		
		return "adminPage/adminPage_Counseller_List";
	}
	
	//커뮤니티 게시판 이동
	@RequestMapping(value="/adminPage_Community_List.do",method=RequestMethod.GET)
	public String adminPage_Community_List() {
		
		return "adminPage/adminPage_Community_List";
	}
	
	//상담사 게시판 이동
	@RequestMapping(value="/adminPage_Counseller_Board_List.do",method=RequestMethod.GET)
	public String adminPage_Counseller_Board_List() {
		
		return "adminPage/adminPage_Counseller_Board_List";
	}
	
	//공지사항페이지 이동
	@RequestMapping(value="/adminPage_Notice_List.do",method=RequestMethod.GET)
	public String adminPage_Notice_List() {
		
		return "adminPage/adminPage_Notice_List";
	}
		
	//FAQ페이지 이동
	@RequestMapping(value="/adminPage_Faq_List.do",method=RequestMethod.GET)
	public String adminPage_Faq_List() {
		
		return "adminPage/adminPage_Faq_List";
	}
	
	//FAQ페이지 이동
	@RequestMapping(value="/adminPage_Report_List.do",method=RequestMethod.GET)
	public String adminPage_Report_List() {
		
		return "adminPage/adminPage_Report_List";
	}
}
