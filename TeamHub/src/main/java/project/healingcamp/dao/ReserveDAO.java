package project.healingcamp.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.ReserveVO;

@Repository
public class ReserveDAO {

	 @Autowired
	 private SqlSession sqlSession;
	 
	 //현장결제예약 insert
	 public int resF(ReserveVO vo) {
	 
		 return sqlSession.insert("project.healingcamp.mapper.reserveMapper.resF", vo);
	 }
	 
	 //결제완료 insert
	 public int couF(ReserveVO vo) {
		 
		 return sqlSession.insert("project.healingcamp.mapper.reserveMapper.couF", vo);
	 }
	 
	 //center key값찾기
	 public ReserveVO cnoidx(ReserveVO vo) {
		 
		 return sqlSession.selectOne("project.healingcamp.mapper.reserveMapper.cnoidx",vo);
	 }
	 
	 //상담사 key값찾기
	 public ReserveVO conidx(ReserveVO vo) {
		 
		 return sqlSession.selectOne("project.healingcamp.mapper.reserveMapper.conidx" ,vo);
	 }
	 
	 public List centerlist(ReserveVO vo) {
		 
		 return sqlSession.selectList("project.healingcamp.mapper.reserveMapper.centerlist" ,vo);
	 }
}
