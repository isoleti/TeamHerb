package project.healingcamp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.CriteriaVO;
import project.healingcamp.vo.PageVO;
import project.healingcamp.vo.SearchVO;

@Repository
public class Community_BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Community_BoardVO> list(SearchVO searchVO){
		return sqlSession.selectList("project.healingcamp.mapper.communityMapper.list",searchVO);
	}
	
	public Community_BoardVO selectByBidx(int bidx) {
		return sqlSession.selectOne("project.healingcamp.mapper.communityMapper.selectByBidx", bidx);
	}
	
	public int totlaCount() {
		return sqlSession.selectOne("project.healingcamp.mapper.communityMapper.totlaCount");
	}
	
	
	
	
	public List<Community_BoardVO> counseller_board_list(SearchVO searchVO){
		return sqlSession.selectList("project.healingcamp.mapper.counseller_BoardMapper.counseller_board_list",searchVO);
	}
	
	public Community_BoardVO counseller_selectByBidx(int bidx) {
		return sqlSession.selectOne("project.healingcamp.mapper.counseller_BoardMapper.counseller_selectByBidx", bidx);
	}
	

}
