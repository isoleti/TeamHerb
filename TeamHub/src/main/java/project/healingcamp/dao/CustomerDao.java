package project.healingcamp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.Community_BoardVO;
@Repository
public class CustomerDao {
	@Autowired
	private SqlSession sqlSession;
	
	//게시판 목록
	public List<Community_BoardVO> customerNotice(Community_BoardVO cboardVO) {
		return sqlSession.selectList("project.healingcamp.mapper.customerMapper.notice_getList",cboardVO);
	}	
}
