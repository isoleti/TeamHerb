package project.healingcamp.service;

import java.util.List;

import project.healingcamp.vo.SearchVO;
import project.healingcamp.vo.UserVo;

public interface AdminService {
	
	List<UserVo> member_List(SearchVO searchVO);
	int tatal(SearchVO searchVO);
	int delete_member(int uidx);
}
