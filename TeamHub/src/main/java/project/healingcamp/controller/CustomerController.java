package project.healingcamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.healingcamp.service.customer_centerService;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.Criteria;
import project.healingcamp.vo.PageMaker;
import project.healingcamp.vo.PageVO;
import project.healingcamp.vo.SearchVO;

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
	public String customerFaqView(Model model,SearchVO searchVO,HttpServletRequest request) {
		
		//페이지네이션
		PageVO pageVO = new PageVO(searchVO , CsService.faq_Total(searchVO));
		System.out.println("페이지 넘어왔니"+pageVO);
		
		//전체게시글 데이터 요청
		List<Community_BoardVO> faq_List = CsService.faq_List(searchVO);
		System.out.println(" 리스트?"+faq_List);
		//데이터를 모델에 담아 화면에 넘김.
		model.addAttribute("pageVO",pageVO);//페이지네이션 전달
		model.addAttribute("faq_List",faq_List);//글전달
		model.addAttribute("category",request.getParameter("category")); // 카테고리 전달
		
		return "customerService/customerFAQ";
	}
}

