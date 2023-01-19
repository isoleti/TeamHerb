package project.healingcamp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.SearchVO;
import project.healingcamp.vo.UserVo;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//일반회원
	public List<UserVo> member_List(SearchVO searchVO){
				
		return sqlSession.selectList("project.healingcamp.mapper.adminMapper.member_List",searchVO);
	}
	
	public int total(SearchVO searchVO) {
		
		return sqlSession.selectOne("project.healingcamp.mapper.adminMapper.total",searchVO);
	}
	
	//상담사
	public List<UserVo> counseller_member_List(SearchVO searchVO){
		
		return sqlSession.selectList("project.healingcamp.mapper.adminMapper.counseller_List",searchVO);
	}
	
	public int counseller_total(SearchVO searchVO) {
		
		return sqlSession.selectOne("project.healingcamp.mapper.adminMapper.counseller_total",searchVO);
	}
	
	//회원탈퇴
	public int delete_member(UserVo userVo) {
		
		return sqlSession.delete("project.healingcamp.mapper.adminMapper.delete_member", userVo);
	}
	
	//커뮤니티
	public List<Community_BoardVO> community_List(SearchVO searchVO){
		return sqlSession.selectList("project.healingcamp.mapper.adminMapper.community_List",searchVO);
	}
	
	public int community_Total(SearchVO searchVO) {
		return sqlSession.selectOne("project.healingcamp.mapper.adminMapper.community_Total",searchVO);
	}
	
	public int community_DeleteByBidx(int bidx) {
		return sqlSession.update("project.healingcamp.mapper.adminMapper.community_DeleteByBidx", bidx);
	}
	
	//상담사게시판
	public List<Community_BoardVO> counseller_board_list(SearchVO searchVO){
		return sqlSession.selectList("project.healingcamp.mapper.adminMapper.counseller_board_list",searchVO);
	}
	
	public int counseller_board_total(SearchVO searchVO) {
		return sqlSession.selectOne("project.healingcamp.mapper.adminMapper.counseller_board_total",searchVO);
	}
	
}
