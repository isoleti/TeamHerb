package project.healingcamp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.Criteria;
import project.healingcamp.vo.MyCriteria;
import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.ReviewVo;
import project.healingcamp.vo.UserVo;

@Repository
public class PageDao {

	@Autowired
	private SqlSession sqlSession;
 
	public UserVo pwCheck(UserVo vo) {
		return sqlSession.selectOne("project.healingcamp.mapper.pageMapper.pwCheck", vo);
	}
	public List<ReserveVO> list(ReserveVO vo){
			return sqlSession.selectList("project.healingcamp.mapper.reserveMapper.list",vo);
		}
	public List<Community_BoardVO> list(MyCriteria cri){
		return sqlSession.selectList("project.healingcamp.mapper.pageMapper.list", cri);
	}
	 public int total(MyCriteria cri) {
		 return sqlSession.selectOne("project.healingcamp.mapper.pageMapper.total", cri);
	 }
}
