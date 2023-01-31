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
	
	//�α���
	@RequestMapping(value="/login.do", method= RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	//�α��� �ϱ�
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(UserVo vo, HttpSession session, Model model, HttpServletRequest request) {
		//vo�� �Ѿ�Դ��� Ȯ��
		System.out.println("vo : " + vo.toString());
	
		
		//��й�ȣ ��ȣȭ
		String userPw = vo.getPw();
		vo.setPw(UserSha256.encrypt(userPw));
		
		//��ȣȭ Ȯ��
		System.out.println("userPw:" + vo.getPw());
		
		//�α��� �޼���
		UserVo login = userService.login(vo);

		
			if(login ==null) {
				
				return "user/login";
			} else{
				session.setAttribute("login", login);
				System.out.println(login.toString());
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
		System.out.println("id : " + vo.getId()); 
		System.out.println("pw : " + vo.getPw());

		//��й�ȣ ��ȣȭ
		String s_pw = UserSha256.encrypt(vo.getPw()); 
		vo.setPw(s_pw);
		//��ȣȭ Ȯ��
		System.out.println("s_pw:" + s_pw);
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
	
	// ���̵� ã�� �������� �̵�
	@RequestMapping(value="/idFind.do", method=RequestMethod.GET)
	public String idpwFind() {
		return "user/idFind";
	}
	
	
	
	//���̵� ã�� ����
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
					out.println("<script>alert('��ġ�ϴ� ���̵� �������� �ʽ��ϴ�.'); history.go(-1);</script>");
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
	
	// ȸ������ ��Ʈ�ѷ�
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
			
		return "user/join";
	}
	
	//ȸ������ ��Ʈ�ѷ�
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(UserVo vo, Model model,HttpServletRequest request ) {
		
		//��ȣȮ��
		System.out.println("ù��°"+vo.getPw());
		
		//��й�ȣ ��ȣȭ(sha256
		String encryPassword = UserSha256.encrypt(vo.getPw());//1.�޾ƿ� ���� ��ȣȭ�Ѵ�.
	
		vo.setPw(encryPassword);//2. �װ��� ����
		
		System.out.println("�ι�°"+vo.getPw());
		
		//ȸ������ �޼���
		int joinVo = userService.join(vo);//3. ����� ��ü �״�� �����ͷ� ������.
	
		//���� ���� ������ �޼��� 
		
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
	public String joinCoun(UserVo vo,Model model,HttpServletRequest request ) {
		
		//��ȣȮ��
		System.out.println("ù��°"+vo.getPw());
				
		//��й�ȣ ��ȣȭ(sha256
		String encryPassword = UserSha256.encrypt(vo.getPw());//1.�޾ƿ� ���� ��ȣȭ�Ѵ�.
			
		vo.setPw(encryPassword);//2. �װ��� ����
				
		System.out.println("�ι�°"+vo.getPw());
		
		int joinCounVo = userService.joinCoun(vo);//3. ����� ��ü �״�� �����ͷ� ������.
		
		return "user/joinComplete";
	}
	
	@RequestMapping(value="joinComplete.do", method=RequestMethod.GET)
	public String joinComplete() {
		
		return "user/joinComplete";
	}
}
