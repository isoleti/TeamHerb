package project.healingcamp.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.ReserveDAO;
import project.healingcamp.vo.ReserveVO;

@Service //작동 안하면 @Component로 바꿀 것,
public class ReserveServiceImpl implements ReserveService{
	
	@Autowired
	private ReserveDAO reserveDAO;

	@Override
	public int resF(ReserveVO vo) {
		
		return reserveDAO.resF(vo);
	}

	@Override
	public int couF(ReserveVO vo) {
		
		return reserveDAO.couF(vo);
	}

	

	
	
}
