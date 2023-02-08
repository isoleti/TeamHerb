package project.healingcamp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.LikeVO;

@Repository
public class LikeDAO {
	
	@Autowired
	private SqlSession sqlSession; 
	
	//좋아요 눌렀는지 안눌렀는지 체크
	public int likeCount(LikeVO likeVO) {
		return sqlSession.selectOne("project.healingcamp.mapper.likeMapper.likeCount", likeVO);
	}

	
	//좋아요 +1 / 좋아요 누른 후 총 갯수
	public Community_BoardVO likeUp(LikeVO likeVO) {
		
		Community_BoardVO cboardVO = new Community_BoardVO();
		cboardVO.setBidx(likeVO.getBidx());
		
		//좋아요 +1
		sqlSession.update("project.healingcamp.mapper.likeMapper.addLikeCnt", cboardVO); 
		//로그인한 회원+게시글
		int result = sqlSession.insert("project.healingcamp.mapper.likeMapper.likeUp", likeVO); 
		
		if(result == 1) {
			// 좋아요 총 갯수
			cboardVO = sqlSession.selectOne("project.healingcamp.mapper.likeMapper.likeNum", cboardVO); 
		}
		return cboardVO;
	}
	
	//좋아요 -1 / 좋아요 취소 후 총 갯수
	public Community_BoardVO likeDown(LikeVO likeVO) {
		Community_BoardVO cboardVO = new Community_BoardVO();
		cboardVO.setBidx(likeVO.getBidx());
		
		//좋아요 -1
		sqlSession.update("project.healingcamp.mapper.likeMapper.removeLikeCnt", cboardVO);
		//좋아요 삭제
		int result = sqlSession.delete("project.healingcamp.mapper.likeMapper.likeDown", likeVO);
		
		if(result == 1) {
			// 좋아요 총 갯수
			cboardVO = sqlSession.selectOne("project.healingcamp.mapper.likeMapper.likeNum", cboardVO); 
		}
		return cboardVO;
	}
	
	public List<LikeVO> likeList(){
		return sqlSession.selectList("project.healingcamp.mapper.likeMapper.likeList");
	}
	


}
