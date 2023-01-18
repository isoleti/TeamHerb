package project.healingcamp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.SearchVO;
import project.healingcamp.vo.UserVo;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<UserVo> member_List(SearchVO searchVO){
				
		return sqlSession.selectList("project.hilingcamp.mapper.adminMapper.member_List",searchVO);
	}
	
	public int total(SearchVO searchVO) {
		
		return sqlSession.selectOne("project.hilingcamp.mapper.adminMapper.total",searchVO);
	}
	
	public int delete_member(int uidx) {
		
		return sqlSession.delete("project.hilingcamp.mapper.adminMapper.delete_member", uidx);
	}
}
