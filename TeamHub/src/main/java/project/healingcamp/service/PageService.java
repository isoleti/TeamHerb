package project.healingcamp.service;

import java.util.List;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.MyCriteria;
import project.healingcamp.vo.MyRCriteria;
import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.UserVo;

public interface PageService {
	
	//��й�ȣ ����
	UserVo pwCheck(UserVo vo);
	
	//���������� ���Ǳ۾���
	public List<Community_BoardVO> list(MyCriteria cri);
	int total(MyCriteria cri);
	
	//���������� ����(rud)
	public List<ReserveVO> reslist(MyRCriteria rcri);
	int res_total(MyRCriteria rcri);
	int myres_Delete(ReserveVO vo);
	
	//���������� ���
	public List<ReserveVO> counslist(MyRCriteria rcri);
	int couns_total(MyRCriteria rcri);
	
	//���������� ����
	public List<ReserveVO> coun_reslist(MyRCriteria rcri);
	int counres_total(MyRCriteria rcri);
	int counres_Delete(ReserveVO vo);
	int counres_Check(ReserveVO vo);
	
	//���������� ���
	public List<ReserveVO> councou_list(MyRCriteria rcri);
	int councou_total(MyRCriteria rcri);
	
	
}
