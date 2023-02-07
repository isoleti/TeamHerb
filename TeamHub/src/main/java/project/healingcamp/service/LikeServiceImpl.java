package project.healingcamp.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.LikeDAO;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.LikeVO;

@Service
public class LikeServiceImpl implements LikeService{

	@Autowired
	private LikeDAO likeDAO;
	
	@Override
	public int likeCount(LikeVO likeVO) {
		return likeDAO.likeCount(likeVO);
	}
	
	@Override
	public Community_BoardVO likeUp(LikeVO likeVO) {

		Community_BoardVO cboardVO = new Community_BoardVO();
		cboardVO = likeDAO.likeUp(likeVO);
		return cboardVO;
	}

	@Override
	public Community_BoardVO likeDown(LikeVO likeVO) {
		Community_BoardVO cboardVO = new Community_BoardVO();
		cboardVO = likeDAO.likeDown(likeVO);
		return cboardVO;
	}

	

	

	
}
