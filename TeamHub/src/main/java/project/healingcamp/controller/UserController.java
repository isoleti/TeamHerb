package project.healingcamp.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.healingcamp.service.UserService;
import project.healingcamp.service.UserSha256;
import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.UserVo;

@RequestMapping("/user")
@Controller

public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	//로그인
	@RequestMapping(value="/login.do", method= RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	//로그인 하기
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(UserVo vo, HttpSession session, Model model, HttpServletRequest request) {
		//vo값 넘어왔는지 확인
		////system.out.println("vo : " + vo.toString());
	
		
		
		//비밀번호 암호화
		String userPw = vo.getPw();
		vo.setPw(UserSha256.encrypt(userPw));
		
		//암호화 확인
		////system.out.println("userPw:" + vo.getPw());
		
		//로그인 메서드		
			UserVo login = userService.login(vo);

			if(login ==null) {
				
				return "user/login";
			} else{
				session.setAttribute("login", login);
				////system.out.println(login.toString());
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
		////system.out.println("id : " + vo.getId()); 
		//system.out.println("pw : " + vo.getPw());

		//비밀번호 암호화
		String s_pw = UserSha256.encrypt(vo.getPw()); 
		vo.setPw(s_pw);
		//암호화 확인
		//system.out.println("s_pw:" + s_pw);
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
	//
	
	// 아이디 찾기 페이지로 이동
	@RequestMapping(value="/idFind.do", method=RequestMethod.GET)
	public String idpwFind() {
		return "user/idFind";
	}
	
	
	
	//아이디 찾기 실행
	@RequestMapping(value="/findId.do", method=RequestMethod.POST)
	public String findId(HttpServletResponse response, String mail, Model model) {
		//system.out.println("mail:" +mail);
		
		String user = userService.findId(mail); 
			if(user != null) 
			{	
				////system.out.println("id:"+mail );
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
	public String join(UserVo vo, Model model,HttpServletRequest request) {
		
		//암호확인
		//system.out.println("첫번째"+vo.getPw());
		
		//비밀번호 암호화(sha256
		String encryPassword = UserSha256.encrypt(vo.getPw());//1.받아온 값을 암호화한다.
	
		vo.setPw(encryPassword);//2. 그값을 저장
		
		//system.out.println("두번째"+vo.getPw());
		
		//회원가입 메서드
		int joinVo = userService.join(vo);//3. 저장된 객체 그대로 데이터로 보낸다.
	
	 
		
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
	public String joinCoun(UserVo vo, Model model, HttpServletRequest request,ReserveVO reserveVO, MultipartHttpServletRequest mpRequest)throws Exception  {
		//암호확인
		//system.out.println("첫번째"+vo.getPw());
				
		//비밀번호 암호화(sha256
		String encryPassword = UserSha256.encrypt(vo.getPw());//1.받아온 값을 암호화한다.
			
		vo.setPw(encryPassword);//2. 그값을 저장
				
		//system.out.println("두번째"+vo.getPw());
		
		
		int joinCounVo = userService.joinCoun(vo, mpRequest);//3. 저장된 객체 그대로 데이터로 보낸다.
		
		int Coun_certiVo = userService.Coun_certi(reserveVO);
		
		return "user/joinComplete";
	}
	
	@RequestMapping(value="joinComplete.do", method=RequestMethod.GET)
	public String joinComplete() {
		
		return "user/joinComplete";
	}
	
	//이메일로 인증번호 발송 
	@RequestMapping(value = "/pw_auth.do")
	public ModelAndView pw_auth(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
			
		String mail = (String)request.getParameter("mail");
		String id = (String)request.getParameter("id");
			
		//system.out.println("mail: "+mail);
		//system.out.println("id: "+id);
			
		UserVo vo = userService.selectJoin(mail); //userService의 seletJoin Mapper에서 메일 값을 받아와 vo에 넣어놓는다.
		//system.out.println("vo: "+vo);	
			
			if(vo != null) { //vo값이 null이아니면  ->mapper의 mail값이 db안에 있는 값과 일치
			Random r = new Random(); 
			int num = r.nextInt(999999); // 랜덤난수설정
			
				if (vo.getId().equals(id))
				{ //vo에서 받아온 id가 input의 id값과 같을 때 
					session.setAttribute("mail", vo.getMail()); //vo의 메일값을 세션에담아 보낸다.
					
					String setfrom = "dptjd17@naver.com"; // naver 
					String tomail = mail; //받는사람
					String title = "[힐링캠프] 비밀번호변경 인증 이메일 입니다";  //이메일 제목
					String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
							+ "힐링캠프 비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 
					
					try { 
						MimeMessage message = mailSender.createMimeMessage();
						MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
		
						messageHelper.setFrom(setfrom); 
						messageHelper.setTo(tomail); 
						messageHelper.setSubject(title);
						messageHelper.setText(content); 
		
						mailSender.send(message);
						} 
					catch (Exception e) 
						{
							//system.out.println(e.getMessage());
						}
			
					ModelAndView mv = new ModelAndView();
					mv.setViewName("user/pw_auth");
					mv.addObject("num", num);
					return mv;
				}//if (vo.getId().equals(id))
				else  //vo에서 받아온 id가 input의 id값과 같지 않을때 
				{
					response.setContentType("text/html; charset=UTF-8");
			        PrintWriter out;
			        
						try 
						{
							out = response.getWriter();
							//system.out.println("out: "+ out);
							out.println("<script>alert('일치하는 아이디나 이메일이 없습니다.'); history.go(-1);</script>");
							out.close();
							return null;
						} 
						catch (IOException e) 
						{	
							e.printStackTrace();
						}		
					
					ModelAndView mv = new ModelAndView();
					mv.setViewName("user/pwFind");
					return mv;
				}
			} //if(vo != null)
				else //(vo == null)
				{	
					response.setContentType("text/html; charset=UTF-8");
			        PrintWriter out;
			        
						try 
						{
							out = response.getWriter();
							//system.out.println("out: "+ out);
							out.println("<script>alert('일치하는 아이디나 이메일이 없습니다.'); history.go(-1);</script>");
							out.close();
							return null;
						} 
						catch (IOException e) 
						{	
							e.printStackTrace();
						}		
					
					ModelAndView mv = new ModelAndView();
					mv.setViewName("user/pwFind"); //비밀번호 찾기로 감
					return mv;
					
				}
			
		}
		
		//비밀번호 인증번호 동일 확인
		@RequestMapping(value="/pw_set.do", method=RequestMethod.POST)
			public String pw_set(@RequestParam(value="email_injeung")String email_injeung,
					@RequestParam(value = "num") String num, HttpServletResponse response) throws IOException{
				

				////system.out.println("num: "+num);
				if(email_injeung.equals(num))
				{
					return "user/pw_new";
				}
				else 
				{		
					return "user/pw_auth";
				}
			}
		
		//db비밀번호 업데이트
		@RequestMapping(value="/pw_new.do", method =RequestMethod.POST)
			public String pw_new(UserVo vo, HttpSession session)throws IOException{
			
			int result = userService.pwUpdate(vo);
			//system.out.println("result: "+result);
			
			if(result == 1) {
				return "user/login";
				
			}
			else {
				//system.out.println("pw_update"+result);
				return "user/pw_new";
			}
			
			
		}
	
}
