package project.healingcamp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.healingcamp.service.customer_centerService;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.Criteria;
import project.healingcamp.vo.PageMaker;

@RequestMapping("/customerService")
@Controller
public class CustomerController {
	
	@Autowired
	private customer_centerService CsService;
	
	@RequestMapping(value="/customerNotice.do")
	public String customerNotice_list(Model model, Criteria cri, Community_BoardVO cboardVO) {
	
		System.out.println("페이지번호는?"+ cri.getPage());
		System.out.println("화면에 출력할 갯수는?"+ cri.getPerPageNum());
		System.out.println();
		
		// 전체게시글 데이터 요청
		List<Community_BoardVO> notice_getList = CsService.notice_getList(cri);
		System.out.println("notice_getList--> "+notice_getList); 
		
		PageMaker pageMaker = new PageMaker(cri,CsService.total(cri));
		 System.out.println("총합계:" + CsService.total(cri));
		 System.out.println("페이지"+ pageMaker);
		
		//데이터를 모델에 담아 화면에 넘김.
		model.addAttribute("data",notice_getList);
		model.addAttribute("pageMaker", pageMaker);
		
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

