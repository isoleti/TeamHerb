package project.healingcamp.service;

import java.util.List;

import project.healingcamp.vo.ReplyVO;

public interface ReplyService {
	
	int reply_Insert(ReplyVO replyVO);
	List<ReplyVO> reply_list(int bidx);

}
