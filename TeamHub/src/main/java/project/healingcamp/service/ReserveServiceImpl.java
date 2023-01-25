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
	
	
	 /* �Խ����� ���ƿ� ��ȣ�� �ִ��� ī��Ʈ */
	@Override
	public int countbyLike(HashMap hashMap){
		
		int count = ReserveDAO.countbyLike(hashMap);
		return count;
		
	}

	 /* ���ƿ� ��ȣ ��� */
	@Override
	public int create(HashMap hashMap){
		
		int count = ReserveDAO.create(hashMap);
	    return count;
	    
	}
	
	/* ���ƿ� üũ ���� (0 -> 1) */	
	
	@Override
	public int like_check_cancel(HashMap hashMap) {
		
		 int count = ReserveDAO.like_check_cancel(hashMap);
		 return count;
		
	}

	/* ���ƿ� üũ ���� (1 -> 0) */
	@Override
	public int like_check(HashMap hashMap) {
		
	    int count = ReserveDAO.like_check(hashMap);
	    return count;
	    
	}

	/* ��ȸ */
	 @Override
	 public ReserveVO read(HashMap hashMap) {
		 
	    ReserveVO reserveVO = ReserveDAO.read(hashMap);
	    return reserveVO;
	    
	 }

	 /* �Խ����� ���ƿ� ���� */
	 @Override
	 public int deletebycenter(String center) {
		 
	    int count = ReserveDAO.deletebycenter(center);
	    return count;
	    
	 }

	 /* ȸ���� ���ƿ� ���� */
	 @Override
	 public int deletebyuidx(int uidx) {
		 
	    int count = ReserveDAO.deletebyuidx(uidx);
	    return count;
	    
	 }

	@Override
	public int like_cnt_up(String center) {
		
		
		return 1;
		
	}

	@Override
	public int like_cnt_down(String center) {
		
		
		return 0;
		
	}	

}
