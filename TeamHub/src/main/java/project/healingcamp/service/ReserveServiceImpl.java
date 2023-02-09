package project.healingcamp.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.ReserveDAO;
import project.healingcamp.vo.ReserveVO;

@Service //�۵� ���ϸ� @Component�� �ٲ� ��,
public class ReserveServiceImpl implements ReserveService{
	
	@Autowired
	private ReserveDAO reserveDAO;
	
	//������� ����
	@Override
	public int resF(ReserveVO vo) {
		
		return reserveDAO.resF(vo);
	}

	//���ݰ��� ����
	@Override
	public int couF(ReserveVO vo) {
		
		return reserveDAO.couF(vo);
	}
	
	//���� pkã��
	@Override
	public ReserveVO cnodix(ReserveVO vo) {
		
		return reserveDAO.cnoidx(vo);
	}
	
	
	
	

	
	
}
