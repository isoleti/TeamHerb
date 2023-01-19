package project.healingcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.AdminDAO;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.SearchVO;
import project.healingcamp.vo.UserVo;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;

	//일반회원
	@Override
	public List<UserVo> member_List(SearchVO searchVO) {

		List<UserVo> member_List = adminDAO.member_List(searchVO);
		
		return member_List;
	}

	@Override
	public int tatal(SearchVO searchVO) {

		return adminDAO.total(searchVO);
	}

	//탈퇴
	@Override
	public int delete_member(UserVo userVo) {

		return adminDAO.delete_member(userVo);
	}

	//상담사
	@Override
	public List<UserVo> counseller_List(SearchVO searchVO) {
		List<UserVo> counseller_List = adminDAO.counseller_member_List(searchVO);
		return counseller_List;
	}

	@Override
	public int counseller_total(SearchVO searchVO) {
		return adminDAO.counseller_total(searchVO);
	}

	
	//커뮤니티
	@Override
	public List<Community_BoardVO> community_List(SearchVO searchVO) {
		List<Community_BoardVO> community_List = adminDAO.community_List(searchVO);
		return community_List;
	}

	@Override
	public int community_Total(SearchVO searchVO) {
		return adminDAO.community_Total(searchVO);
	}

	@Override
	public int community_DeleteByBidx(int bidx) {
		return adminDAO.community_DeleteByBidx(bidx);
	}

	//상담사게시판
	@Override
	public List<Community_BoardVO> counseller_board_list(SearchVO searchVO) {
		List<Community_BoardVO> counseller_board_list = adminDAO.counseller_board_list(searchVO);
		return counseller_board_list;
	}

	@Override
	public int counseller_board_total(SearchVO searchVO) {
		return adminDAO.counseller_board_total(searchVO);
	}
}
