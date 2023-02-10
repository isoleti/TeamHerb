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

	@Override
	public List<ReserveVO> centerlist(ReserveVO vo) {
		
		return reserveDAO.centerlist(vo);
	}

	@Override
	public ReserveVO conidx(ReserveVO vo) {
		
		return reserveDAO.conidx(vo);
	}

	@Override
	public ReserveVO cintidx(ReserveVO vo) {
		
		return reserveDAO.cintidx(vo);
	}
	
	
	
	

	
	
}
