package project.healingcamp.service;

import java.util.HashMap;

import project.healingcamp.vo.ReserveVO;

public interface ReserveService {
	
	  //좋아요 기능
	
	  /* 게시판의 좋아요 번호가 있는지 카운트 */
	  public int countLike(HashMap hashMap);
	  
	  /* 좋아요 번호 등록 */
	  public int createlike(HashMap hashMap);
	  
	  public int like_check(HashMap hashMap);
	  
	  /*좋아요 취소*/
	  public int like_check_cancel(HashMap hashMap);
	  
	  /* 조회 */
	  public ReserveVO read(HashMap hashMap);
	  
	  /* 게시판의 좋아요 삭제 */
	  public int deleteby(int clidx);
	  
	  /* 회원의 좋아요 삭제 */
	  public int deletebyMno(String center);
	
}
