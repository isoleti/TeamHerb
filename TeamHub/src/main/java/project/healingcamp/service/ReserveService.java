package project.healingcamp.service;

import java.util.HashMap;
import java.util.List;

import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.UserVo;

public interface ReserveService {

	int resF(ReserveVO vo);
	int couF(ReserveVO vo);
	ReserveVO cnoidx(ReserveVO vo);
	List <ReserveVO> centerlist(ReserveVO vo);
	ReserveVO conidx(ReserveVO vo);
	
}
