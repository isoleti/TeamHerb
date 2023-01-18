package project.healingcamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.healingcamp.service.Community_BoardService;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.PageVO;
import project.healingcamp.vo.SearchVO;
import project.healingcamp.vo.UserVo;

@RequestMapping(value="/counseller_board")
@Controller
public class CounsellerController {
	
	@Autowired
	private Community_BoardService cboardService;

	//����Խ��� �̵�
	@RequestMapping(value="/counseller_board_list.do",method=RequestMethod.GET)
	public String counseller_board_list(Model model,SearchVO searchVO) {
		
		//���������̼�(�˻�������)
		PageVO pageVO = new PageVO(searchVO,cboardService.counseller_board_total(searchVO));
		
		//��ü�Խñ� ������ ��û
		List<Community_BoardVO> list = cboardService.counseller_board_list(searchVO);

		//�����͸� �𵨿� ��� ȭ�鿡 �ѱ�
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("datalist", list);
		
		return "counseller_board/counseller_board_list";
	}
	
	//���� �Խ��� �Խñ� �󼼺���
	@RequestMapping(value="/counseller_board_view.do",method=RequestMethod.GET)
	public String counseller_board_view(int bidx,Model model) {
		
		cboardService.counseller_board_hitCount(bidx);
		Community_BoardVO vo = cboardService.counseller_selectByBidx(bidx);
		model.addAttribute("vo", vo);
		
		return "counseller_board/counseller_board_view";
	}
	
	//���� �Խ��� �Խñ� �ۼ������� �̵�
	@RequestMapping(value="/counseller_board_write.do",method=RequestMethod.GET)
	public String counseller_board_write() {
		return "counseller_board/counseller_board_write";
	}
	
	@RequestMapping(value="/counseller_board_write.do",method=RequestMethod.POST)
	public String counseller_board_write(Community_BoardVO cboardVO,HttpSession session,HttpServletRequest request) {
		
		UserVo login = (UserVo)session.getAttribute("login");
		cboardVO.setId(login.getId());
		cboardVO.setUidx(login.getUidx());
		cboardVO.setIp(request.getRemoteAddr());
		
		int result = cboardService.counseller_board_insert(cboardVO);
		int bidx = cboardService.counseller_board_maxBidx();

		return "redirect:counseller_board_view.do?bidx="+bidx;
	}
	
	//�Խñ� ���������� �̵�
	@RequestMapping(value="/counseller_board_modify.do",method=RequestMethod.GET)
	public String counseller_board_modify(int bidx,Model model) {
		
		Community_BoardVO vo = cboardService.counseller_selectByBidx(bidx);
		model.addAttribute("vo", vo);
		
		return  "counseller_board/counseller_board_modify";
	}
	
	@RequestMapping(value="/counseller_board_modify.do",method=RequestMethod.POST)
	public String counseller_board_modify(Community_BoardVO cboardVO) {
		
		int result = cboardService.counseller_board_modifyByBidx(cboardVO);
		
		return "redirect:counseller_board_view.do?bidx="+cboardVO.getBidx();
	} 
	
	//�Խñ� ����
	@RequestMapping(value="/counseller_board_delete.do",method=RequestMethod.POST)
	public String counseller_board_delete(int bidx) {
		
		cboardService.counseller_board_deleteByBidx(bidx);
		
		return "redirect:counseller_board_list.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
