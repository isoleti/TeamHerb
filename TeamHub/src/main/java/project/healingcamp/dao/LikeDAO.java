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
	
	//���ƿ� �������� �ȴ������� üũ
	public int likeCount(LikeVO likeVO) {
		return sqlSession.selectOne("project.healingcamp.mapper.likeMapper.likeCount", likeVO);
	}

	
	//���ƿ� +1 / ���ƿ� ���� �� �� ����
	public Community_BoardVO likeUp(LikeVO likeVO) {
		
		Community_BoardVO cboardVO = new Community_BoardVO();
		cboardVO.setBidx(likeVO.getBidx());
		
		//���ƿ� +1
		sqlSession.update("project.healingcamp.mapper.likeMapper.addLikeCnt", cboardVO); 
		//�α����� ȸ��+�Խñ�
		int result = sqlSession.insert("project.healingcamp.mapper.likeMapper.likeUp", likeVO); 
		
		if(result == 1) {
			// ���ƿ� �� ����
			cboardVO = sqlSession.selectOne("project.healingcamp.mapper.likeMapper.likeNum", cboardVO); 
		}
		return cboardVO;
	}
	
	//���ƿ� -1 / ���ƿ� ��� �� �� ����
	public Community_BoardVO likeDown(LikeVO likeVO) {
		Community_BoardVO cboardVO = new Community_BoardVO();
		cboardVO.setBidx(likeVO.getBidx());
		
		//���ƿ� -1
		sqlSession.update("project.healingcamp.mapper.likeMapper.removeLikeCnt", cboardVO);
		//���ƿ� ����
		int result = sqlSession.delete("project.healingcamp.mapper.likeMapper.likeDown", likeVO);
		
		if(result == 1) {
			// ���ƿ� �� ����
			cboardVO = sqlSession.selectOne("project.healingcamp.mapper.likeMapper.likeNum", cboardVO); 
		}
		return cboardVO;
	}
	
	public List<LikeVO> likeList(){
		return sqlSession.selectList("project.healingcamp.mapper.likeMapper.likeList");
	}
	


}
