package project.healingcamp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.healingcamp.service.Community_BoardService;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.PageVO;
import project.healingcamp.vo.SearchVO;

@RequestMapping(value="/community")
@Controller
public class CommunityController {
	
	@Autowired
	private Community_BoardService cboardService;
	
	//커뮤니티 리스트 이동
	@RequestMapping(value="/community_list.do",method=RequestMethod.GET)
	public String community_list(Model model,SearchVO searchVO) {

		//페이지네이션(검색어포함)
		PageVO pageVO = new PageVO(searchVO,cboardService.total(searchVO));

		//전체게시글 데이터 요청
		List<Community_BoardVO> list = cboardService.list(searchVO);
		System.out.println(searchVO.getSearchType());
		System.out.println(searchVO.getSearchVal());
		
		//데이터를 모델에 담아 화면에 넘김
		model.addAttribute("pageVO",pageVO);//페이지네이션 전달
		model.addAttribute("datalist",list);//글목록 전달
		return "community/community_list";
	}
	
	//게시글 상세보기 이동
	@RequestMapping(value="/community_view.do",method=RequestMethod.GET)
	public String community_view(int bidx,Model model) {
		
		//호출된 결과를 vo에 담음
		Community_BoardVO vo = cboardService.selectByBidx(bidx);
		
		//model에 vo를 담아 화면에 넘김
		model.addAttribute("vo",vo);
		
		return "community/community_view";
	}
	
	//게시글 작성 페이지 이동
	@RequestMapping(value="/community_write.do",method=RequestMethod.GET)
	public String community_write() {
		return "community/community_write";
	}

}
