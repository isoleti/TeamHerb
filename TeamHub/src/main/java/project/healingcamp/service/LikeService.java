package project.healingcamp.service;

import java.util.List;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.LikeVO;

public interface LikeService {
	
	public Community_BoardVO likeUp(LikeVO likeVO);
	public Community_BoardVO likeDown(LikeVO likeVO);
	public int likeCount(LikeVO likeVO);

}
