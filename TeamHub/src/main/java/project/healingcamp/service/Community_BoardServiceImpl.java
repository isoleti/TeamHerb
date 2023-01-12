package project.healingcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.Community_BoardDAO;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.SearchVO;

@Service
public class Community_BoardServiceImpl implements Community_BoardService{

	@Autowired
	private Community_BoardDAO cboardDAO;
	
	
	//커뮤니티
	@Override
	public List<Community_BoardVO> list(SearchVO searchVO) {

		List<Community_BoardVO> list = cboardDAO.list(searchVO);
		
		return list;
	}

	@Override
	public Community_BoardVO selectByBidx(int bidx) {

		return cboardDAO.selectByBidx(bidx);
	}

	@Override
	public int total(SearchVO searchVO) {
		return cboardDAO.total(searchVO);
	}
	
	//상담사게시판
	@Override
	public List<Community_BoardVO> counseller_board_list(SearchVO searchVO) {
		
		List<Community_BoardVO> list = cboardDAO.counseller_board_list(searchVO);
		
		return list;
	}

	@Override
	
	public Community_BoardVO counseller_selectByBidx(int bidx) {
		
		return cboardDAO.counseller_selectByBidx(bidx);
	}

	@Override
	public int counseller_board_total(SearchVO searchVO) {

		return cboardDAO.counseller_board_total(searchVO);
	}

	

}
