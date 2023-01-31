package project.healingcamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.healingcamp.service.Community_BoardService;
import project.healingcamp.service.ReplyService;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.PageVO;
import project.healingcamp.vo.ReplyVO;
import project.healingcamp.vo.SearchVO;
import project.healingcamp.vo.UserVo;

@RequestMapping(value="/community")
@Controller
public class CommunityController {
	
	@Autowired
	private Community_BoardService cboardService;
	
	@Autowired
	private ReplyService replyService;
	
	//커뮤니티 리스트 이동
	@RequestMapping(value="/community_list.do",method=RequestMethod.GET)
	public String community_list(Model model,SearchVO searchVO) {

		//페이지네이션(검색어포함)
		PageVO pageVO = new PageVO(searchVO,cboardService.total(searchVO));
		//전체게시글 데이터 요청
		List<Community_BoardVO> list = cboardService.list(searchVO);
		//데이터를 모델에 담아 화면에 넘김
		model.addAttribute("pageVO",pageVO);//페이지네이션 전달
		model.addAttribute("datalist",list);//글목록 전달
		return "community/community_list";
	}
	
	//게시글 상세보기 이동
	@RequestMapping(value="/community_view.do",method=RequestMethod.GET)
	public String community_view(int bidx,Model model,ReplyVO replyVO) {
		
		//호출된 결과를 vo에 담음
		Community_BoardVO vo = cboardService.selectByBidx(bidx);
		//조회수 증가
		cboardService.hitCount(bidx);
		
		//model에 vo를 담아 화면에 넘김
		model.addAttribute("vo",vo);
		
		
		return "community/community_view";
	}
	
	//댓글 리스트
	@RequestMapping(value="/community_view.do",method=RequestMethod.POST)
	@ResponseBody
	public List<ReplyVO> community_view(int bidx) {
		
		//댓글 리스트
		List<ReplyVO> reply_list = replyService.reply_list(bidx);
		
		return reply_list;
	}
	
	//게시글 작성 페이지 이동
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
		
		//게시글 작성
		cboardService.insert(cboardVO);
		//최근작성한 게시글의 bidx
		int bidx = cboardService.maxBidx();
		
		return "redirect:community_view.do?bidx="+bidx;
	}
	
	//게시글 수정페이지 이동
	@RequestMapping(value="/community_modify.do",method=RequestMethod.GET)
	public String community_modify(int bidx,Model model) {
		
		//작성된 게시글의 카테고리를 리스트에 담음
		List<Community_BoardVO> categoryList = cboardService.categoryList();
		Community_BoardVO vo = cboardService.selectByBidx(bidx);
		
		model.addAttribute("vo",vo);
		model.addAttribute("categoryList",categoryList);
		return "community/community_modify";
	}
	
	//게시글 수정
	@RequestMapping(value="/community_modify.do",method=RequestMethod.POST)
	public String community_modify(Community_BoardVO cboardVO) {
		
		int result = cboardService.modifyByBidx(cboardVO);
		
		return "redirect:community_view.do?bidx="+cboardVO.getBidx();
	}

	//게시글 삭제
	@RequestMapping(value="/community_delete.do",method=RequestMethod.POST)
	public String delete(int bidx) {
		
		cboardService.deleteByBidx(bidx);
		
		return "redirect:community_list.do";
	}
	
	//게시글 신고팝업
	@RequestMapping(value="/popup.do",method=RequestMethod.GET)
	public String popup() {
		return "community/popup";
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
		replyService.reply_Insert(replyVO);
		
		return "success";
	}
	
	//댓글 삭제
	@RequestMapping(value="/community_reply_delete.do",method=RequestMethod.POST)
	@ResponseBody
	public String community_reply_delete(ReplyVO replyVO) {
		replyService.deleteByReply(replyVO);
		
		return "1";
	}
	
	//댓글 수정
	@RequestMapping(value="/community_reply_update.do",method=RequestMethod.POST)
	public String community_reply_update(ReplyVO replyVO) {
		int result = replyService.updateByReply(replyVO);
		System.out.println("result:"+result);
		System.out.println("번호:"+replyVO.getReply_Idx());
		System.out.println("내용:"+replyVO.getReply_Content());
		
		return "1";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
