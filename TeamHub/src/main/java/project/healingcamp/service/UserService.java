package project.healingcamp.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.healingcamp.vo.UserVo;

public interface UserService {
	UserVo login(UserVo vo);
	int selectById(String id);
	int selectByMail(String mail);
	int selectByPhone(int phone);
	int join(UserVo vo);
	int joinCoun(UserVo vo);
	int loginCheck(UserVo vo, HttpSession session);
	String findId(String mail);// 아이디 찾기
	int userDelete(UserVo vo);
	UserVo selectByUidx(int uidx);
	int userModify(UserVo vo);
	int pwReset(UserVo vo); //회원정보에서 비번 변경
	UserVo selectJoin(String mail); //회원정보 조회
	int pwUpdate(UserVo vo);//패스워드 변경
}



