package project.healingcamp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.healingcamp.service.Community_BoardService;
import project.healingcamp.service.LikeService;
import project.healingcamp.service.ReplyService;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.LikeVO;
import project.healingcamp.vo.PageVO;
import project.healingcamp.vo.ReplyVO;
import project.healingcamp.vo.SearchVO;
import project.healingcamp.vo.UserVo;

@RequestMapping(value="/community")
@Controller
public class CommunityController {
	
	@Autowired
	private Community_BoardService cboardService;
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private LikeService likeService;
	
	//Ŀ�´�Ƽ ����Ʈ �̵�
	@RequestMapping(value="/community_list.do",method=RequestMethod.GET)
	public String community_list(Model model,SearchVO searchVO) {

		//���������̼�(�˻�������)
		PageVO pageVO = new PageVO(searchVO,cboardService.total(searchVO));
		//��ü�Խñ� ������ ��û
		List<Community_BoardVO> list = cboardService.list(searchVO);
		List<LikeVO> likeList = likeService.likeList();
		
		//�����͸� �𵨿� ��� ȭ�鿡 �ѱ�
		model.addAttribute("pageVO",pageVO);//���������̼� ����
		model.addAttribute("datalist",list);//�۸�� ����
		model.addAttribute("likeList",likeList);//�۸�� ����
		return "community/community_list";
	}
	
	//�Խñ� �󼼺��� �̵�
	@RequestMapping(value="/community_view.do",method=RequestMethod.GET)
	public String community_view(int bidx,Model model,ReplyVO replyVO,HttpSession session) {
		
		//ȣ��� ����� vo�� ����
		Community_BoardVO vo = cboardService.selectByBidx(bidx);
		//��ȸ�� ����
		cboardService.hitCount(bidx);
		//�α�������
		UserVo login = (UserVo)session.getAttribute("login");
		
		//���ƿ� Ŭ�� üũ
		LikeVO likeVO = new LikeVO();
		likeVO.setBidx(bidx);
		
		if(login != null) {
			likeVO.setId(login.getId());
		}else {
			likeVO.setId("");
		}
		
		//model�� vo�� ��� ȭ�鿡 �ѱ�
		model.addAttribute("vo",vo);
		model.addAttribute("likeCount",likeService.likeCount(likeVO));
		
		return "community/community_view";
	}
	
	//�Խñ� �ۼ� ������ �̵�
	@RequestMapping(value="/community_write.do",method=RequestMethod.GET)
	public String community_write() {
		return "community/community_write";
	}
	
	//�Խñ� �ۼ�
	@RequestMapping(value="/community_write.do",method=RequestMethod.POST)
	public String community_write(Community_BoardVO cboardVO,HttpSession session,HttpServletRequest request) {
		
		UserVo login = (UserVo)session.getAttribute("login");
		
		cboardVO.setId(login.getId());			
		cboardVO.setUidx(login.getUidx());
		cboardVO.setIp(request.getRemoteAddr());
		
		//�Խñ� �ۼ�
		cboardService.insert(cboardVO);
		//�ֱ��ۼ��� �Խñ��� bidx
		int bidx = cboardService.maxBidx();
		
		return "redirect:community_view.do?bidx="+bidx;
	}
	
	//�Խñ� ���������� �̵�
	@RequestMapping(value="/community_modify.do",method=RequestMethod.GET)
	public String community_modify(int bidx,Model model) {
		
		//�ۼ��� �Խñ��� ī�װ��� ����Ʈ�� ����
		List<Community_BoardVO> categoryList = cboardService.categoryList();
		Community_BoardVO vo = cboardService.selectByBidx(bidx);
		
		model.addAttribute("vo",vo);
		model.addAttribute("categoryList",categoryList);
		return "community/community_modify";
	}
	
	//�Խñ� ����
	@RequestMapping(value="/community_modify.do",method=RequestMethod.POST)
	public String community_modify(Community_BoardVO cboardVO) {
		
		cboardService.modifyByBidx(cboardVO);
		
		return "redirect:community_view.do?bidx="+cboardVO.getBidx();
	}

	//�Խñ� ����
	@RequestMapping(value="/community_delete.do",method=RequestMethod.POST)
	public String delete(int bidx) {
		
		cboardService.deleteByBidx(bidx);
		
		return "redirect:community_list.do";
	}
	
