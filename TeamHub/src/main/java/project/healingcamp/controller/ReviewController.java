package project.healingcamp.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project.healingcamp.service.ReviewService;
import project.healingcamp.vo.Criteria;
import project.healingcamp.vo.PageMaker;
import project.healingcamp.vo.ReviewVo;
import project.healingcamp.vo.UserVo;


@RequestMapping(value="/page")
@Controller
public class ReviewController {
	
	
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="/mypageReviewList.do",method=RequestMethod.GET)
	public String reviewlist(Model model, ReviewVo vo, Criteria cri, HttpSession session) {
		
		UserVo login =(UserVo)session.getAttribute("login");
		
		cri.setId(login.getId());
		cri.setUidx(login.getUidx());
		
		System.out.println("����id"+vo.getId());
		System.out.println("����uidx"+vo.getUidx());
		
		
		List<ReviewVo> list = reviewService.list(cri);
		
		System.out.println("list:"+list);
		
		 PageMaker pageMaker = new PageMaker(cri,reviewService.total());
		 System.out.println("���հ�:" + reviewService.total());
		 System.out.println("������"+ pageMaker);
		model.addAttribute("list", list);
		
		model.addAttribute("pageMaker", pageMaker);
		
		
		return "page/mypageReviewList";
	}
	
	//���� �ı� ����
	@RequestMapping(value="/review_delete.do",method=RequestMethod.POST)
	public String delete(int ridx) { 
		//db �󼼵����� ��ȸ
		
		reviewService.deleteRidx(ridx);
		
		System.out.println("����"+ridx);
	
		return "redirect:mypageReviewList.do";
	
	}
	
	//���� �ı� �ۼ�
	@RequestMapping(value="/mypageReview.do",method=RequestMethod.POST)
	public String write(ReviewVo reviewVo, HttpSession session) {
		
		UserVo login =(UserVo)session.getAttribute("login");
		
		reviewVo.setId(login.getId()); //�α��� id�� ����
		reviewVo.setUidx(login.getUidx()); //�α��� uidx�� ����
		
		reviewService.insert(reviewVo);
		System.out.println("�۵��"+reviewVo.getRcontent());
		
		return "redirect:mypageReviewList.do?ridx="+reviewVo.getRidx();
	}
	
}
