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
	String findId(String mail);// ���̵� ã��
	int userDelete(UserVo vo);
	UserVo selectByUidx(int uidx);
	int userModify(UserVo vo);
	int pwReset(UserVo vo); //ȸ���������� ��� ����
	UserVo selectJoin(String mail); //ȸ������ ��ȸ
	int pwUpdate(UserVo vo);//�н����� ����
}



