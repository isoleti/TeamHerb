package project.healingcamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project.healingcamp.service.Community_BoardService;
import project.healingcamp.service.ReplyService;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.PageVO;
import project.healingcamp.vo.ReplyVO;
import project.healingcamp.vo.SearchVO;
import project.healingcamp.vo.UserVo;

@RequestMapping(value="/counseller_board")
@Controller
public class CounsellerController {
	
	@Autowired
	private Community_BoardService cboardService;
	
	@Autowired
	private ReplyService replyService;

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
	
	//댓글 리스트
	@RequestMapping(value="/counseller_board_view.do",method=RequestMethod.POST)
	@ResponseBody
	public List<ReplyVO> counseller_board_view(int bidx) {
		
		//댓글 리스트
		List<ReplyVO> counseller_reply_list = replyService.counseller_reply_list(bidx);
		
		return counseller_reply_list;
	}
	
	//상담사 게시판 게시글 작성페이지 이동
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
	
	//게시글 수정페이지 이동
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
	
	//게시글 삭제
	@RequestMapping(value="/counseller_board_delete.do",method=RequestMethod.POST)
	public String counseller_board_delete(int bidx) {
		
		cboardService.counseller_board_deleteByBidx(bidx);
		
		return "redirect:counseller_board_list.do";
	}
	
	//댓글 작성
	@RequestMapping(value="/community_reply_insert.do",method=RequestMethod.POST)
	@ResponseBody
	public String community_reply_insert(ReplyVO replyVO,HttpSession session,HttpServletRequest request,Community_BoardVO cboardVO) {
		
		//로그인 정보
		UserVo login = (UserVo)session.getAttribute("login");
		
		replyVO.setUidx(login.getUidx()); //댓글작성자 번호
		replyVO.setId(login.getId()); //댓글작성자 아이디
		replyVO.setBidx(cboardVO.getBidx()); //작성한댓글의 게시글 번호
		replyVO.setReply_Ip(request.getRemoteAddr()); // 아이피
		
		//댓글작성 후 삽입
		int result = replyService.reply_Insert(replyVO);
		
		return "success";
	}
	
	//댓글 삭제
	@RequestMapping(value="/community_reply_delete.do",method=RequestMethod.POST)
	@ResponseBody
	public String community_reply_delete(ReplyVO replyVO) {
		int result = replyService.deleteByReply(replyVO);
		
		return "1";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
