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

	//게시글삭제
	@Override
	public int community_DeleteByBidx(Community_BoardVO cboardVO) {
		return adminDAO.community_DeleteByBidx(cboardVO);
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

	//공지사항/FAQ작성
	@Override
	public int admin_Insert(Community_BoardVO cboardVO) {
		return adminDAO.admin_Insert(cboardVO);
	}

	//공지사항 
	@Override
	public List<Community_BoardVO> notice_List(SearchVO searchVO) {
		
		List<Community_BoardVO> notice_List = adminDAO.notice_List(searchVO);
		
		return notice_List;
	}

	@Override
	public int notice_Total(SearchVO searchVO) {
		return adminDAO.notice_Total(searchVO);
	}

	//FAQ
	@Override
	public List<Community_BoardVO> faq_List(SearchVO searchVO) {
		List<Community_BoardVO> faq_List = adminDAO.faq_List(searchVO);
		return faq_List;
	}

	@Override
	public int faq_Total(SearchVO searchVO) {
		return adminDAO.faq_Total(searchVO);
	}
}
