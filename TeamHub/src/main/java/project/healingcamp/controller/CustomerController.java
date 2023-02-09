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
	
		System.out.println("��������ȣ��?"+ cri.getPage());
		System.out.println("ȭ�鿡 ����� ������?"+ cri.getPerPageNum());
		System.out.println();
		
		// ��ü�Խñ� ������ ��û
		List<Community_BoardVO> notice_getList = CsService.notice_getList(cri);
		System.out.println("notice_getList--> "+notice_getList); 
		
		PageMaker pageMaker = new PageMaker(cri,CsService.total(cri));
		 System.out.println("���հ�:" + CsService.total(cri));
		 System.out.println("������"+ pageMaker);
		
		//�����͸� �𵨿� ��� ȭ�鿡 �ѱ�.
		model.addAttribute("data",notice_getList);
		model.addAttribute("pageMaker", pageMaker);
		
		return "customerService/customerNotice";
	}
	
	@RequestMapping(value="/customerFAQ.do")
	public String customerFaqView(Model model,SearchVO searchVO,HttpServletRequest request) {
		
		//���������̼�
		PageVO pageVO = new PageVO(searchVO , CsService.faq_Total(searchVO));
		System.out.println("������ �Ѿ�Դ�"+pageVO);
		
		//��ü�Խñ� ������ ��û
		List<Community_BoardVO> faq_List = CsService.faq_List(searchVO);
		System.out.println(" ����Ʈ?"+faq_List);
		//�����͸� �𵨿� ��� ȭ�鿡 �ѱ�.
		model.addAttribute("pageVO",pageVO);//���������̼� ����
		model.addAttribute("faq_List",faq_List);//������
		model.addAttribute("category",request.getParameter("category")); // ī�װ� ����
		
		return "customerService/customerFAQ";
	}
}

