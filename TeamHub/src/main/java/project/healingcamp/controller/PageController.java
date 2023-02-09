package project.healingcamp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.healingcamp.service.Community_BoardService;
import project.healingcamp.service.PageService;
import project.healingcamp.service.UserService;
import project.healingcamp.service.UserSha256;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.Criteria;
import project.healingcamp.vo.MyCriteria;
import project.healingcamp.vo.MyRCriteria;
import project.healingcamp.vo.MypageMaker;
import project.healingcamp.vo.PageMaker;
import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.ReviewVo;
import project.healingcamp.vo.SearchVO;
import project.healingcamp.vo.UserVo;

@RequestMapping("/page")
@Controller
public class PageController {

	@Autowired
	private PageService pageService;

	@Autowired
	private UserService userService;

	@Autowired
	private Community_BoardService cboardService;
	// ����������
	@RequestMapping(value = "/mypageRes.do", method = RequestMethod.GET)
	public String mypageRes(Model model, ReserveVO vo, HttpSession session, MyRCriteria rcri) {

		UserVo login =(UserVo)session.getAttribute("login");
		
		rcri.setId(login.getId());
		rcri.setUidx(login.getUidx());
		
		
		List<ReserveVO> reslist = pageService.reslist(rcri);
		
		
		MypageMaker mypageMaker = new MypageMaker(rcri, pageService.res_total(rcri));
		System.out.println("getfrom: "+rcri.getFromdate());
		
		 System.out.println("���հ�:" + pageService.res_total(rcri));
		 System.out.println("������"+ mypageMaker);
		 
		model.addAttribute("reslist", reslist);
		System.out.println("���� ����Ʈ : "+reslist);
		 model.addAttribute("mypageMaker", mypageMaker);
		
		return "page/mypageRes";
	}
	//���������� ���� ��� 
		@RequestMapping(value="/myres_delete.do",method=RequestMethod.POST)
		public String delete(ReserveVO vo) { 
			//db �󼼵����� ��ȸ
			pageService.myres_Delete(vo);

			System.out.println("���� ���� ����"+vo.toString());
		
			return "redirect:mypageRes.do";
		
		}
		
	@RequestMapping(value = "/pwConfirm.do", method = RequestMethod.GET)
	public String pwConfirm() {

		return "page/pwConfirm";
	}

	@RequestMapping(value = "/checkPw.do", method = RequestMethod.POST)
	public String checkPw(UserVo vo, Model model, HttpServletResponse response, HttpSession session) {

		System.out.println("/checkPw.do : " + vo.toString());
		// ��й�ȣ ��ȣȭ
		String userPw = vo.getPw();

		vo.setPw(UserSha256.encrypt(userPw));

		UserVo login = (UserVo) session.getAttribute("login");

		vo.setId(login.getId()); // �α��� id�� ����
		vo.setUidx(login.getUidx()); // �α��� uidx�� ����

		// pwCheck �޼���
		UserVo check = pageService.pwCheck(vo);
		
		
		// check �����ȿ� �����Ͱ� ������ ������ if
		if (check == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('��ġ�ϴ� ��й�ȣ�� �������� �ʽ��ϴ�.'); history.go(-1);</script>");
				out.close();
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "page/pwConfirm";
		} else {

			return "redirect:userModify.do?uidx=" + login.getUidx();
		}
	}

	@RequestMapping(value = "/userModify.do", method = RequestMethod.GET)
	public String userModify(int uidx, Model model) {
		System.out.println("/userModify.do GET : " + uidx);

		UserVo vo = userService.selectByUidx(uidx);
		if (vo != null) {
			System.out.println("/userModify.do " + " GET : " + vo.toString());
			model.addAttribute("vo", vo);
		}

		return "page/userModify";
	}

	// ȸ������ ����
	@RequestMapping(value = "/userModify.do", method = RequestMethod.POST)
	public String userModify(UserVo vo, HttpSession session, Model model, HttpServletRequest request) {
		System.out.println("/userModify.do POST : " + vo.toString());

		/*
		 * //��й�ȣ ��ȣȭ String userPw = vo.getPw(); vo.setPw(UserSha256.encrypt(userPw));
		 * 
		 * 
		 * //��ȣȭ Ȯ�� System.out.println("userPw:" + vo.getPw());
		 */

		if (userService.userModify(vo) != 1) {
			System.out.println("/userModify.do POST : error ");
			return "redirect:userModify.do?uidx=" + vo.getUidx();
		}
		System.out.println("/userModify.do POST : done ");
		session.invalidate();
		return "redirect:/";
	}

