package project.healingcamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/customerService")
@Controller
public class CustomerController {
	
	@RequestMapping(value="/customerNotice.do")
	public String customerNotice() {
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
