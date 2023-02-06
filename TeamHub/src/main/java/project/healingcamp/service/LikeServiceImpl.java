package project.healingcamp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.Community_BoardDAO;
import project.healingcamp.dao.LikeDAO;
import project.healingcamp.vo.LikeVO;

@Service
public class LikeServiceImpl implements LikeService{

	@Autowired
	private LikeDAO likeDAO;
	
	@Autowired
	private Community_BoardDAO cboardDAO;

	@Override
	public int likeCount(LikeVO likeVO) {
		return likeDAO.likeCount(likeVO);
	}
	
	@Override
	public int likeUp(LikeVO likeVO) {
		cboardDAO.addLikeCnt(likeVO.getBidx());
		return likeDAO.likeUp(likeVO);
	}

	@Override
	public int likeDown(LikeVO likeVO) {
		cboardDAO.removeLikeCnt(likeVO.getBidx());
		return likeDAO.likeDown(likeVO);
	}

	
}
