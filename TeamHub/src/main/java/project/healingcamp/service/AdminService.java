package project.healingcamp.service;

import java.util.List;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.SearchVO;
import project.healingcamp.vo.UserVo;

public interface AdminService {
	
	//일반회원
	List<UserVo> member_List(SearchVO searchVO);
	int tatal(SearchVO searchVO);
	
	//상담사
	List<UserVo> counseller_List(SearchVO searchVO);
	int counseller_total(SearchVO searchVO);
	
	//회원탈퇴
	int delete_member(UserVo userVo);
	
	//커뮤니티
	List<Community_BoardVO> community_List(SearchVO searchVO);
	int community_Total(SearchVO searchVO);
	
	//게시글삭제
	int community_DeleteByBidx(Community_BoardVO cboardVO);
	
	//상담사게시판
	List<Community_BoardVO> counseller_board_list(SearchVO searchVO);
	int counseller_board_total(SearchVO searchVO);
	
	//공지사항.FAQ작성
	int admin_Insert(Community_BoardVO cboardVO);
	
	//공지사항
	List<Community_BoardVO> notice_List(SearchVO searchVO);
	int notice_Total(SearchVO searchVO);
	
	//FAQ
	List<Community_BoardVO> faq_List(SearchVO searchVO);
	int faq_Total(SearchVO searchVO);
	
}
