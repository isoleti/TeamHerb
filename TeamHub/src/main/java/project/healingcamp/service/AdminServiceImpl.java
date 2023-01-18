package project.healingcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.AdminDAO;
import project.healingcamp.vo.SearchVO;
import project.healingcamp.vo.UserVo;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;

	@Override
	public List<UserVo> member_List(SearchVO searchVO) {

		List<UserVo> member_List = adminDAO.member_List(searchVO);
		
		return member_List;
	}

	@Override
	public int tatal(SearchVO searchVO) {

		return adminDAO.total(searchVO);
	}

	@Override
	public int delete_member(int uidx) {

		return adminDAO.delete_member(uidx);
	}
}
