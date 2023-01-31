package project.healingcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.healingcamp.dao.Community_BoardDAO;
import project.healingcamp.dao.ReplyDAO;
import project.healingcamp.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO replyDAO;
	
	@Autowired
	private Community_BoardDAO cboardDAO;

	//Community_BoardDAO 사용을 위한 트랜잭션
	@Transactional
	@Override
	public int reply_Insert(ReplyVO replyVO) {
		cboardDAO.addReplyCnt(replyVO.getBidx());
		return replyDAO.reply_Insert(replyVO);
	}

	@Override
	public List<ReplyVO> reply_list(int bidx) {
		return replyDAO.reply_list(bidx);
	}

	@Transactional
	@Override
	public int deleteByReply(ReplyVO replyVO) {
		cboardDAO.removeReplyCnt(replyVO.getBidx());
		return replyDAO.deleteByReply(replyVO);
	}

	@Override
	public List<ReplyVO> counseller_reply_list(int bidx) {
		return replyDAO.counseller_reply_list(bidx);
	}

	@Override
	public int updateByReply(ReplyVO replyVO) {
		return replyDAO.updateByReply(replyVO);
	}

	
	

	
	

}
