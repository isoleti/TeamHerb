package project.healingcamp.service;

import java.util.List;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.CriteriaVO;
import project.healingcamp.vo.SearchVO;

public interface Community_BoardService {
	
	List<Community_BoardVO> list(SearchVO searchVO);
	Community_BoardVO selectByBidx(int bidx);
	int totalCount();
	
	List<Community_BoardVO> counseller_board_list(SearchVO searchVO);
	Community_BoardVO counseller_selectByBidx(int bidx);
	


}
