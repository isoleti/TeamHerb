package project.healingcamp.service;

import java.util.List;

import project.healingcamp.vo.Criteria;
import project.healingcamp.vo.ReviewVo;

public interface ReviewService {
	
	public List<ReviewVo> list(Criteria cri);
	int total(Criteria cri);
	int deleteRidx(int ridx);
	int insert(ReviewVo reviewvo);

}