	// ��й�ȣ ����(�ᱹ ����)
	@RequestMapping(value = "/pwReset.do", method = RequestMethod.POST)
	public String pwReset(UserVo vo, HttpSession session, Model model, HttpServletRequest request) {
		System.out.println("/pwReset.do POST : " + vo.toString());
		
		  //��й�ȣ ��ȣȭ 
			String userPw = vo.getPw(); vo.setPw(UserSha256.encrypt(userPw));
			vo.setPw(UserSha256.encrypt(userPw));
			
		  //��ȣȭ Ȯ��
			System.out.println("userPw:" + vo.getPw());
			
			if (userService.pwReset(vo) != 1) {
				System.out.println("/pwReset.do POST : error ");
				return "redirect:pwReset.do?uidx=" + vo.getUidx();
			}
			System.out.println("/pwReset.do POST : done ");
			session.invalidate();
			return "redirect:/";
			
				
	}

	// ȸ��Ż��
	@RequestMapping(value = "userDel.do", method = RequestMethod.GET)
	public String userDel() {

		return "page/userDel";
	}

	@RequestMapping(value = "userDel.do", method = RequestMethod.POST)
	public String Withdraw(UserVo vo, HttpSession session, Model model, HttpServletRequest request,
			HttpServletResponse response) {

		// ��й�ȣ ��ȣȭ
		String userPw = vo.getPw();
		vo.setPw(UserSha256.encrypt(userPw));

		// ��ȣȭ Ȯ��
		System.out.println("userPw:" + vo.getPw());

		UserVo check = pageService.pwCheck(vo);

		if (check == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('��ġ�ϴ� ��й�ȣ�� �������� �ʽ��ϴ�.'); history.go(-1);</script>");
				out.close();
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "page/userDel";
		} else {

			userService.userDelete(vo);
			session.invalidate();
			return "redirect:/";
		}

	}

	@RequestMapping(value = "mypageCouns.do", method = RequestMethod.GET)
	public String mypageCouns() {

		return "page/mypageCouns";
	}

	@RequestMapping(value = "mypageCount.do", method = RequestMethod.GET)
	public String mypageCount() {

		return "page/mypageCount";
	}
	
	//���� �۾��� ���
	@RequestMapping(value="/mypageWrite.do",method=RequestMethod.GET)
	public String mypageWrite(Model model, Community_BoardVO cboardVO, HttpSession session, MyCriteria cri) {
		
		UserVo login =(UserVo)session.getAttribute("login");
		
		cri.setId(login.getId());
		cri.setUidx(login.getUidx());
		
		
		//��ü�Խñ� ������ ��û
		List<Community_BoardVO> list = pageService.list(cri);
		
		MypageMaker mypageMaker = new MypageMaker(cri, pageService.total(cri));
		
		 System.out.println("���հ�:" + pageService.total(cri));
		 System.out.println("������"+ mypageMaker);
		 
		model.addAttribute("list",list);//�۸�� ����
		 model.addAttribute("mypageMaker", mypageMaker);
		 
		return "page/mypageWrite";
	}
	
	//���� �۾��� ����(����)
		@RequestMapping(value="/mywrite_delete.do",method=RequestMethod.POST)
		public String delete(int bidx) { 
			//db �󼼵����� ��ȸ
			System.out.println("del ��Ʈ�ѷ�: "+bidx);
			cboardService.deleteByBidx(bidx);
			System.out.println("����"+bidx);
			
			return "redirect:mypageWrite.do";
		
		}
	
	@RequestMapping(value = "mypageReview.do", method = RequestMethod.GET)
	public String mypageReview() {

		return "page/mypageReview";
	}

	@RequestMapping(value = "mypageScrap.do", method = RequestMethod.GET)
	public String mypageScrap() {

		return "page/mypageScrap";
	}

	// ���� ������
	@RequestMapping(value = "/counspageRes.do", method = RequestMethod.GET)
	public String counspageRes(Model model, ReserveVO vo) {
		/*
		 * List<ReserveVO> list = pageService.list(vo);
		 * 
		 * model.addAttribute("datalist", list);
		 */

		return "page/counspageRes";
	}

	@RequestMapping(value = "/counspageCou.do", method = RequestMethod.GET)
	public String counspageCou() {

		return "page/counspageCou";
	}

	@RequestMapping(value = "/counspageWrite.do", method = RequestMethod.GET)
	public String counspageWrite(Model model, Community_BoardVO cboardVO, HttpSession session, MyCriteria cri) {

		UserVo login =(UserVo)session.getAttribute("login");
		
		System.out.println("���縶�������� :"+login.toString());
		cri.setId(login.getId());
		cri.setUidx(login.getUidx());
		
		
		//��ü�Խñ� ������ ��û
		List<Community_BoardVO> list = pageService.list(cri);
		
		MypageMaker mypageMaker = new MypageMaker(cri, pageService.total(cri));
		
		 System.out.println("���հ�:" + pageService.total(cri));
		 System.out.println("������"+ mypageMaker);
		 
		 model.addAttribute("list",list);//�۸�� ����
		 model.addAttribute("mypageMaker", mypageMaker);
		 
		return "page/counspageWrite";
	}
}