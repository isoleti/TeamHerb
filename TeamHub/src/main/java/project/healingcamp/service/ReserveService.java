package project.healingcamp.service;

import java.util.HashMap;

import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.UserVo;

public interface ReserveService {

	int resF(ReserveVO vo);
	int couF(ReserveVO vo);
	ReserveVO cnodix(ReserveVO vo);
	
}
