package project.healingcamp.service;

import project.healingcamp.vo.UserVo;

public interface UserService {
	UserVo login(UserVo vo);
	int selectById(String id);
	int selectByMail(String mail);
	int join(UserVo vo);
	int joinCoun(UserVo vo);
}
