package project.healingcamp.service;

import java.util.List;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.MyCriteria;
import project.healingcamp.vo.MyRCriteria;
import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.UserVo;

public interface PageService {
	
	//비밀번호 인증
	UserVo pwCheck(UserVo vo);
	
	//마이페이지 나의글쓰기
	public List<Community_BoardVO> list(MyCriteria cri);
	int total(MyCriteria cri);
	
	//마이페이지 예약(rud)
	public List<ReserveVO> reslist(MyRCriteria rcri);
	int res_total(MyRCriteria rcri);
	int myres_Delete(ReserveVO vo);
	
	//마이페이지 상담
	public List<ReserveVO> counslist(MyRCriteria rcri);
	int couns_total(MyRCriteria rcri);
	
	//상담사페이지 예약
	public List<ReserveVO> coun_reslist(MyRCriteria rcri);
	int counres_total(MyRCriteria rcri);
	int counres_Delete(ReserveVO vo);
	int counres_Check(ReserveVO vo);
	
	//상담사페이지 상담
	public List<ReserveVO> councou_list(MyRCriteria rcri);
	int councou_total(MyRCriteria rcri);
	
	
}
