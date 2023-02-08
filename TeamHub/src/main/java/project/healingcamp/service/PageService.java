package project.healingcamp.service;

import java.util.List;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.MyCriteria;
import project.healingcamp.vo.MyRCriteria;
import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.UserVo;

public interface PageService {

	public List<Community_BoardVO> list(MyCriteria cri);
	UserVo pwCheck(UserVo vo);
	public List<ReserveVO> list(ReserveVO vo);
	public List<ReserveVO> reslist(MyRCriteria rcri);
	int total(MyCriteria cri);
	int res_total(MyRCriteria rcri);
	int myres_Delete(ReserveVO vo);
}
