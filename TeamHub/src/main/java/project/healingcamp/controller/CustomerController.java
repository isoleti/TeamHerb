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
}
