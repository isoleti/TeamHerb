package project.healingcamp.service;

import java.util.List;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.Criteria;
import project.healingcamp.vo.SearchVO;

public interface customer_centerService {
	
	/*�Խ��� ��� */

	List<Community_BoardVO> notice_getList(Criteria cri);
	int total(Criteria cri);
	
	//faq���
	List<Community_BoardVO> faq_List(SearchVO searchVO);
	int faq_Total(SearchVO searchVO);
	
}
