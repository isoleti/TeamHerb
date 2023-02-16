package project.healingcamp.service;

import java.util.List;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.SearchVO;
import project.healingcamp.vo.UserVo;

public interface AdminService {
	
	//�Ϲ�ȸ��
	List<UserVo> member_List(SearchVO searchVO);
	int tatal(SearchVO searchVO);
	
	//����
	List<UserVo> counseller_List(SearchVO searchVO);
	int counseller_total(SearchVO searchVO);
	
	//ȸ��Ż��
	int update_member(UserVo userVo);
	
	//Ŀ�´�Ƽ
	List<Community_BoardVO> community_List(SearchVO searchVO);
	int community_Total(SearchVO searchVO);
	
	//�Խñۻ���
	int community_DeleteByBidx(Community_BoardVO cboardVO);
	
	//����Խ���
	List<Community_BoardVO> counseller_board_list(SearchVO searchVO);
	int counseller_board_total(SearchVO searchVO);
	
	//��������.FAQ�ۼ�
	int admin_Insert(Community_BoardVO cboardVO);
	
	//��������
	List<Community_BoardVO> notice_List(SearchVO searchVO);
	int notice_Total(SearchVO searchVO);
	
	//FAQ
	List<Community_BoardVO> faq_List(SearchVO searchVO);
	int faq_Total(SearchVO searchVO);
	Community_BoardVO faq_selectBybidx(int bidx); 
	int FaqUpdate_ByBidx(Community_BoardVO cboardVO);
	
	Community_BoardVO Notice_selectBybidx(int bidx); 
	
	//�������� ���� 
	int NoticeUpdate_ByBidx(Community_BoardVO cboardVO);
	
	//���೻������Ʈ
	public List<ReserveVO> reserveList(SearchVO searchVO);
	//���೻�� �� ����
	public int reserve_Total(SearchVO searchVO);
}
