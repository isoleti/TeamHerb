package project.healingcamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	//ȸ�� ���������� �̵�
	@RequestMapping(value="/adminPage_Member_List.do",method=RequestMethod.GET)
	public String adminPage_Member_List(Model model,SearchVO searchVO) {
		
		PageVO pageVO = new PageVO(searchVO,adminService.tatal(searchVO));
		List<UserVo> member_List = adminService.member_List(searchVO);
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("memberList", member_List);
		
		return "adminPage/adminPage_Member_List";
	}

	//ȸ��Ż��
	@RequestMapping(value="/member_delete.do",method=RequestMethod.POST)
	public String member_delete(UserVo userVo) {
		
		int result = adminService.delete_member(userVo);
		
		String usertype = userVo.getUsertype();
		
		if(usertype == "u") { //usertype�� u�̸�
			return "redirect:adminPage_Member_List.do"; //ȸ�������� �̵�
		}else {
			return "redirect:adminPage_Counseller_List.do";
		}
	}
	
	//ȸ������
	@RequestMapping(value="/adminPage_Shutdown_Period_Popup.do",method=RequestMethod.GET)
	public String adminPage_Shutdown_Period_Popup() {
		return "adminPage/adminPage_Shutdown_Period_Popup";
	}
	
	//���� ���������� �̵�
	@RequestMapping(value="/adminPage_Counseller_List.do",method=RequestMethod.GET)
	public String adminPage_Counseller_List(Model model,SearchVO searchVO) {
		
		PageVO pageVO = new PageVO(searchVO,adminService.counseller_total(searchVO));
		List<UserVo> counseller_List = adminService.counseller_List(searchVO);
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("counseller_List", counseller_List);
		
		return "adminPage/adminPage_Counseller_List";
	}
	
	
	//Ŀ�´�Ƽ �Խ��� �̵�
	@RequestMapping(value="/adminPage_Community_List.do",method=RequestMethod.GET)
	public String adminPage_Community_List(Model model,SearchVO searchVO) {
		
		//���������̼�(�˻�������)
		PageVO pageVO = new PageVO(searchVO,adminService.community_Total(searchVO));

		//��ü�Խñ� ������ ��û
		List<Community_BoardVO> community_List = adminService.community_List(searchVO);
		
		//�����͸� �𵨿� ��� ȭ�鿡 �ѱ�
		model.addAttribute("pageVO",pageVO);//���������̼� ����
		model.addAttribute("community_List",community_List);//�۸�� ����
		
		return "adminPage/adminPage_Community_List";
	}
	
	//�Խñ� ����
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
	
	//���� �Խ��� �̵�
	@RequestMapping(value="/adminPage_Counseller_Board_List.do",method=RequestMethod.GET)
	public String adminPage_Counseller_Board_List(Model model,SearchVO searchVO) {
		
		//���������̼�(�˻�������)
		PageVO pageVO = new PageVO(searchVO,adminService.counseller_total(searchVO));

		//��ü�Խñ� ������ ��û
		List<Community_BoardVO> counseller_board_list = adminService.counseller_board_list(searchVO);
		
		//�����͸� �𵨿� ��� ȭ�鿡 �ѱ�
		model.addAttribute("pageVO",pageVO);//���������̼� ����
		model.addAttribute("counseller_board_list",counseller_board_list);//�۸�� ����
		
		return "adminPage/adminPage_Counseller_Board_List";
	}
	
	//�������������� �̵�
	@RequestMapping(value="/adminPage_Notice_List.do",method=RequestMethod.GET)
	public String adminPage_Notice_List(Model model,SearchVO searchVO) {
		
		//���������̼�(�˻�������)
		PageVO pageVO = new PageVO(searchVO , adminService.notice_Total(searchVO)); 
		
		//��ü�Խñ� ������ ��û
		List<Community_BoardVO> notice_List = adminService.notice_List(searchVO);
		
		//�����͸� �𵨿� ��� ȭ�鿡 �ѱ�
		model.addAttribute("pageVO",pageVO);//���������̼� ����
		model.addAttribute("notice_List",notice_List);//�۸�� ����
		
		return "adminPage/adminPage_Notice_List";
	}
	
	//�������� �ۼ��ϱ������� �̵�
	@RequestMapping(value="adminPage_Notice_Write.do",method=RequestMethod.GET)
	public String adminPage_Notice_write() {
		return "adminPage/adminPage_Notice_Write";
	}
	
	//�������� �ۼ� �����ͻ���
	@RequestMapping(value="adminPage_Notice_Write.do",method=RequestMethod.POST)
	public String adminPage_Notice_write(Community_BoardVO cboardVO,HttpSession session,HttpServletRequest request) {
		
		UserVo login = (UserVo)session.getAttribute("login");
		
		cboardVO.setId(login.getId());			
		cboardVO.setUidx(login.getUidx());
		cboardVO.setIp(request.getRemoteAddr());
		int bType = cboardVO.getBoard_type();
		System.out.println("bType:"+bType);
		
		//�Խñ� �ۼ�
		int result = adminService.admin_Insert(cboardVO);
		System.out.println("result:"+result);
		
		if(bType == 2) {
			return "redirect:adminPage_Notice_List.do";
		}else {
			return "redirect:adminPage_Faq_List.do";
		}
		
	}
		
	//FAQ������ �̵�
	@RequestMapping(value="/adminPage_Faq_List.do",method=RequestMethod.GET)
	public String adminPage_Faq_List(Model model,SearchVO searchVO) {
		
		//���������̼�(�˻�������)
		PageVO pageVO = new PageVO(searchVO , adminService.faq_Total(searchVO)); 
		
		//��ü�Խñ� ������ ��û
		List<Community_BoardVO> faq_List = adminService.faq_List(searchVO);
		
		//�����͸� �𵨿� ��� ȭ�鿡 �ѱ�
		model.addAttribute("pageVO",pageVO);//���������̼� ����
		model.addAttribute("faq_List",faq_List);//�۸�� ����
		
		return "adminPage/adminPage_Faq_List";
	}
	
	//FAQ�ۼ� ������ �̵�
	@RequestMapping(value="/adminPage_Faq_Write.do",method=RequestMethod.GET)
	public String adminPage_Faq_Write() {
		return "adminPage/adminPage_Faq_Write";
	}
	
	//�Ű������� �̵�
	@RequestMapping(value="/adminPage_Report_List.do",method=RequestMethod.GET)
	public String adminPage_Report_List() {
		
		return "adminPage/adminPage_Report_List";
	}
}
