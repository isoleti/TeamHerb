package project.healingcamp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.ReserveVO;
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
}
