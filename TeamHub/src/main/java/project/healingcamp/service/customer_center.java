package project.healingcamp.service;

import java.util.List;

import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.SearchVO;

public interface customer_center {
	
	/*게시판 목록 */

	List<Community_BoardVO> notice_getList(Community_BoardVO cboardVO);
	
}
