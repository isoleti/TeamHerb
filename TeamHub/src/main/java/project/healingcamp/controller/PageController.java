package project.healingcamp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.healingcamp.service.Community_BoardService;
import project.healingcamp.service.PageService;
import project.healingcamp.service.UserService;
import project.healingcamp.service.UserSha256;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.Criteria;
import project.healingcamp.vo.MyCriteria;
import project.healingcamp.vo.MyRCriteria;
import project.healingcamp.vo.MypageMaker;
import project.healingcamp.vo.PageMaker;
import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.ReviewVo;
import project.healingcamp.vo.SearchVO;
import project.healingcamp.vo.UserVo;

@RequestMapping("/page")
@Controller
public class PageController {

	@Autowired
	private PageService pageService;

	@Autowired
	private UserService userService;

	@Autowired
	private Community_BoardService cboardService;
	// 마이페이지 예약내역
	@RequestMapping(value = "/mypageRes.do", method = RequestMethod.GET)
	public String mypageRes(Model model, ReserveVO vo, HttpSession session, MyRCriteria rcri) {

		UserVo login =(UserVo)session.getAttribute("login");
		
		rcri.setId(login.getId());
		rcri.setUidx(login.getUidx());
		
		
		List<ReserveVO> reslist = pageService.reslist(rcri);
		
		
		MypageMaker mypageMaker = new MypageMaker(rcri, pageService.res_total(rcri));
		
		
		 System.out.println("총합계:" + pageService.res_total(rcri));
		 System.out.println("페이지"+ mypageMaker);
		 
		model.addAttribute("reslist", reslist);
		System.out.println("예약 리스트 : "+reslist);
		 model.addAttribute("mypageMaker", mypageMaker);
		
		return "page/mypageRes";
	}
	//마이페이지 예약 취소 
		@RequestMapping(value="/myres_delete.do",method=RequestMethod.POST)
		public String delete(ReserveVO vo) { 
			//db 상세데이터 조회
			pageService.myres_Delete(vo);

			System.out.println("나의 예약 삭제"+vo.toString());
		
			return "redirect:mypageRes.do";
		
		}
	// 마이페이지 상담내역
	@RequestMapping(value = "/mypageCouns.do", method = RequestMethod.GET)
	public String mypageCouns(Model model, ReserveVO vo, HttpSession session, MyRCriteria rcri) {

		UserVo login =(UserVo)session.getAttribute("login");
		
		rcri.setId(login.getId());
		rcri.setUidx(login.getUidx());
		
		
		List<ReserveVO> counslist = pageService.counslist(rcri);
		

		MypageMaker mypageMaker = new MypageMaker(rcri, pageService.couns_total(rcri));
		
		  System.out.println("총합계:" + pageService.couns_total(rcri));
		  System.out.println("페이지"+ mypageMaker);
		 
		 
		model.addAttribute("counslist", counslist);
		System.out.println("상담 리스트 : "+counslist);
		model.addAttribute("mypageMaker", mypageMaker);
		
		return "page/mypageCouns";
	}
	
		
		
		
	@RequestMapping(value = "/pwConfirm.do", method = RequestMethod.GET)
	public String pwConfirm() {

		return "page/pwConfirm";
	}

	@RequestMapping(value = "/checkPw.do", method = RequestMethod.POST)
	public String checkPw(UserVo vo, Model model, HttpServletResponse response, HttpSession session) {

		System.out.println("/checkPw.do : " + vo.toString());
		// 비밀번호 암호화
		String userPw = vo.getPw();

		vo.setPw(UserSha256.encrypt(userPw));

		UserVo login = (UserVo) session.getAttribute("login");

		vo.setId(login.getId()); // 로그인 id와 연결
		vo.setUidx(login.getUidx()); // 로그인 uidx와 연결

		// pwCheck 메서드
		UserVo check = pageService.pwCheck(vo);
		
		
		// check 변수안에 데이터가 있을때 없을때 if
		if (check == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('일치하는 비밀번호가 존재하지 않습니다.'); history.go(-1);</script>");
				out.close();
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "page/pwConfirm";
		} else {

			return "redirect:userModify.do?uidx=" + login.getUidx();
		}
	}