	///////////////////////////////////////���////////////////////////////////////////////////////////////////////////////////////////////
	
	//��� ����Ʈ
		@RequestMapping(value="/community_replyList.do",method=RequestMethod.GET)
		@ResponseBody
		public List<ReplyVO> community_view(int bidx) {
			
			//��� ����Ʈ
			List<ReplyVO> reply_list = replyService.reply_list(bidx);
			
			return reply_list;
		}
	
	//��� �ۼ�
	@RequestMapping(value="/community_reply_insert.do",method=RequestMethod.POST)
	@ResponseBody
	public String community_reply_insert(ReplyVO replyVO,HttpSession session,HttpServletRequest request,Community_BoardVO cboardVO) {
		
		//�α��� ����
		UserVo login = (UserVo)session.getAttribute("login");
		
		replyVO.setUidx(login.getUidx()); //����ۼ��� ��ȣ
		replyVO.setId(login.getId()); //����ۼ��� ���̵�
		replyVO.setBidx(cboardVO.getBidx()); //�ۼ��Ѵ���� �Խñ� ��ȣ
		replyVO.setReply_Ip(request.getRemoteAddr()); // ������
		
		//����ۼ� �� ����
		replyService.reply_Insert(replyVO);
		
		return "success";
	}
	
	//��� ����
	@RequestMapping(value="/community_reply_delete.do",method=RequestMethod.POST)
	@ResponseBody
	public String community_reply_delete(ReplyVO replyVO) {
		replyService.deleteByReply(replyVO);
		
		return "1";
	}
	
	//��� ����
	@RequestMapping(value="/community_reply_update.do",method=RequestMethod.POST)
	@ResponseBody
	public String community_reply_update(@RequestBody ReplyVO replyVO) {
		replyService.updateByReply(replyVO);
		
		return "1";
	}
	
	
	//���� �ۼ�
	@RequestMapping(value="community_re_reply.do",method=RequestMethod.POST)
	@ResponseBody
	public String re_replyInsert(@RequestBody ReplyVO replyVO, HttpSession session, HttpServletRequest request,Community_BoardVO cboardVO) {
		
		//�α��� ����
		UserVo login = (UserVo)session.getAttribute("login");
		
		replyVO.setId(login.getId()); //���� �ۼ��� ���̵�
		replyVO.setUidx(login.getUidx()); //���� �ۼ��� uidx
		replyVO.setReply_Ip(request.getRemoteAddr()); //ip
		
		replyService.re_replyInsert(replyVO);
		
		return "1";
		
	}
	
	//�������ε�
	@RequestMapping(value="/multiplePhotoUpload.do")
	public void multiplePhotoUpload(HttpServletRequest request,HttpServletResponse response) {
		try {
			//��������
			String sFileInfo = "";
			//�Ϲ� �������ϸ�
			String filename = request.getHeader("file-name");
			//���� Ȯ����
			String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
			//Ȯ���ڸ� �ҹ��ڷ� ����
			filename_ext = filename_ext.toLowerCase();
			//���� �⺻���
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			//���� �⺻��� - �󼼰��
			String filePath = dftFilePath+"resources"+File.separator+"photo_upload"+File.separator;
			System.out.println("���丮:"+filePath);
			File file = new File(filePath);
			//���丮 �������� ������� ���丮 ����
			if(!file.exists()) {
				file.mkdirs();
			}
			//������ ���ε� �� ���ϸ�
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			realFileNm = today+UUID.randomUUID().toString()+filename.substring(filename.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;
			//������ ���Ͼ���
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while((numRead = is.read(b,0,b.length)) != -1) {
				os.write(b,0,numRead);
			}
			if(is != null) {
				is.close();
			}
			os.flush();
			os.close();
			//�������
			sFileInfo += "&bNewLine=true";
			//img�±��� title �Ӽ��� �������ϸ����� ��������ֱ� ����
			sFileInfo += "&sFileName="+filename;
			sFileInfo += "&sFileURL="+"/controller/resources/photo_upload/"+realFileNm;
			PrintWriter print = response.getWriter();
			print.print(sFileInfo);
			System.out.println(sFileInfo);
			print.flush();
			print.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
