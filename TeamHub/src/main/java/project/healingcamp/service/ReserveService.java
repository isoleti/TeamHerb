package project.healingcamp.service;

import java.util.HashMap;

import project.healingcamp.vo.ReserveVO;

public interface ReserveService {
	
	  //좋아요 기능
	
	  /* 게시판의 좋아요 번호가 있는지 카운트 */
	  public int countbyLike(HashMap hashMap);
	  
	  /* 좋아요 번호 등록 */
	  public int create(HashMap hashMap); 	  
	 
	  /* 좋아요 */
	  public int like_check(HashMap hashMap);
	  
	  /*좋아요 취소*/
	  public int like_check_cancel(HashMap hashMap);
	  
	  /* 조회 */
	  public ReserveVO read(HashMap hashMap);
	  
	  /* 게시판의 좋아요 삭제 */
	  public int deletebycenter(String center);
	  
	  /* 회원의 좋아요 삭제 */
	  public int deletebyuidx(int uidx);
	 
	  /* 좋아요 1증가 */
	  public int like_cnt_up(String center);
	  
	  /* 좋아요 1감소 */
	  public int like_cnt_down(String center);
	  
}
