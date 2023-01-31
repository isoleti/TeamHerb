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
	
	//´ñ±ÛÀÛ¼º
	public int reply_Insert(ReplyVO replyVO) {
		return sqlSession.insert("project.healingcamp.mapper.replyMapper.reply_Insert", replyVO);
	}
	
	//Ä¿¹Â´ÏÆ¼ ´ñ±Û ¸ñ·Ï
	public List<ReplyVO> reply_list(int bidx){
		List<ReplyVO> reply_list = sqlSession.selectList("project.healingcamp.mapper.replyMapper.reply_list",bidx);
		return reply_list;
	}
	
	//»ó´ã»ç °Ô½ÃÆÇ ´ñ±Û ¸ñ·Ï
		public List<ReplyVO> counseller_reply_list(int bidx){
			List<ReplyVO> reply_list = sqlSession.selectList("project.healingcamp.mapper.replyMapper.counseller_reply_list",bidx);
			return reply_list;
		}
	
	//´ñ±Û »èÁ¦
	public int deleteByReply(ReplyVO replyVO) {
		return sqlSession.delete("project.healingcamp.mapper.replyMapper.deleteByReply", replyVO);
	}
	
	//´ñ±Û ¼öÁ¤
	public int updateByReply(ReplyVO replyVO) {
		return sqlSession.update("project.healingcamp.mapper.replyMapper.updateByReply", replyVO);
	}
}
