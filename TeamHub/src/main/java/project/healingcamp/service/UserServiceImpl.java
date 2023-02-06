package project.healingcamp.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.UserDao;
import project.healingcamp.vo.UserVo;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public UserVo login(UserVo vo) {
		
		return userDao.login(vo);
	}

	@Override
	public int join(UserVo vo) {
	
		return userDao.join(vo);
	}

	@Override
	public int joinCoun(UserVo vo) {
		
		return userDao.joinCoun(vo);
	}
	
	@Override
	public int selectById(String id) {
		
		return userDao.selectById(id);
	}

	@Override
	public int selectByMail(String mail) {
		
		return userDao.selectByMail(mail);
	}
	@Override
	public int selectByPhone(int phone) {
		
		return userDao.selectByPhone(phone);
	}
	@Override
	public int loginCheck(UserVo vo, HttpSession session) {
		System.out.println("UserService");
		System.out.println("ID : " + vo.getId());
		System.out.println("PW : " + vo.getPw());
		return userDao.loginCheck(vo);
	}

	@Override
	public String findId(String mail) {
	
		return userDao.findId(mail);
	}

	@Override
	public int userDelete(UserVo vo) {
		
		return userDao.userDelete(vo);
	}

	@Override
	public UserVo selectByUidx(int uidx) {
		
		return userDao.selectByUidx(uidx);
	}
	//회원정보 수정
	@Override
	public int userModify(UserVo vo) {
		System.out.println("서비스임플에서 uidx: "+vo.getUidx());
		return userDao.userModify(vo);
	}
	//회원정보 비밀번호 변경
	@Override
	public int pwReset(UserVo vo) {
		return userDao.pwReset(vo);
	}

	//비밀번호 회원정보 조회
	@Override
	public UserVo selectJoin(String mail) {
		
		return userDao.selectJoin(mail);
	}
		
	//비밀번호 업데이트
	@Override
	public int pwUpdate(UserVo vo) {
	
	//비밀번호 암호화
	String s_pw = UserSha256.encrypt(vo.getPw()); 
	vo.setPw(s_pw);
	
	//암호화 확인
	System.out.println("s_pw:" + s_pw);
			
	return userDao.pwUpdate(vo);
	}

	
	
		
}
