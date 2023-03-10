package project.healingcamp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.SearchVO;
import project.healingcamp.vo.UserVo;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//일반회원
	public List<UserVo> member_List(SearchVO searchVO){
				
		return sqlSession.selectList("project.healingcamp.mapper.adminMapper.member_List",searchVO);
	}
	
	public int total(SearchVO searchVO) {
		
		return sqlSession.selectOne("project.healingcamp.mapper.adminMapper.total",searchVO);
	}
	
	//상담사
	public List<UserVo> counseller_member_List(SearchVO searchVO){
		
		return sqlSession.selectList("project.healingcamp.mapper.adminMapper.counseller_List",searchVO);
	}
	
	public int counseller_total(SearchVO searchVO) {
		
		return sqlSession.selectOne("project.healingcamp.mapper.adminMapper.counseller_total",searchVO);
	}
	
	//회원탈퇴
	public int update_member(UserVo userVo) {
		return sqlSession.update("project.healingcamp.mapper.adminMapper.update_member", userVo);
	}
	
	//커뮤니티
	public List<Community_BoardVO> community_List(SearchVO searchVO){
		return sqlSession.selectList("project.healingcamp.mapper.adminMapper.community_List",searchVO);
	}
	
	public int community_Total(SearchVO searchVO) {
		return sqlSession.selectOne("project.healingcamp.mapper.adminMapper.community_Total",searchVO);
	}
	
	//게시글삭제
	public int community_DeleteByBidx(Community_BoardVO cboardVO) {
		return sqlSession.update("project.healingcamp.mapper.adminMapper.community_DeleteByBidx", cboardVO);
	}
	
	//상담사게시판
	public List<Community_BoardVO> counseller_board_list(SearchVO searchVO){
		return sqlSession.selectList("project.healingcamp.mapper.adminMapper.counseller_board_list",searchVO);
	}
	
	public int counseller_board_total(SearchVO searchVO) {
		return sqlSession.selectOne("project.healingcamp.mapper.adminMapper.counseller_board_total",searchVO);
	}
	
	//공지사항/FAQ작성
	public int admin_Insert(Community_BoardVO cboardVO) {
		return sqlSession.insert("project.healingcamp.mapper.adminMapper.admin_Insert", cboardVO);
	}
	
	//공지사항 
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
	//FAQ 조회
		public Community_BoardVO faq_selectBybidx(int bidx) {
			
			return sqlSession.selectOne("project.healingcamp.mapper.adminMapper.faq_selectBybidx",bidx);	
		}
	//FAQ 수정
	public int FaqUpdate_ByBidx(Community_BoardVO cboardVO) {
		
		return sqlSession.update("project.healingcamp.mapper.adminMapper.FaqUpdate_ByBidx",cboardVO);
	}
	//공지사항 조회
	public Community_BoardVO Notice_selectBybidx(int bidx) {
		System.out.println("공지사항 조회"+bidx);
		return sqlSession.selectOne("project.healingcamp.mapper.adminMapper.Notice_selectBybidx",bidx);	
	}
	
	//공지사항 수정
	public int NoticeUpdate_ByBidx(Community_BoardVO cboardVO) {
		System.out.println("공지사항 수정"+cboardVO);
		return sqlSession.update("project.healingcamp.mapper.adminMapper.NoticeUpdate_ByBidx",cboardVO);
	}
	
	//예약내역 리스트
	public List<ReserveVO> reserveList(SearchVO searchVO){
		return sqlSession.selectList("project.healingcamp.mapper.adminMapper.reserveList",searchVO);
	}
	//예약내역 총 갯수
	public int reserve_Total(SearchVO searchVO) {
		return sqlSession.selectOne("project.healingcamp.mapper.adminMapper.reserve_Total", searchVO);
	}
	
}
