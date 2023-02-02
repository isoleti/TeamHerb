package project.healingcamp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.ReplyVO;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//����ۼ�
	public int reply_Insert(ReplyVO replyVO) {
		return sqlSession.insert("project.healingcamp.mapper.replyMapper.reply_Insert", replyVO);
	}
	
	//Ŀ�´�Ƽ ��� ���
	public List<ReplyVO> reply_list(int bidx){
		return sqlSession.selectList("project.healingcamp.mapper.replyMapper.reply_list",bidx);
	}
	
	//���� �Խ��� ��� ���
	public List<ReplyVO> counseller_reply_list(int bidx){
		return sqlSession.selectList("project.healingcamp.mapper.replyMapper.counseller_reply_list",bidx);
	}
	
	//��� ����
	public int deleteByReply(ReplyVO replyVO) {
		return sqlSession.delete("project.healingcamp.mapper.replyMapper.deleteByReply", replyVO);
	}
	
	//��� ����
	public int updateByReply(ReplyVO replyVO) {
		return sqlSession.update("project.healingcamp.mapper.replyMapper.updateByReply", replyVO);
	}
	
	//���� �ۼ�
	public int re_replyInsert(ReplyVO replyVO) {
		return sqlSession.insert("project.healingcamp.mapper.replyMapper.re_replyInsert",replyVO);
	}
	
	
}

