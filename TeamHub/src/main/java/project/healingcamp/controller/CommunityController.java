package project.healingcamp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.healingcamp.service.Community_BoardService;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.CriteriaVO;
import project.healingcamp.vo.SearchVO;

@RequestMapping(value="/community")
@Controller
public class CommunityController {
	
	@Autowired
	private Community_BoardService cboardService;
	
	//Ŀ�´�Ƽ ����Ʈ�� �̵�
	@RequestMapping(value="/community_list.do",method=RequestMethod.GET)
	public String community_list(Model model,SearchVO searchVO) {
		
		//��ü�Խñ� ������ ��û
		List<Community_BoardVO> list = cboardService.list(searchVO);
		System.out.println(searchVO.getSearchVal());
		System.out.println(searchVO.getSearchType());
		
		//�����͸� �𵨿� ��� ȭ�鿡 �ѱ�
		model.addAttribute("datalist",list);
		return "community/community_list";
	}
	
	//�Խý� �󼼺��� �̵�
	@RequestMapping(value="/community_view.do",method=RequestMethod.GET)
	public String community_view(int bidx,Model model) {
		
		//ȣ��� ����� vo�� ����
		Community_BoardVO vo = cboardService.selectByBidx(bidx);
		
		//model�� vo�� ��� ȭ�鿡 �ѱ�
		model.addAttribute("vo",vo);
		
		return "community/community_view";
	}
	
	//�Խñ� �ۼ� ������ �̵�
	@RequestMapping(value="/community_write.do",method=RequestMethod.GET)
	public String community_write() {
		return "community/community_write";
	}

}
