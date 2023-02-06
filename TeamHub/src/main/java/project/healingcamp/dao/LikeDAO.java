package project.healingcamp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.LikeVO;

@Repository
public class LikeDAO {
	
	@Autowired
	private SqlSession sqlSession; 
	
	public int likeCount(LikeVO likeVO) {
		return sqlSession.selectOne("project.healingcamp.mapper.likeMapper.likeCount", likeVO);
	}
	
	public int likeUp(LikeVO likeVO) {
		return sqlSession.insert("project.healingcamp.mapper.likeMapper.likeUp", likeVO);
	}
	
	public int likeDown(LikeVO likeVO) {
		return sqlSession.delete("project.healingcamp.mapper.likeMapper.likeDown", likeVO);
	}

}
