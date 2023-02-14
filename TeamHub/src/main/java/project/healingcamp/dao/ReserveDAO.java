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
	 
	 //����������� insert
	 public int resF(ReserveVO vo) {
	 
		 return sqlSession.insert("project.healingcamp.mapper.reserveMapper.resF", vo);
	 }
	 
	 //�����Ϸ� insert
	 public int couF(ReserveVO vo) {
		 
		 return sqlSession.insert("project.healingcamp.mapper.reserveMapper.couF", vo);
	 }
	 
	 //center key��ã��
	 public ReserveVO cnoidx(ReserveVO vo) {
		 
		 return sqlSession.selectOne("project.healingcamp.mapper.reserveMapper.cnoidx",vo);
	 }
	 
	 //���� key��ã��
	 public ReserveVO conidx(ReserveVO vo) {
		 
		 return sqlSession.selectOne("project.healingcamp.mapper.reserveMapper.conidx" ,vo);
	 }
	 
	 //�������� ����Ʈ �̱�
	 public List centerlist(ReserveVO vo) {
		 
		 return sqlSession.selectList("project.healingcamp.mapper.reserveMapper.centerlist" ,vo);
	 }
	 
	 //�������� ��ȸ
	 public ReserveVO cintidx(ReserveVO vo) {
		 
		 return sqlSession.selectOne("project.healingcamp.mapper.reserveMapper.cintidx",vo);
	 }
	 
	 //�����Ϻ���
	 public List reslist(ReserveVO vo) {
		 
		 return sqlSession.selectList("project.healingcamp.mapper.reserveMapper.reslist",vo);
	 }
	 
	 //�ı⸮��Ʈ
	 public List reviewlist(ReserveVO vo) {
		 
		 return sqlSession.selectList("project.healingcamp.mapper.reserveMapper.reviewlist",vo);
	 }
	 
	 public ReserveVO rescheck(ReserveVO vo) {
		 
		 return sqlSession.selectOne("project.healingcamp.mapper.reserveMapper.rescheck",vo);
	 }
	 
}
