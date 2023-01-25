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
	
	
	 /* 게시판의 좋아요 번호가 있는지 카운트 */
	@Override
	public int countbyLike(HashMap hashMap){
		
		int count = ReserveDAO.countbyLike(hashMap);
		return count;
		
	}

	 /* 좋아요 번호 등록 */
	@Override
	public int create(HashMap hashMap){
		
		int count = ReserveDAO.create(hashMap);
	    return count;
	    
	}
	
	/* 좋아요 체크 여부 (0 -> 1) */	
	
	@Override
	public int like_check_cancel(HashMap hashMap) {
		
		 int count = ReserveDAO.like_check_cancel(hashMap);
		 return count;
		
	}

	/* 좋아요 체크 여부 (1 -> 0) */
	@Override
	public int like_check(HashMap hashMap) {
		
	    int count = ReserveDAO.like_check(hashMap);
	    return count;
	    
	}

	/* 조회 */
	 @Override
	 public ReserveVO read(HashMap hashMap) {
		 
	    ReserveVO reserveVO = ReserveDAO.read(hashMap);
	    return reserveVO;
	    
	 }

	 /* 게시판의 좋아요 삭제 */
	 @Override
	 public int deletebycenter(String center) {
		 
	    int count = ReserveDAO.deletebycenter(center);
	    return count;
	    
	 }

	 /* 회원의 좋아요 삭제 */
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
