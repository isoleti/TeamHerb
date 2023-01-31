package project.healingcamp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.PageVO;
import project.healingcamp.vo.SearchVO;

@Repository
public class Community_BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//커뮤니티
	public List<Community_BoardVO> list(SearchVO searchVO){
		return sqlSession.selectList("project.healingcamp.mapper.communityMapper.list",searchVO);
	}
	
	public Community_BoardVO selectByBidx(int bidx) {
		return sqlSession.selectOne("project.healingcamp.mapper.communityMapper.selectByBidx", bidx);
	}
	
	public int total(SearchVO searchVO) {
		return sqlSession.selectOne("project.healingcamp.mapper.communityMapper.total",searchVO);
	}
	
	public int insert(Community_BoardVO cboardVO) {
		return sqlSession.insert("project.healingcamp.mapper.communityMapper.insert",cboardVO);
	}
	
	public int maxBidx() {
		return sqlSession.selectOne("project.healingcamp.mapper.communityMapper.maxBidx");
	}
	
	public int hitCount(int bidx) {
		return sqlSession.update("project.healingcamp.mapper.communityMapper.hitCount", bidx);
	}
	
	public int deleteByBidx(int bidx) {
		return sqlSession.update("project.healingcamp.mapper.communityMapper.deleteByBidx", bidx);
	}
	
	public List<Community_BoardVO> selectByCategory() {
		return sqlSession.selectList("project.healingcamp.mapper.communityMapper.selectByCategory");
	}
	
	public int modifyByBidx(Community_BoardVO cboardVO) {
		return sqlSession.update("project.healingcamp.mapper.communityMapper.modifyByBidx", cboardVO);
	}
	public int addReplyCnt(int bidx) {
		return sqlSession.update("project.healingcamp.mapper.communityMapper.addReplyCnt",bidx);
	}
	public int removeReplyCnt(int bidx) {
		return sqlSession.update("project.healingcamp.mapper.communityMapper.removeReplyCnt",bidx);
	}
	
		
	
	//상담사게시판
	public List<Community_BoardVO> counseller_board_list(SearchVO searchVO){
		return sqlSession.selectList("project.healingcamp.mapper.counseller_BoardMapper.counseller_board_list",searchVO);
	}
	
	public Community_BoardVO counseller_selectByBidx(int bidx) {
		return sqlSession.selectOne("project.healingcamp.mapper.counseller_BoardMapper.counseller_selectByBidx", bidx);
	}
	
	public int counseller_board_total(SearchVO searchVO) {
		return sqlSession.selectOne("project.healingcamp.mapper.counseller_BoardMapper.counseller_board_total",searchVO);
	}
	
	public int counseller_board_insert(Community_BoardVO cboardVO) {
		return sqlSession.insert("project.healingcamp.mapper.counseller_BoardMapper.counseller_board_insert",cboardVO);
	}
	
	public int counseller_board_maxBidx() {
		return sqlSession.selectOne("project.healingcamp.mapper.counseller_BoardMapper.counseller_board_maxBidx");
	}
	
	public int counseller_board_hitCount(int bidx) {
		return sqlSession.update("project.healingcamp.mapper.counseller_BoardMapper.counseller_board_hitCount", bidx);
	}

	public int counseller_board_deleteByBidx(int bidx) {
		return sqlSession.update("project.healingcamp.mapper.counseller_BoardMapper.counseller_board_deleteByBidx", bidx);
	}
	
	public int counseller_board_modifyByBidx(Community_BoardVO cboardVO) {
		return sqlSession.update("project.healingcamp.mapper.counseller_BoardMapper.counseller_board_modifyByBidx", cboardVO);
	}
}
