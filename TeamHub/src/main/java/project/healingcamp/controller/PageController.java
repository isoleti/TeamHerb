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
	// 마이페이지
	@RequestMapping(value = "/mypageRes.do", method = RequestMethod.GET)
	public String mypageRes() {

		return "page/mypageRes";
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

		if (userService.userModify(vo) != 1) {
			System.out.println("/userModify.do POST : error ");
			return "redirect:userModify.do?uidx=" + vo.getUidx();
		}
		System.out.println("/userModify.do POST : done ");
		session.invalidate();
		return "redirect:/";
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

	@RequestMapping(value = "mypageCouns.do", method = RequestMethod.GET)
	public String mypageCouns() {

		return "page/mypageCouns";
	}

	@RequestMapping(value = "mypageCount.do", method = RequestMethod.GET)
	public String mypageCount() {

		return "page/mypageCount";
	}
	//나의 글쓰기 목록
	@RequestMapping(value="mypageWrite.do", method=RequestMethod.GET)
	public String mypageWrite(Model model, MyCriteria cri) {
		
		//전체게시글 데이터 요청
		List<Community_BoardVO> list = pageService.list(cri);
		
		System.out.println("나의 글쓰기list:"+list);
		 MypageMaker mypageMaker = new MypageMaker(cri, pageService.total(cri));
		//데이터를 모델에 담아 화면에 넘김
		
		model.addAttribute("list",list);//글목록 전달
		model.addAttribute("mypageMaker", mypageMaker);
		
		return "page/mypageWrite";
	}
	//나의 글쓰기 삭제
		@RequestMapping(value="/mywrite_delete.do",method=RequestMethod.POST)
		public String delete(int bidx) { 
			//db 상세데이터 조회
			
			cboardService.deleteByBidx(bidx);
			System.out.println("삭제"+bidx);
			
			return "redirect:mypageWrite.do";
		
		}
	
	@RequestMapping(value = "mypageReview.do", method = RequestMethod.GET)
	public String mypageReview() {

		return "page/mypageReview";
	}

	@RequestMapping(value = "mypageScrap.do", method = RequestMethod.GET)
	public String mypageScrap() {

		return "page/mypageScrap";
	}

	// 상담사 페이지
	@RequestMapping(value = "/counspageRes.do", method = RequestMethod.GET)
	public String counspageRes(Model model, ReserveVO vo) {
		/*
		 * List<ReserveVO> list = pageService.list(vo);
		 * 
		 * model.addAttribute("datalist", list);
		 */

		return "page/counspageRes";
	}

	@RequestMapping(value = "/counspageCou.do", method = RequestMethod.GET)
	public String counspageCou() {

		return "page/counspageCou";
	}

	@RequestMapping(value = "/counspageWrite.do", method = RequestMethod.GET)
	public String counspageWrite() {

		return "page/counspageWrite";
	}
}