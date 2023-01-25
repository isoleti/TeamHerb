package project.healingcamp.service;

import java.util.HashMap;

import project.healingcamp.vo.ReserveVO;

public interface ReserveService {
	
	  //���ƿ� ���
	
	  /* �Խ����� ���ƿ� ��ȣ�� �ִ��� ī��Ʈ */
	  public int countbyLike(HashMap hashMap);
	  
	  /* ���ƿ� ��ȣ ��� */
	  public int create(HashMap hashMap); 	  
	 
	  /* ���ƿ� */
	  public int like_check(HashMap hashMap);
	  
	  /*���ƿ� ���*/
	  public int like_check_cancel(HashMap hashMap);
	  
	  /* ��ȸ */
	  public ReserveVO read(HashMap hashMap);
	  
	  /* �Խ����� ���ƿ� ���� */
	  public int deletebycenter(String center);
	  
	  /* ȸ���� ���ƿ� ���� */
	  public int deletebyuidx(int uidx);
	 
	  /* ���ƿ� 1���� */
	  public int like_cnt_up(String center);
	  
	  /* ���ƿ� 1���� */
	  public int like_cnt_down(String center);
	  
}
