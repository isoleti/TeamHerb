package project.healingcamp.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.ReserveVO;

@Repository
public class ReserveDAO {

	 @Autowired
	 private SqlSession sqlSession;
	 
	 public int resF(ReserveVO vo) {
	 
		 return sqlSession.insert("project.healingcamp.mapper.reserveMapper.resF", vo);
	 }
	 
	 public int couF(ReserveVO vo) {
		 
		 return sqlSession.insert("project.healingcamp.mapper.reserveMapper.couF", vo);
	 }
	 
	 public ReserveVO cnoidx(ReserveVO vo) {
		 
		 return sqlSession.selectOne("project.healingcamp.mapper.reserveMapper.cnoidx",vo);
	 }
	 
	 
}
