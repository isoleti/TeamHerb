package project.healingcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.CustomerDao;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.Criteria;


@Service
public class customer_centerServiceImpl implements customer_centerService{
	
	@Autowired
	private CustomerDao CustomerDao;

	@Override
	public List<Community_BoardVO> notice_getList(Criteria cri) {
		List<Community_BoardVO> notice_getList = CustomerDao.customerNotice(cri);
		return notice_getList;
	}

	@Override
	public int total(Criteria cri) {
		
		return CustomerDao.total(cri);
	}

	
}
