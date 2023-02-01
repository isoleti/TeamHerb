package project.healingcamp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.Criteria;
import project.healingcamp.vo.ReviewVo;

@Repository
public class ReviewDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<ReviewVo> list(Criteria cri){
		return sqlSession.selectList("project.healingcamp.mapper.reviewMapper.list", cri);
	}
	 public int total(Criteria cri) {
		 return sqlSession.selectOne("project.healingcamp.mapper.reviewMapper.total", cri);
	 };
	 
	public int deleteRidx(int ridx) {
		return sqlSession.delete("project.healingcamp.mapper.reviewMapper.deleteRidx", ridx);
	}
	
	public int insert(ReviewVo reviewVo) {
		return sqlSession.insert("project.healingcamp.mapper.reviewMapper.insert", reviewVo);
	}

}
