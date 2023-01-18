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
	public int countbyLike(HashMap hashMap) {
		 int count = reserveDAO.countbyLike(hashMap);
		    return count;
	}
	
	 /* 게시판의 좋아요 번호가 있는지 카운트 */
	@Override
	public int createlike(HashMap hashMap) {
		
		return 0;
	}

	 /* 좋아요 번호 등록 */
	@Override
	public int like_check(HashMap hashMap) {
		
		return 0;
	}

	 /*좋아요 취소*/
	@Override
	public int like_check_cancel(HashMap hashMap) {
		
		return 0;
	}

	/* 조회 */
	@Override
	public ReserveVO read(HashMap hashMap) {
	
		return null;
	}

	 /* 게시판의 좋아요 삭제 */
	@Override
	public int deleteby(int clidx) {
	
		return 0;
	}

	 /* 회원의 좋아요 삭제 */
	@Override
	public int deletebyMno(String center) {
	
		return 0;
	}

}
