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
	
	public int reply_Insert(ReplyVO replyVO) {
		return sqlSession.insert("project.healingcamp.mapper.replyMapper.reply_Insert", replyVO);
	}
	
	public List<ReplyVO> reply_list(int bidx){
		List<ReplyVO> reply_list = sqlSession.selectList("project.healingcamp.mapper.replyMapper.reply_list",bidx);
		return reply_list;
	}
}