	@RequestMapping(value = "/userModify.do", method = RequestMethod.GET)
	public String userModify(int uidx, Model model) {
		System.out.println("/userModify.do GET : " + uidx);

		UserVo vo = userService.selectByUidx(uidx);
		if (vo != null) {
			System.out.println("/userModify.do " + " GET : " + vo.toString());
			model.addAttribute("vo", vo);
		}

		return "page/userModify";
	}

	// 회원정보 수정
	@RequestMapping(value = "/userModify.do", method = RequestMethod.POST)
	public String userModify(UserVo vo, HttpSession session, Model model, HttpServletRequest request) {
		System.out.println("/userModify.do POST : " + vo.toString());
		
		/*
		 * //비밀번호 암호화 String userPw = vo.getPw(); vo.setPw(UserSha256.encrypt(userPw));
		 * 
		 * 
		 * //암호화 확인 System.out.println("userPw:" + vo.getPw());
		 */
		
		String usertype = vo.getUsertype();
		
		if (userService.userModify(vo) != 1) {
		System.out.println("/userModify.do POST : error ");
		return "redirect:userModify.do?uidx=" + vo.getUidx();
		}
		System.out.println("/userModify.do POST : done ");
		
			
		if(usertype.equals("u")) {		
			System.out.println("유저타입뭔지"+vo.getUsertype());
			return "redirect:mypageRes.do";
			}
		else {
			return "redirect:counspageRes.do";
		}
	}

	// 비밀번호 변경(결국 못함)
	@RequestMapping(value = "/pwReset.do", method = RequestMethod.POST)
	public String pwReset(UserVo vo, HttpSession session, Model model, HttpServletRequest request) {
		System.out.println("/pwReset.do POST : " + vo.toString());
		
		  //비밀번호 암호화 
			String userPw = vo.getPw(); vo.setPw(UserSha256.encrypt(userPw));
			vo.setPw(UserSha256.encrypt(userPw));
			
		  //암호화 확인
			System.out.println("userPw:" + vo.getPw());
			
			if (userService.pwReset(vo) != 1) {
				System.out.println("/pwReset.do POST : error ");
				return "redirect:pwReset.do?uidx=" + vo.getUidx();
			}
			System.out.println("/pwReset.do POST : done ");
			session.invalidate();
			return "redirect:/";
			
				
	}

	// 회원탈퇴
	@RequestMapping(value = "userDel.do", method = RequestMethod.GET)
	public String userDel() {

		return "page/userDel";
	}

	@RequestMapping(value = "userDel.do", method = RequestMethod.POST)
	public String Withdraw(UserVo vo, HttpSession session, Model model, HttpServletRequest request,
			HttpServletResponse response) {

		// 비밀번호 암호화
		String userPw = vo.getPw();
		vo.setPw(UserSha256.encrypt(userPw));

		// 암호화 확인
		System.out.println("userPw:" + vo.getPw());

		UserVo check = pageService.pwCheck(vo);

		if (check == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('일치하는 비밀번호가 존재하지 않습니다.'); history.go(-1);</script>");
				out.close();
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "page/userDel";
		} else {

			userService.userDelete(vo);
			session.invalidate();
			return "redirect:/";
		}

	}



	
	//나의 글쓰기 목록
	@RequestMapping(value="/mypageWrite.do",method=RequestMethod.GET)
	public String mypageWrite(Model model, Community_BoardVO cboardVO, HttpSession session, MyCriteria cri) {
		
		UserVo login =(UserVo)session.getAttribute("login");
		
		cri.setId(login.getId());
		cri.setUidx(login.getUidx());
		
		
		//전체게시글 데이터 요청
		List<Community_BoardVO> list = pageService.list(cri);
		
		MypageMaker mypageMaker = new MypageMaker(cri, pageService.total(cri));
		
		 System.out.println("총합계:" + pageService.total(cri));
		 System.out.println("페이지"+ mypageMaker);
		 
		model.addAttribute("list",list);//글목록 전달
		 model.addAttribute("mypageMaker", mypageMaker);
		 
		return "page/mypageWrite";
	}
	
