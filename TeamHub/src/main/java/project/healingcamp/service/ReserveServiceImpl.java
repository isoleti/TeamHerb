package project.healingcamp.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.ReserveDAO;
import project.healingcamp.vo.ReserveVO;

@Service //작동 안하면 @Component로 바꿀 것,
public class ReserveServiceImpl implements ReserveService{
	
	@Autowired
	private ReserveDAO reserveDAO;
	
	//현장결제 예약
	@Override
	public int resF(ReserveVO vo) {
		
		return reserveDAO.resF(vo);
	}

	//지금결제 예약
	@Override
	public int couF(ReserveVO vo) {
		
		return reserveDAO.couF(vo);
	}
	
	//상담소 pk찾기
	@Override
	public ReserveVO cnoidx(ReserveVO vo) {
		
		return reserveDAO.cnoidx(vo);
	}
	
	//해당상담소의 상담사리스트 뽑기
	@Override
	public List<ReserveVO> centerlist(ReserveVO vo) {
		
		return reserveDAO.centerlist(vo);
	}
	
	//상담사 pk 찾기
	@Override
	public ReserveVO conidx(ReserveVO vo) {
		
		return reserveDAO.conidx(vo);
	}

	//상담소 정보의 pk찾기
	@Override
	public ReserveVO cintidx(ReserveVO vo) {
		
		return reserveDAO.cintidx(vo);
	}
	
	//상담소 상담 예약 리스트 찾기 
	@Override
	public List<ReserveVO> reslist(ReserveVO vo) {
		
		return reserveDAO.reslist(vo);
	}

	@Override
	public List<ReserveVO> reviewlist(ReserveVO vo) {
		
		return reserveDAO.reviewlist(vo);
	}
	
	
	
	

	
	
}
