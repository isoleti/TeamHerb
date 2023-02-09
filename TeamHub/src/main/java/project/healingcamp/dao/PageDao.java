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
 
	public UserVo pwCheck(UserVo vo) {
		return sqlSession.selectOne("project.healingcamp.mapper.pageMapper.pwCheck", vo);
	}
	//상담사페이지 예약 목록
	public List<ReserveVO> list(ReserveVO vo){
			return sqlSession.selectList("project.healingcamp.mapper.reserveMapper.list",vo);
		}
	public List<Community_BoardVO> list(MyCriteria cri){
		System.out.println("서비스 리스트: "+cri.toString());
		return sqlSession.selectList("project.healingcamp.mapper.pageMapper.list", cri);
	}
	public int total(MyCriteria cri) {
		
		 return sqlSession.selectOne("project.healingcamp.mapper.pageMapper.total", cri);
	 }
	//마이페이지 예약 목록
	public List<ReserveVO> reslist(MyRCriteria rcri){
		
		return sqlSession.selectList("project.healingcamp.mapper.pageMapper.reslist",rcri);
	}
	public int res_total(MyRCriteria rcri) {
		
		 return sqlSession.selectOne("project.healingcamp.mapper.pageMapper.res_total", rcri);
	 }
	//마이페이지 예약 취소
	public int myres_Delete(ReserveVO vo) {
			return sqlSession.update("project.healingcamp.mapper.pageMapper.myres_Delete", vo);
		}
	//마이페이지 상담 목록
		public List<ReserveVO> counslist(MyRCriteria rcri){
			return sqlSession.selectList("project.healingcamp.mapper.pageMapper.counslist",rcri);
		}
	 
}
