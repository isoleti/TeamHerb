package project.healingcamp.service;

import java.util.HashMap;

import project.healingcamp.vo.ReserveVO;

public interface ReserveService {
	
	  //���ƿ� ���
	
	  /* �Խ����� ���ƿ� ��ȣ�� �ִ��� ī��Ʈ */
	  public int countLike(HashMap hashMap);
	  
	  /* ���ƿ� ��ȣ ��� */
	  public int createlike(HashMap hashMap);
	  
	  public int like_check(HashMap hashMap);
	  
	  /*���ƿ� ���*/
	  public int like_check_cancel(HashMap hashMap);
	  
	  /* ��ȸ */
	  public ReserveVO read(HashMap hashMap);
	  
	  /* �Խ����� ���ƿ� ���� */
	  public int deleteby(int clidx);
	  
	  /* ȸ���� ���ƿ� ���� */
	  public int deletebyMno(String center);
	
}
