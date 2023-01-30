package project.healingcamp.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.healingcamp.vo.UserVo;

public interface UserService {
	UserVo login(UserVo vo);
	int selectById(String id);
	int selectByMail(String mail);
	int join(UserVo vo);
	int joinCoun(UserVo vo);
	String loginCheck(UserVo vo, HttpSession session);
	String findId(String mail);
	
}



