package project.healingcamp.service;

import project.healingcamp.vo.LikeVO;

public interface LikeService {
	
	public int likeUp(LikeVO likeVO);
	public int likeCount(LikeVO likeVO);
	public int likeDown(LikeVO likeVO);

}
