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

		//��ü�Խñ� ������ ��û
		List<Community_BoardVO> list = cboardService.list(searchVO);
		System.out.println(searchVO.getSearchType());
		System.out.println(searchVO.getSearchVal());
		
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
	
	@RequestMapping(value="/community_modify.do",method=RequestMethod.GET)
	public String community_modify(int bidx,Model model) {
		
		Community_BoardVO vo = cboardService.selectByBidx(bidx);
		System.out.println("bidx?"+bidx);
		model.addAttribute("vo",vo);
		
		return "community/community_modify";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
