package project.healingcamp.service;

import java.util.List;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.SearchVO;

public interface customer_center {
	
	/*�Խ��� ��� */

	List<Community_BoardVO> notice_getList(Community_BoardVO cboardVO);
	
}
