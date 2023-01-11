package project.healingcamp.service;

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
	public int selectById(String Id) {
		return userDao.selectById(Id);
	}
	

	
}
