package project.healingcamp.service;

import java.io.PrintWriter;
import java.util.List;

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
	public String loginCheck(UserVo vo, HttpSession session) {

		return userDao.loginCheck(vo);
	}

	@Override
	public String findId(String mail) {
	
		return userDao.findId(mail);
	}


	
	 
	




	

	
}
