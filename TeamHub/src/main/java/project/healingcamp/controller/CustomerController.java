package project.healingcamp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.healingcamp.service.customer_center;
import project.healingcamp.vo.Community_BoardVO;

@RequestMapping("/customerService")
@Controller
public class CustomerController {
	
	@Autowired
	private customer_center CsService;
	
	@RequestMapping(value="/customerNotice.do")
	public String customerNotice_list(Model model, Community_BoardVO cboardVO) {
		
		// ��ü�Խñ� ������ ��û
		List<Community_BoardVO> notice_getList = CsService.notice_getList(cboardVO);
		System.out.println("notice_getList--> "+notice_getList); 
		
		//�����͸� �𵨿� ��� ȭ�鿡 �ѱ�.
		model.addAttribute("data",notice_getList);
		
		return "customerService/customerNotice";
	}
	@RequestMapping(value="/customerFAQ.do")
	public String customerFAQ() {
		return "customerService/customerFAQ";
	}
	@RequestMapping(value="/customerFAQ_counselling.do")
	public String counselling() {
		return "customerService/customerFAQ_counselling";
	}
	@RequestMapping(value="/customerFaqReservation.do")
	public String FaqReservation() {
		return "customerService/customerFaqReservation";
	}
	@RequestMapping(value="/customerFaqGita.do")
	public String FaqGita() {
		return "customerService/customerFaqGita";
	}
}

