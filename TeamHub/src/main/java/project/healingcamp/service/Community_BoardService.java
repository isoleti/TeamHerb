package project.healingcamp.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.SearchVO;

public interface Community_BoardService {
	
	//커뮤니티
	List<Community_BoardVO> list(SearchVO searchVO);
	Community_BoardVO selectByBidx(int bidx);
	int total(SearchVO searchVO);
	int insert(Community_BoardVO cboardVO);
	int maxBidx();
	int hitCount(int bidx);
	int deleteByBidx(int bidx);
	List<Community_BoardVO> categoryList();
	int modifyByBidx(Community_BoardVO cboardVO);
	
	//상담사게시판
	List<Community_BoardVO> counseller_board_list(SearchVO searchVO);
	Community_BoardVO counseller_selectByBidx(int bidx);
	int counseller_board_total(SearchVO searchVO);
	int counseller_board_insert(Community_BoardVO cboardVO);
	int counseller_board_maxBidx();
	int counseller_board_hitCount(int bidx);
	int counseller_board_deleteByBidx(int bidx);
	int counseller_board_modifyByBidx(Community_BoardVO cboardVO);

}
