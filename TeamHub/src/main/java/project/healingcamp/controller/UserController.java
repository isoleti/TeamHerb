package project.healingcamp.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project.healingcamp.service.UserService;
import project.healingcamp.service.UserSha256;
import project.healingcamp.vo.UserVo;

@RequestMapping("/user")
@Controller

public class UserController {
	
	@Autowired
	private UserService userService;
	
	//로그인
	@RequestMapping(value="/login.do", method= RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	//로그인 하기
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(UserVo vo, HttpSession session, Model model, HttpServletRequest request) {
		//vo값 넘어왔는지 확인
		System.out.println("vo : " + vo.toString());
	
		
		//비밀번호 암호화
		String userPw = vo.getPw();
		vo.setPw(UserSha256.encrypt(userPw));
		
		//암호화 확인
		System.out.println("userPw:" + vo.getPw());
		
		//로그인 메서드
		UserVo login = userService.login(vo);

		
			if(login ==null) {
				
				return "user/login";
			} else{
				session.setAttribute("login", login);
				System.out.println(login.toString());
				return "redirect:/";
			}
		
	}
	
	//로그아웃
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logtout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	//로그인 체크
	@ResponseBody
	@RequestMapping(value="/loginCheck.do", method=RequestMethod.POST)
	public int loginCheck(UserVo vo, Model model, HttpSession session,HttpServletResponse response ) {
		System.out.println("id : " + vo.getId()); 
		System.out.println("pw : " + vo.getPw());

		//비밀번호 암호화
		String s_pw = UserSha256.encrypt(vo.getPw()); 
		vo.setPw(s_pw);
		//암호화 확인
		System.out.println("s_pw:" + s_pw);
		//DB에서 ID와 s_pw가 일치하는 계정이 있는지 확인
		int count = userService.loginCheck(vo, session);
		if( count == 1 )
		{	
			session.setAttribute("id", vo.getId());
			return 1;
		}else
		{
			return 0;
		}
	}
	
	// 아이디 찾기 페이지로 이동
	@RequestMapping(value="/idFind.do", method=RequestMethod.GET)
	public String idpwFind() {
		return "user/idFind";
	}
	
	
	
	//아이디 찾기 실행
	@RequestMapping(value="/findId.do", method=RequestMethod.POST)
	public String findId(HttpServletResponse response, String mail, Model model) {
		System.out.println("mail:" +mail);
		
		String user = userService.findId(mail); 
			if(user != null) 
			{	
				System.out.println("id:"+mail );
				model.addAttribute("id", user);
				return "user/idMatch";
			}
			
			else 
			{
				response.setContentType("text/html; charset=UTF-8");
		        PrintWriter out;
				try 
				{
					out = response.getWriter();
					out.println("<script>alert('일치하는 아이디가 존재하지 않습니다.'); history.go(-1);</script>");
					out.close();
					return null;
				} 
				catch (IOException e) 
				{	
					e.printStackTrace();
				}		
				return "user/idFind";
			}
	}

	
	
	@RequestMapping(value="/pwFind.do", method=RequestMethod.GET)
	public String pwFind() {
		return "user/pwFind";
	}
	
	// 회원가입 컨트롤러
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
			
		return "user/join";
	}
	
	//회원가입 컨트롤러
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(UserVo vo, Model model,HttpServletRequest request ) {
		
		//암호확인
		System.out.println("첫번째"+vo.getPw());
		
		//비밀번호 암호화(sha256
		String encryPassword = UserSha256.encrypt(vo.getPw());//1.받아온 값을 암호화한다.
	
		vo.setPw(encryPassword);//2. 그값을 저장
		
		System.out.println("두번째"+vo.getPw());
		
		//회원가입 메서드
		int joinVo = userService.join(vo);//3. 저장된 객체 그대로 데이터로 보낸다.
	
		//인증 메일 보내기 메서드 
		
		return "user/joinComplete";
		
	}	
	
	@ResponseBody
	@RequestMapping(value="/checkId.do", method=RequestMethod.POST)
	public String checkId(String id) {
		
		int result = userService.selectById(id);
		
		if(result>0) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/checkMail.do", method=RequestMethod.POST)
	public String checkMail(String mail) {
		
		int result = userService.selectByMail(mail);
		
		if(result>0) {
			return "1";
		}else {
			return "0";
		}
	}
	
	//상담사회원가입
	@RequestMapping(value="/joinCounselor.do", method=RequestMethod.GET)
	public String joinCoun() {
		
		return "user/joinCounselor";
	}
	
	//상담사회원가입
	@RequestMapping(value="/joinCounselor.do", method=RequestMethod.POST)
	public String joinCoun(UserVo vo,Model model,HttpServletRequest request ) {
		
		//암호확인
		System.out.println("첫번째"+vo.getPw());
				
		//비밀번호 암호화(sha256
		String encryPassword = UserSha256.encrypt(vo.getPw());//1.받아온 값을 암호화한다.
			
		vo.setPw(encryPassword);//2. 그값을 저장
				
		System.out.println("두번째"+vo.getPw());
		
		int joinCounVo = userService.joinCoun(vo);//3. 저장된 객체 그대로 데이터로 보낸다.
		
		return "user/joinComplete";
	}
	
	@RequestMapping(value="joinComplete.do", method=RequestMethod.GET)
	public String joinComplete() {
		
		return "user/joinComplete";
	}
}
