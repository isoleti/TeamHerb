package project.healingcamp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.Criteria;
import project.healingcamp.vo.SearchVO;

@Repository
public class CustomerDao {
	@Autowired
	private SqlSession sqlSession;
	
	//게시판 목록
	public List<Community_BoardVO> customerNotice(Criteria cri) {
		
		return sqlSession.selectList("project.healingcamp.mapper.customerMapper.notice_getList",cri);
	}
	public int total(Criteria cri) {
		 return sqlSession.selectOne("project.healingcamp.mapper.customerMapper.total", cri);
	}
	
	//faq 목록
	public List<Community_BoardVO> customeFaq(SearchVO searchVO){
		
		return sqlSession.selectList("project.healingcamp.mapper.customerMapper.faq_List", searchVO);
	} 
	
	public int faq_Total(SearchVO searchVO) {
		return sqlSession.selectOne("project.healingcamp.mapper.customerMapper.faq_Total", searchVO);
	}
	
}
