package project.healingcamp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import project.healingcamp.service.LikeService;
import project.healingcamp.service.ReplyService;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.LikeVO;
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
	
	@Autowired
	private LikeService likeService;
	
	//커뮤니티 리스트 이동
	@RequestMapping(value="/community_list.do",method=RequestMethod.GET)
	public String community_list(Model model,SearchVO searchVO) {

		//페이지네이션(검색어포함)
		PageVO pageVO = new PageVO(searchVO,cboardService.total(searchVO));
		//전체게시글 데이터 요청
		List<Community_BoardVO> list = cboardService.list(searchVO);
		List<LikeVO> likeList = likeService.likeList();
		
		//데이터를 모델에 담아 화면에 넘김
		model.addAttribute("pageVO",pageVO);//페이지네이션 전달
		model.addAttribute("datalist",list);//글목록 전달
		model.addAttribute("likeList",likeList);//글목록 전달
		return "community/community_list";
	}
	
	//게시글 상세보기 이동
	@RequestMapping(value="/community_view.do",method=RequestMethod.GET)
	public String community_view(int bidx,Model model,ReplyVO replyVO,HttpSession session) {
		
		//호출된 결과를 vo에 담음
		Community_BoardVO vo = cboardService.selectByBidx(bidx);
		//조회수 증가
		cboardService.hitCount(bidx);
		//로그인정보
		UserVo login = (UserVo)session.getAttribute("login");
		
		//좋아요 클릭 체크
		LikeVO likeVO = new LikeVO();
		likeVO.setBidx(bidx);
		
		if(login != null) {
			likeVO.setId(login.getId());
		}else {
			likeVO.setId("");
		}
		
		//model에 vo를 담아 화면에 넘김
		model.addAttribute("vo",vo);
		model.addAttribute("likeCount",likeService.likeCount(likeVO));
		
		return "community/community_view";
	}
	
	//게시글 작성 페이지 이동
	@RequestMapping(value="/community_write.do",method=RequestMethod.GET)
	public String community_write() {
		return "community/community_write";
	}
	
	//게시글 작성
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
		
		cboardService.modifyByBidx(cboardVO);
		
		return "redirect:community_view.do?bidx="+cboardVO.getBidx();
	}

	//게시글 삭제
	@RequestMapping(value="/community_delete.do",method=RequestMethod.POST)
	public String delete(int bidx) {
		
		cboardService.deleteByBidx(bidx);
		
		return "redirect:community_list.do";
	}
	
	///////////////////////////////////////댓글////////////////////////////////////////////////////////////////////////////////////////////
	
	//댓글 리스트
		@RequestMapping(value="/community_replyList.do",method=RequestMethod.GET)
		@ResponseBody
		public List<ReplyVO> community_view(int bidx) {
			
			//댓글 리스트
			List<ReplyVO> reply_list = replyService.reply_list(bidx);
			
			return reply_list;
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
	@ResponseBody
	public String community_reply_update(@RequestBody ReplyVO replyVO) {
		replyService.updateByReply(replyVO);
		
		return "1";
	}
	
	
	//대댓글 작성
	@RequestMapping(value="community_re_reply.do",method=RequestMethod.POST)
	@ResponseBody
	public String re_replyInsert(@RequestBody ReplyVO replyVO, HttpSession session, HttpServletRequest request,Community_BoardVO cboardVO) {
		
		//로그인 정보
		UserVo login = (UserVo)session.getAttribute("login");
		
		replyVO.setId(login.getId()); //대댓글 작성자 아이디
		replyVO.setUidx(login.getUidx()); //대댓글 작성자 uidx
		replyVO.setReply_Ip(request.getRemoteAddr()); //ip
		
		replyService.re_replyInsert(replyVO);
		
		return "1";
		
	}
	
	//사진업로드
	@RequestMapping(value="/multiplePhotoUpload.do")
	public void multiplePhotoUpload(HttpServletRequest request,HttpServletResponse response) {
		try {
			//파일정보
			String sFileInfo = "";
			//일반 원본파일명
			String filename = request.getHeader("file-name");
			//파일 확장자
			String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
			//확장자를 소문자로 변경
			filename_ext = filename_ext.toLowerCase();
			//파일 기본경로
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			//파일 기본경로 - 상세경로
			String filePath = dftFilePath+"resources"+File.separator+"photo_upload"+File.separator;
			System.out.println("디렉토리:"+filePath);
			File file = new File(filePath);
			//디렉토리 존재하지 않을경우 디렉토리 생성
			if(!file.exists()) {
				file.mkdirs();
			}
			//서버에 업로드 할 파일명
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			realFileNm = today+UUID.randomUUID().toString()+filename.substring(filename.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;
			//서버에 파일쓰기
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while((numRead = is.read(b,0,b.length)) != -1) {
				os.write(b,0,numRead);
			}
			if(is != null) {
				is.close();
			}
			os.flush();
			os.close();
			//정보출력
			sFileInfo += "&bNewLine=true";
			//img태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			sFileInfo += "&sFileName="+filename;
			sFileInfo += "&sFileURL="+"/controller/resources/photo_upload/"+realFileNm;
			PrintWriter print = response.getWriter();
			print.print(sFileInfo);
			System.out.println(sFileInfo);
			print.flush();
			print.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
