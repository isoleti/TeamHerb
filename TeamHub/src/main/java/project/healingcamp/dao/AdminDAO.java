package project.healingcamp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.SearchVO;
import project.healingcamp.vo.UserVo;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//�Ϲ�ȸ��
	public List<UserVo> member_List(SearchVO searchVO){
				
		return sqlSession.selectList("project.healingcamp.mapper.adminMapper.member_List",searchVO);
	}
	
	public int total(SearchVO searchVO) {
		
		return sqlSession.selectOne("project.healingcamp.mapper.adminMapper.total",searchVO);
	}
	
	//����
	public List<UserVo> counseller_member_List(SearchVO searchVO){
		
		return sqlSession.selectList("project.healingcamp.mapper.adminMapper.counseller_List",searchVO);
	}
	
	public int counseller_total(SearchVO searchVO) {
		
		return sqlSession.selectOne("project.healingcamp.mapper.adminMapper.counseller_total",searchVO);
	}
	
	//ȸ��Ż��
	public int update_member(UserVo userVo) {
		return sqlSession.update("project.healingcamp.mapper.adminMapper.update_member", userVo);
	}
	
	//Ŀ�´�Ƽ
	public List<Community_BoardVO> community_List(SearchVO searchVO){
		return sqlSession.selectList("project.healingcamp.mapper.adminMapper.community_List",searchVO);
	}
	
	public int community_Total(SearchVO searchVO) {
		return sqlSession.selectOne("project.healingcamp.mapper.adminMapper.community_Total",searchVO);
	}
	
	//�Խñۻ���
	public int community_DeleteByBidx(Community_BoardVO cboardVO) {
		return sqlSession.update("project.healingcamp.mapper.adminMapper.community_DeleteByBidx", cboardVO);
	}
	
	//����Խ���
	public List<Community_BoardVO> counseller_board_list(SearchVO searchVO){
		return sqlSession.selectList("project.healingcamp.mapper.adminMapper.counseller_board_list",searchVO);
	}
	
	public int counseller_board_total(SearchVO searchVO) {
		return sqlSession.selectOne("project.healingcamp.mapper.adminMapper.counseller_board_total",searchVO);
	}
	
	//��������/FAQ�ۼ�
	public int admin_Insert(Community_BoardVO cboardVO) {
		return sqlSession.insert("project.healingcamp.mapper.adminMapper.admin_Insert", cboardVO);
	}
	
	//�������� 
	public List<Community_BoardVO> notice_List(SearchVO searchVO){
		return sqlSession.selectList("project.healingcamp.mapper.adminMapper.notice_List",searchVO);
	}
	
	public int notice_Total(SearchVO searchVO) {
		return sqlSession.selectOne("project.healingcamp.mapper.adminMapper.notice_Total",searchVO);
	}
	
	//FAQ
	public List<Community_BoardVO> faq_List(SearchVO searchVO){
		return sqlSession.selectList("project.healingcamp.mapper.adminMapper.faq_List",searchVO);
	}
	
	public int faq_Total(SearchVO searchVO) {
		return sqlSession.selectOne("project.healingcamp.mapper.adminMapper.faq_Total",searchVO);
	}
	
	
}
