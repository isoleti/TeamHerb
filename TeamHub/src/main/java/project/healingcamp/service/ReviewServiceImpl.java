package project.healingcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.ReviewDao;
import project.healingcamp.vo.Criteria;
import project.healingcamp.vo.ReviewVo;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDao reviewDao;

	@Override
	public List<ReviewVo> list(Criteria cri) {
		List<ReviewVo> list = reviewDao.list(cri);
		return list;
	}

	@Override
	public int total(Criteria cri) {
		
		return reviewDao.total(cri);
	}

	@Override
	public int deleteRidx(int ridx) {
		
		return reviewDao.deleteRidx(ridx);
	}

	@Override
	public int insert(ReviewVo reviewVo) {
		
		return reviewDao.insert(reviewVo);
	}


	

	




	


	

	
	

}
