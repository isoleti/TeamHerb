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
	
	
	//�α���
	@RequestMapping(value="/login.do", method= RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	//�α��� �ϱ�
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(UserVo vo, HttpSession session, Model model, HttpServletRequest request) {
		//vo�� �Ѿ�Դ��� Ȯ��
		////system.out.println("vo : " + vo.toString());
	
		
		
		//��й�ȣ ��ȣȭ
		String userPw = vo.getPw();
		vo.setPw(UserSha256.encrypt(userPw));
		
		//��ȣȭ Ȯ��
		////system.out.println("userPw:" + vo.getPw());
		
		//�α��� �޼���		
			UserVo login = userService.login(vo);

			if(login ==null) {
				
				return "user/login";
			} else{
				session.setAttribute("login", login);
				////system.out.println(login.toString());
				return "redirect:/";
			}
		
	}
	
	
	
	//�α׾ƿ�
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logtout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	//�α��� üũ
	@ResponseBody
	@RequestMapping(value="/loginCheck.do", method=RequestMethod.POST)
	public int loginCheck(UserVo vo, Model model, HttpSession session,HttpServletResponse response ) {
		////system.out.println("id : " + vo.getId()); 
		//system.out.println("pw : " + vo.getPw());

		//��й�ȣ ��ȣȭ
		String s_pw = UserSha256.encrypt(vo.getPw()); 
		vo.setPw(s_pw);
		//��ȣȭ Ȯ��
		//system.out.println("s_pw:" + s_pw);
		//DB���� ID�� s_pw�� ��ġ�ϴ� ������ �ִ��� Ȯ��
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
	
	// ���̵� ã�� �������� �̵�
	@RequestMapping(value="/idFind.do", method=RequestMethod.GET)
	public String idpwFind() {
		return "user/idFind";
	}
	
	
	
	//���̵� ã�� ����
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
					out.println("<script>alert('��ġ�ϴ� ���̵� �������� �ʽ��ϴ�.'); history.go(-1);</script>");
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
	
	// ȸ������ ��Ʈ�ѷ�
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
			
		return "user/join";
	}
	
	//ȸ������ ��Ʈ�ѷ�
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(UserVo vo, Model model,HttpServletRequest request) {
		
		//��ȣȮ��
		//system.out.println("ù��°"+vo.getPw());
		
		//��й�ȣ ��ȣȭ(sha256
		String encryPassword = UserSha256.encrypt(vo.getPw());//1.�޾ƿ� ���� ��ȣȭ�Ѵ�.
	
		vo.setPw(encryPassword);//2. �װ��� ����
		
		//system.out.println("�ι�°"+vo.getPw());
		
		//ȸ������ �޼���
		int joinVo = userService.join(vo);//3. ����� ��ü �״�� �����ͷ� ������.
	
	 
		
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
	
	//����ȸ������
	@RequestMapping(value="/joinCounselor.do", method=RequestMethod.GET)
	public String joinCoun() {
		
		return "user/joinCounselor";
	}
	
	//����ȸ������
	@RequestMapping(value="/joinCounselor.do", method=RequestMethod.POST)
	public String joinCoun(UserVo vo, Model model, HttpServletRequest request,ReserveVO reserveVO, MultipartHttpServletRequest mpRequest)throws Exception  {
		//��ȣȮ��
		//system.out.println("ù��°"+vo.getPw());
				
		//��й�ȣ ��ȣȭ(sha256
		String encryPassword = UserSha256.encrypt(vo.getPw());//1.�޾ƿ� ���� ��ȣȭ�Ѵ�.
			
		vo.setPw(encryPassword);//2. �װ��� ����
				
		//system.out.println("�ι�°"+vo.getPw());
		
		
		int joinCounVo = userService.joinCoun(vo, mpRequest);//3. ����� ��ü �״�� �����ͷ� ������.
		
		int Coun_certiVo = userService.Coun_certi(reserveVO);
		
		return "user/joinComplete";
	}
	
	@RequestMapping(value="joinComplete.do", method=RequestMethod.GET)
	public String joinComplete() {
		
		return "user/joinComplete";
	}
	
	//�̸��Ϸ� ������ȣ �߼� 
	@RequestMapping(value = "/pw_auth.do")
	public ModelAndView pw_auth(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
			
		String mail = (String)request.getParameter("mail");
		String id = (String)request.getParameter("id");
			
		//system.out.println("mail: "+mail);
		//system.out.println("id: "+id);
			
		UserVo vo = userService.selectJoin(mail); //userService�� seletJoin Mapper���� ���� ���� �޾ƿ� vo�� �־���´�.
		//system.out.println("vo: "+vo);	
			
			if(vo != null) { //vo���� null�̾ƴϸ�  ->mapper�� mail���� db�ȿ� �ִ� ���� ��ġ
			Random r = new Random(); 
			int num = r.nextInt(999999); // ������������
			
				if (vo.getId().equals(id))
				{ //vo���� �޾ƿ� id�� input�� id���� ���� �� 
					session.setAttribute("mail", vo.getMail()); //vo�� ���ϰ��� ���ǿ���� ������.
					
					String setfrom = "dptjd17@naver.com"; // naver 
					String tomail = mail; //�޴»��
					String title = "[����ķ��] ��й�ȣ���� ���� �̸��� �Դϴ�";  //�̸��� ����
					String content = System.getProperty("line.separator") + "�ȳ��ϼ��� ȸ����" + System.getProperty("line.separator")
							+ "����ķ�� ��й�ȣã��(����) ������ȣ�� " + num + " �Դϴ�." + System.getProperty("line.separator"); // 
					
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
				else  //vo���� �޾ƿ� id�� input�� id���� ���� ������ 
				{
					response.setContentType("text/html; charset=UTF-8");
			        PrintWriter out;
			        
						try 
						{
							out = response.getWriter();
							//system.out.println("out: "+ out);
							out.println("<script>alert('��ġ�ϴ� ���̵� �̸����� �����ϴ�.'); history.go(-1);</script>");
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
							out.println("<script>alert('��ġ�ϴ� ���̵� �̸����� �����ϴ�.'); history.go(-1);</script>");
							out.close();
							return null;
						} 
						catch (IOException e) 
						{	
							e.printStackTrace();
						}		
					
					ModelAndView mv = new ModelAndView();
					mv.setViewName("user/pwFind"); //��й�ȣ ã��� ��
					return mv;
					
				}
			
		}
		
		//��й�ȣ ������ȣ ���� Ȯ��
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
		
		//db��й�ȣ ������Ʈ
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
