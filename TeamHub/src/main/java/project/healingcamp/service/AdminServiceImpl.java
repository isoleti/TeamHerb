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

	//�Ϲ�ȸ��
	@Override
	public List<UserVo> member_List(SearchVO searchVO) {

		List<UserVo> member_List = adminDAO.member_List(searchVO);
		
		return member_List;
	}

	@Override
	public int tatal(SearchVO searchVO) {

		return adminDAO.total(searchVO);
	}

	//Ż��
	@Override
	public int update_member(UserVo userVo) {

		return adminDAO.update_member(userVo);
	}

	//����
	@Override
	public List<UserVo> counseller_List(SearchVO searchVO) {
		List<UserVo> counseller_List = adminDAO.counseller_member_List(searchVO);
		return counseller_List;
	}

	@Override
	public int counseller_total(SearchVO searchVO) {
		return adminDAO.counseller_total(searchVO);
	}

	
	//Ŀ�´�Ƽ
	@Override
	public List<Community_BoardVO> community_List(SearchVO searchVO) {
		List<Community_BoardVO> community_List = adminDAO.community_List(searchVO);
		return community_List;
	}

	@Override
	public int community_Total(SearchVO searchVO) {
		return adminDAO.community_Total(searchVO);
	}

	//�Խñۻ���
	@Override
	public int community_DeleteByBidx(Community_BoardVO cboardVO) {
		return adminDAO.community_DeleteByBidx(cboardVO);
	}

	//����Խ���
	@Override
	public List<Community_BoardVO> counseller_board_list(SearchVO searchVO) {
		List<Community_BoardVO> counseller_board_list = adminDAO.counseller_board_list(searchVO);
		return counseller_board_list;
	}

	@Override
	public int counseller_board_total(SearchVO searchVO) {
		return adminDAO.counseller_board_total(searchVO);
	}

	//��������/FAQ�ۼ�
	@Override
	public int admin_Insert(Community_BoardVO cboardVO) {
		return adminDAO.admin_Insert(cboardVO);
	}

	//�������� 
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

	@Override
	public Community_BoardVO Notice_selectBybidx(int bidx) {
		
		return adminDAO.Notice_selectBybidx(bidx);
	}

	@Override
	public int NoticeUpdate_ByBidx(Community_BoardVO cboardVO) {
		
		return adminDAO.NoticeUpdate_ByBidx(cboardVO);
	}

	
}
