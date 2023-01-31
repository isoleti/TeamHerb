package project.healingcamp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.ReserveVO;

@Repository
public class PageDao {

	@Autowired
	private SqlSession sqlSession;
 
	  public List<ReserveVO> list(ReserveVO vo){
			return sqlSession.selectList("project.healingcamp.mapper.reserveMapper.list",vo);
		}
}
