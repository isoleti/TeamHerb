package project.healingcamp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.MyCriteria;
import project.healingcamp.vo.MyRCriteria;
import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.UserVo;

@Repository
public class PageDao {

	@Autowired
	private SqlSession sqlSession;
	//��й�ȣ üũ
	public UserVo pwCheck(UserVo vo) {
		return sqlSession.selectOne("project.healingcamp.mapper.pageMapper.pwCheck", vo);
	}
	//���������� ���Ǳ۾��� ���
	public List<Community_BoardVO> list(MyCriteria cri){
		System.out.println("���� ����Ʈ: "+cri.toString());
		return sqlSession.selectList("project.healingcamp.mapper.pageMapper.list", cri);
	}
	public int total(MyCriteria cri) {
		
		 return sqlSession.selectOne("project.healingcamp.mapper.pageMapper.total", cri);
	 }
	//���������� ���� ���
	public List<ReserveVO> reslist(MyRCriteria rcri){
		
		return sqlSession.selectList("project.healingcamp.mapper.pageMapper.reslist",rcri);
	}
	public int res_total(MyRCriteria rcri) {
		
		 return sqlSession.selectOne("project.healingcamp.mapper.pageMapper.res_total", rcri);
	 }
	//���������� ���� ���
	public int myres_Delete(ReserveVO vo) {
			return sqlSession.update("project.healingcamp.mapper.pageMapper.myres_Delete", vo);
		}
	//���������� ��� ���
		public List<ReserveVO> counslist(MyRCriteria rcri){
			return sqlSession.selectList("project.healingcamp.mapper.pageMapper.counslist",rcri);
		}
	
	public int couns_total(MyRCriteria rcri) {
		
		 return sqlSession.selectOne("project.healingcamp.mapper.pageMapper.couns_total", rcri);
	 }
	//���������� ���� ���
		public List<ReserveVO> coun_reslist(MyRCriteria rcri){
			System.out.println();
			return sqlSession.selectList("project.healingcamp.mapper.pageMapper.coun_reslist",rcri);
		}
	public int counres_total(MyRCriteria rcri) {
		System.out.println("dao���� ���翹�� ����: "+rcri.toString());
		 return sqlSession.selectOne("project.healingcamp.mapper.pageMapper.counres_total", rcri);
	 }
	//���������� ���� ���
	public int counres_Delete(ReserveVO vo) {
			return sqlSession.update("project.healingcamp.mapper.pageMapper.counres_Delete", vo);
		}
	//���������� ���� ����
	public int counres_Check(ReserveVO vo) {
		return sqlSession.update("project.healingcamp.mapper.pageMapper.counres_Check", vo);
		}
}
