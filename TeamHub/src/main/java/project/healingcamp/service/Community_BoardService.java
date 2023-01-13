package project.healingcamp.service;

import java.util.List;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.SearchVO;

public interface Community_BoardService {
	
	//Ŀ�´�Ƽ
	List<Community_BoardVO> list(SearchVO searchVO);
	Community_BoardVO selectByBidx(int bidx);
	int total(SearchVO searchVO);
	
	
	//����Խ���
	List<Community_BoardVO> counseller_board_list(SearchVO searchVO);
	Community_BoardVO counseller_selectByBidx(int bidx);
	int counseller_board_total(SearchVO searchVO);


}
