package project.healingcamp.service;

import javax.servlet.http.HttpSession;

import project.healingcamp.vo.UserVo;

public interface UserService {
	UserVo login(UserVo vo);
	int selectById(String id);
	int selectByMail(String mail);
	int join(UserVo vo);
	int joinCoun(UserVo vo);
	String loginCheck(UserVo vo, HttpSession session);

}
