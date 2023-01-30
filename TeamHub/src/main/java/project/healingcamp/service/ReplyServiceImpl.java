package project.healingcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.ReplyDAO;
import project.healingcamp.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO replyDAO;

	@Override
	public int reply_Insert(ReplyVO replyVO) {
		return replyDAO.reply_Insert(replyVO);
	}

	@Override
	public List<ReplyVO> reply_list(int bidx) {
		return replyDAO.reply_list(bidx);
	}

}
