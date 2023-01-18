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

@RequestMapping(value="/counseller_board")
@Controller
public class CounsellerController {
	
	@Autowired
	private Community_BoardService cboardService;

	//상담사게시판 이동
	@RequestMapping(value="/counseller_board_list.do",method=RequestMethod.GET)
	public String counseller_board_list(Model model,SearchVO searchVO) {
		
		//페이지네이션(검색어포함)
		PageVO pageVO = new PageVO(searchVO,cboardService.counseller_board_total(searchVO));
		
		//전체게시글 데이터 요청
		List<Community_BoardVO> list = cboardService.counseller_board_list(searchVO);

		//데이터를 모델에 담아 화면에 넘김
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("datalist", list);
		
		return "counseller_board/counseller_board_list";
	}
	
	//상담사 게시판 게시글 상세보기
	@RequestMapping(value="/counseller_board_view.do",method=RequestMethod.GET)
	public String counseller_board_view(int bidx,Model model) {
		
		cboardService.counseller_board_hitCount(bidx);
		Community_BoardVO vo = cboardService.counseller_selectByBidx(bidx);
		model.addAttribute("vo", vo);
		
		return "counseller_board/counseller_board_view";
	}
	
	//상담사 게시판 게시글 작성
	@RequestMapping(value="/counseller_board_write.do",method=RequestMethod.GET)
	public String counseller_board_write() {
		return "counseller_board/counseller_board_write";
	}
}
