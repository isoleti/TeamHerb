package project.healingcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.CustomerDao;
import project.healingcamp.vo.Community_BoardVO;

@Service
public class customer_centerImpl implements customer_center{
	
	@Autowired
	private CustomerDao CustomerDao;

	@Override
	public List<Community_BoardVO> notice_getList(Community_BoardVO cboardVO) {
	
		return CustomerDao.customerNotice(cboardVO);
	}

}
