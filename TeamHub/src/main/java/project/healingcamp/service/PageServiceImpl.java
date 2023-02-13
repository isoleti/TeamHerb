package project.healingcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.PageDao;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.MyCriteria;
import project.healingcamp.vo.MyRCriteria;
import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.UserVo;

@Service
public class PageServiceImpl implements PageService{

	@Autowired
	private PageDao pageDao;

	@Override
	public UserVo pwCheck(UserVo vo) {
		
		return pageDao.pwCheck(vo);
	}


	@Override
	public List<Community_BoardVO> list(MyCriteria cri) {
		
		return pageDao.list(cri);
	}

	@Override
	public int total(MyCriteria cri) {
		
		return pageDao.total(cri);
	}
	//마이 페이지 예약 목록
	@Override
	public List<ReserveVO> reslist(MyRCriteria rcri) {
		List<ReserveVO> reslist = pageDao.reslist(rcri);
		System.out.println("서비스임플에서 리스트: "+reslist);
		return reslist;
	}
	//마이페이지 예약 취소 
	@Override
	public int myres_Delete(ReserveVO vo) {
		
		return pageDao.myres_Delete(vo);
	}

	@Override
	public int res_total(MyRCriteria rcri) {
		
		return pageDao.res_total(rcri);
	}
	
	//마이페이지 상담 목록
	@Override
	public List<ReserveVO> counslist(MyRCriteria rcri) {
		
		return pageDao.counslist(rcri);
	}

	@Override
	public int couns_total(MyRCriteria rcri) {
		
		return pageDao.couns_total(rcri);
	}

	//상담사페이지 예약 목록
	@Override
	public List<ReserveVO> coun_reslist(MyRCriteria rcri) {
		
		return pageDao.coun_reslist(rcri);
	}


	@Override
	public int counres_total(MyRCriteria rcri) {
		
		return pageDao.counres_total(rcri);
	}

	//상담사페이지 예약 취소
	@Override
	public int counres_Delete(ReserveVO vo) {
		
		return pageDao.counres_Delete(vo);
	}


	@Override
	public int counres_Check(ReserveVO vo) {
	
		return pageDao.counres_Check(vo);
	}


	@Override
	public List<ReserveVO> councou_list(MyRCriteria rcri) {
		
		return pageDao.councou_list(rcri);
	}


	@Override
	public int councou_total(MyRCriteria rcri) {
		
		return pageDao.councou_total(rcri);
	}



}
