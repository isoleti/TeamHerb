package project.healingcamp.service;

import java.util.HashMap;
import java.util.List;

import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.UserVo;

public interface ReserveService {
	
	//현장결제 예약
	int resF(ReserveVO vo);
	//지금결제
	int couF(ReserveVO vo);
	//센터PK 조회
	ReserveVO cnoidx(ReserveVO vo);
	//센터정보 List 조회
	List <ReserveVO> centerlist(ReserveVO vo);
	//상담사 PK 조회
	ReserveVO conidx(ReserveVO vo);
	//센터정보 PK 조회
	ReserveVO cintidx(ReserveVO vo);
	
}
