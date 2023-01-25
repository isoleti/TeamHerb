package project.healingcamp.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project.healingcamp.service.UserService;
import project.healingcamp.vo.UserVo;

@RequestMapping("/user")
@Controller

public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/login.do", method= RequestMethod.GET)
	public String login() {
		return "user/login";
	}

	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(UserVo vo, HttpSession session) {
		System.out.println("vo : " + vo.toString());
		
		UserVo login = userService.login(vo);
			
			if(login ==null) {
				return "user/login";
			} else{
				session.setAttribute("login", login);
				System.out.println(login.toString());
				return "redirect:/";
			}
		
	}
	
	@RequestMapping(value="/idFind.do", method=RequestMethod.GET)
	public String idpwFind() {
		return "user/idFind";
	}
	
	@RequestMapping(value="/pwFind.do", method=RequestMethod.GET)
	public String pwFind() {
		return "user/pwFind";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		
		return "user/join";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(UserVo vo) {
		
		int joinVo = userService.join(vo);
		
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
	
	@RequestMapping(value="/joinCounselor.do", method=RequestMethod.GET)
	public String joinCoun() {
		
		return "user/joinCounselor";
	}
	@RequestMapping(value="/joinCounselor.do", method=RequestMethod.POST)
	public String joinCoun(UserVo vo) {
		
		int joinCounVo = userService.joinCoun(vo);
		
		return "user/joinComplete";
	}
	
	@RequestMapping(value="joinComplete.do", method=RequestMethod.GET)
	public String joinComplete() {
		
		return "user/joinComplete";
	}
}
