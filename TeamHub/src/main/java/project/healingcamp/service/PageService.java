package project.healingcamp.service;

import java.util.List;

import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.UserVo;

public interface PageService {

	UserVo pwCheck(UserVo vo);
	
	public List<ReserveVO> list(ReserveVO vo);
}
