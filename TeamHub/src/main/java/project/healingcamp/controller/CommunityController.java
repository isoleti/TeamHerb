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

@RequestMapping(value="/community")
@Controller
public class CommunityController {
	
	@Autowired
	private Community_BoardService cboardService;
	
	//Ŀ�´�Ƽ ����Ʈ �̵�
	@RequestMapping(value="/community_list.do",method=RequestMethod.GET)
	public String community_list(Model model,SearchVO searchVO) {

		//���������̼�(�˻�������)
		PageVO pageVO = new PageVO(searchVO,cboardService.total(searchVO));
		System.out.println("pageVO:"+pageVO);

		//��ü�Խñ� ������ ��û
		List<Community_BoardVO> list = cboardService.list(searchVO);
		
		//�����͸� �𵨿� ��� ȭ�鿡 �ѱ�
		model.addAttribute("pageVO",pageVO);//���������̼� ����
		model.addAttribute("datalist",list);//�۸�� ����
		return "community/community_list";
	}
	
	//�Խñ� �󼼺��� �̵�
	@RequestMapping(value="/community_view.do",method=RequestMethod.GET)
	public String community_view(int bidx,Model model) {
		
		//ȣ��� ����� vo�� ����
		Community_BoardVO vo = cboardService.selectByBidx(bidx);
		//��ȸ�� ����
		cboardService.hitCount(bidx);
		
		//model�� vo�� ��� ȭ�鿡 �ѱ�
		model.addAttribute("vo",vo);
		
		System.out.println("bidx?"+bidx);
		
		return "community/community_view";
	}
	
	//�Խñ� �ۼ� ������ �̵�
	@RequestMapping(value="/community_write.do",method=RequestMethod.GET)
	public String community_write() {
		return "community/community_write";
	}
	
	@RequestMapping(value="/community_write.do",method=RequestMethod.POST)
	public String community_write(Community_BoardVO cboardVO,HttpSession session,HttpServletRequest request) {
		
		UserVo login = (UserVo)session.getAttribute("login");
		
		cboardVO.setId(login.getId());			
		cboardVO.setUidx(login.getUidx());
		cboardVO.setIp(request.getRemoteAddr());
		
		cboardService.insert(cboardVO);
		int bidx = cboardService.maxBidx();
		
		return "redirect:community_view.do?bidx="+bidx;
	}
	
	//�Խñ� ���������� �̵�
	@RequestMapping(value="/community_modify.do",method=RequestMethod.GET)
	public String community_modify(int bidx,Model model) {
		
		//�ۼ��� �Խñ��� ī�װ��� ����Ʈ�� ����
		List<Community_BoardVO> categoryList = cboardService.categoryList();
		Community_BoardVO vo = cboardService.selectByBidx(bidx);
		
		model.addAttribute("vo",vo);
		model.addAttribute("categoryList",categoryList);
		return "community/community_modify";
	}
	
	@RequestMapping(value="/community_modify.do",method=RequestMethod.POST)
	public String community_modify(Community_BoardVO cboardVO) {
		
		int result = cboardService.modifyByBidx(cboardVO);
		
		return "redirect:community_view.do?bidx="+cboardVO.getBidx();
	}

	//�Խñ� ����
	@RequestMapping(value="/community_delete.do",method=RequestMethod.POST)
	public String delete(int bidx) {
		
		cboardService.deleteByBidx(bidx);
		
		return "redirect:community_list.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