	//나의 글쓰기 삭제(보류)
		@RequestMapping(value="/mywrite_delete.do",method=RequestMethod.POST)
		public String delete(int bidx) { 
			//db 상세데이터 조회
			System.out.println("del 컨트롤러: "+bidx);
			cboardService.deleteByBidx(bidx);
			System.out.println("삭제"+bidx);
			
			return "redirect:mypageWrite.do";
		
		}
	
	@RequestMapping(value = "mypageReview.do", method = RequestMethod.GET)
	public String mypageReview() {

		return "page/mypageReview";
	}


	// 상담사 페이지
	@RequestMapping(value = "/counspageRes.do", method = RequestMethod.GET)
	public String counspageRes(Model model, ReserveVO vo, HttpSession session, MyRCriteria rcri) {
		
		UserVo login =(UserVo)session.getAttribute("login");
		
		rcri.setId(login.getId());
		rcri.setUidx(login.getUidx());
		
		
		List<ReserveVO> coun_reslist = pageService.coun_reslist(rcri);
		
		
		
		MypageMaker mypageMaker = new MypageMaker(rcri, pageService.counres_total(rcri));
		
		
		 System.out.println("컨트롤러 상담사 예약 총합계:" + pageService.counres_total(rcri));
		 //System.out.println("페이지"+ mypageMaker);
		 
		model.addAttribute("coun_reslist", coun_reslist);
		System.out.println("예약 리스트 : "+coun_reslist);
		 model.addAttribute("mypageMaker", mypageMaker);

		return "page/counspageRes";
	}
	//상담사페이지 예약 취소 
	@RequestMapping(value="/counres_delete.do",method=RequestMethod.POST)
	public String coundelete(ReserveVO vo) { 
		//db 상세데이터 조회
		pageService.counres_Delete(vo);

		System.out.println("상담사 예약 삭제"+vo.toString());
	
		return "redirect:counspageRes.do";
	
	}
	//상담사페이지 예약 수락
	@RequestMapping(value="/counres_check.do",method=RequestMethod.POST)
	public String councheck(ReserveVO vo) { 
		//db 상세데이터 조회
		pageService.counres_Check(vo);

		System.out.println("상담사 예약 수락"+vo.toString());
		return "redirect:counspageRes.do";
	
	}
	//상담사페이지 상담 목록
	@RequestMapping(value = "/counspageCou.do", method = RequestMethod.GET)
	public String counspageCou(Model model, ReserveVO vo, HttpSession session, MyRCriteria rcri) {
		
		UserVo login =(UserVo)session.getAttribute("login");
		
		rcri.setId(login.getId());
		rcri.setUidx(login.getUidx());
		
		
		List<ReserveVO> councou_list = pageService.councou_list(rcri);
		
		
		
		MypageMaker mypageMaker = new MypageMaker(rcri, pageService.councou_total(rcri));
		
		
		 System.out.println("컨트롤러 상담사 상담 총합계:" + pageService.councou_total(rcri));
		 System.out.println("페이지"+ mypageMaker);
		 
		model.addAttribute("councou_list", councou_list);
		System.out.println("상담 리스트 : "+councou_list);
		 model.addAttribute("mypageMaker", mypageMaker);

		return "page/counspageCou";
	}
	
	
	//상담사 글쓰기 목록
	@RequestMapping(value = "/counspageWrite.do", method = RequestMethod.GET)
	public String counspageWrite(Model model, Community_BoardVO cboardVO, HttpSession session, MyCriteria cri) {

		UserVo login =(UserVo)session.getAttribute("login");
		
		System.out.println("상담사마이페이지 :"+login.toString());
		cri.setId(login.getId());
		cri.setUidx(login.getUidx());
		
		
		//전체게시글 데이터 요청
		List<Community_BoardVO> list = pageService.list(cri);
		
		MypageMaker mypageMaker = new MypageMaker(cri, pageService.total(cri));
		
		 System.out.println("총합계:" + pageService.total(cri));
		 System.out.println("페이지"+ mypageMaker);
		 
		 model.addAttribute("list",list);//글목록 전달
		 model.addAttribute("mypageMaker", mypageMaker);
		 
		return "page/counspageWrite";
	}
}