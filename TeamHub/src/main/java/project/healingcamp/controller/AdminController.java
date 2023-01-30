package project.healingcamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.healingcamp.service.AdminService;
import project.healingcamp.vo.Community_BoardVO;
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
	public String member_delete(UserVo userVo) {
		
		int result = adminService.delete_member(userVo);
		
		String usertype = userVo.getUsertype();
		
		if(usertype == "u") { //usertype이 u이면
			return "redirect:adminPage_Member_List.do"; //회원관리로 이동
		}else {
			return "redirect:adminPage_Counseller_List.do";
		}
	}
	
	//회원정지
	@RequestMapping(value="/adminPage_Shutdown_Period_Popup.do",method=RequestMethod.GET)
	public String adminPage_Shutdown_Period_Popup() {
		return "adminPage/adminPage_Shutdown_Period_Popup";
	}
	
	//상담사 관리페이지 이동
	@RequestMapping(value="/adminPage_Counseller_List.do",method=RequestMethod.GET)
	public String adminPage_Counseller_List(Model model,SearchVO searchVO) {
		
		PageVO pageVO = new PageVO(searchVO,adminService.counseller_total(searchVO));
		List<UserVo> counseller_List = adminService.counseller_List(searchVO);
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("counseller_List", counseller_List);
		
		return "adminPage/adminPage_Counseller_List";
	}
	
	
	//커뮤니티 게시판 이동
	@RequestMapping(value="/adminPage_Community_List.do",method=RequestMethod.GET)
	public String adminPage_Community_List(Model model,SearchVO searchVO) {
		
		//페이지네이션(검색어포함)
		PageVO pageVO = new PageVO(searchVO,adminService.community_Total(searchVO));

		//전체게시글 데이터 요청
		List<Community_BoardVO> community_List = adminService.community_List(searchVO);
		
		//데이터를 모델에 담아 화면에 넘김
		model.addAttribute("pageVO",pageVO);//페이지네이션 전달
		model.addAttribute("community_List",community_List);//글목록 전달
		
		return "adminPage/adminPage_Community_List";
	}
	
	//게시글 삭제
	@RequestMapping(value="/community_delete.do",method=RequestMethod.POST)
	public String community_delete(Community_BoardVO cboardVO) {
		adminService.community_DeleteByBidx(cboardVO);
		
		int bType =cboardVO.getBoard_type();
		
		if(bType == 0) {
			return "redirect:adminPage_Community_List.do";			
		}else if(bType == 1) {
			return "redirect:adminPage_Counseller_Board_List.do";			
		}else if(bType == 2){
			return "redirect:adminPage_Notice_List.do";
		}else {
			return "redirect:adminPage_Faq_List.do";
		}
	}
	
	//상담사 게시판 이동
	@RequestMapping(value="/adminPage_Counseller_Board_List.do",method=RequestMethod.GET)
	public String adminPage_Counseller_Board_List(Model model,SearchVO searchVO) {
		
		//페이지네이션(검색어포함)
		PageVO pageVO = new PageVO(searchVO,adminService.counseller_total(searchVO));

		//전체게시글 데이터 요청
		List<Community_BoardVO> counseller_board_list = adminService.counseller_board_list(searchVO);
		
		//데이터를 모델에 담아 화면에 넘김
		model.addAttribute("pageVO",pageVO);//페이지네이션 전달
		model.addAttribute("counseller_board_list",counseller_board_list);//글목록 전달
		
		return "adminPage/adminPage_Counseller_Board_List";
	}
	
	//공지사항페이지 이동
	@RequestMapping(value="/adminPage_Notice_List.do",method=RequestMethod.GET)
	public String adminPage_Notice_List(Model model,SearchVO searchVO) {
		
		//페이지네이션(검색어포함)
		PageVO pageVO = new PageVO(searchVO , adminService.notice_Total(searchVO)); 
		
		//전체게시글 데이터 요청
		List<Community_BoardVO> notice_List = adminService.notice_List(searchVO);
		
		//데이터를 모델에 담아 화면에 넘김
		model.addAttribute("pageVO",pageVO);//페이지네이션 전달
		model.addAttribute("notice_List",notice_List);//글목록 전달
		
		return "adminPage/adminPage_Notice_List";
	}
	
	//공지사항 작성하기페이지 이동
	@RequestMapping(value="adminPage_Notice_Write.do",method=RequestMethod.GET)
	public String adminPage_Notice_write() {
		return "adminPage/adminPage_Notice_Write";
	}
	
	//공지사항 작성 데이터삽입
	@RequestMapping(value="adminPage_Notice_Write.do",method=RequestMethod.POST)
	public String adminPage_Notice_write(Community_BoardVO cboardVO,HttpSession session,HttpServletRequest request) {
		
		UserVo login = (UserVo)session.getAttribute("login");
		
		cboardVO.setId(login.getId());			
		cboardVO.setUidx(login.getUidx());
		cboardVO.setIp(request.getRemoteAddr());
		int bType = cboardVO.getBoard_type();
		System.out.println("bType:"+bType);
		
		//게시글 작성
		int result = adminService.admin_Insert(cboardVO);
		System.out.println("result:"+result);
		
		if(bType == 2) {
			return "redirect:adminPage_Notice_List.do";
		}else {
			return "redirect:adminPage_Faq_List.do";
		}
		
	}
		
	//FAQ페이지 이동
	@RequestMapping(value="/adminPage_Faq_List.do",method=RequestMethod.GET)
	public String adminPage_Faq_List(Model model,SearchVO searchVO,HttpServletRequest request) {
		
		//페이지네이션(검색어포함)
		PageVO pageVO = new PageVO(searchVO , adminService.faq_Total(searchVO)); 
		
		//전체게시글 데이터 요청
		List<Community_BoardVO> faq_List = adminService.faq_List(searchVO);
		//데이터를 모델에 담아 화면에 넘김
		model.addAttribute("pageVO",pageVO);//페이지네이션 전달
		model.addAttribute("faq_List",faq_List);//글목록 전달
		model.addAttribute("category",request.getParameter("category")); // 카테고리 전달
		
		return "adminPage/adminPage_Faq_List";
	}
	
	//FAQ작성 페이지 이동
	@RequestMapping(value="/adminPage_Faq_Write.do",method=RequestMethod.GET)
	public String adminPage_Faq_Write() {
		return "adminPage/adminPage_Faq_Write";
	}
	
	//신고페이지 이동
	@RequestMapping(value="/adminPage_Report_List.do",method=RequestMethod.GET)
	public String adminPage_Report_List() {
		
		return "adminPage/adminPage_Report_List";
	}
}
