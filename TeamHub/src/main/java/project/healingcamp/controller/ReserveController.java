package project.healingcamp.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.healingcamp.dao.ReserveDAO;
import project.healingcamp.service.ReserveServiceImpl;
import project.healingcamp.vo.ReserveVO;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RequestMapping(value = "/res")
@Controller
public class ReserveController {

	@Autowired
	private ReserveDAO reserveDAO = null;

	@Autowired
	private ReserveServiceImpl reserveService = null;
	
	//기관찾기
	@RequestMapping(value = "/findcenter.do", method = RequestMethod.GET)
	public String findcenter() {

		return "res/findcenter";
	}
	
	//상담사찾기
	@RequestMapping(value = "/findcounselor.do", method = RequestMethod.GET)
	public String findcounselor() {

		return "res/findcounselor";
	}
	
	//상담기관
	@RequestMapping(value = "/center.do", method = RequestMethod.GET)
	public String center() {

		return "res/center";
	}
	
	//예약페이지
	@RequestMapping(value = "/respage.do", method = RequestMethod.GET)
	public String page() {

		return "res/respage";
	}
	
	//예약완료
	@RequestMapping(value = "/resf.do", method = RequestMethod.GET)
	public String res() {

		return "res/resf";
	}

	@RequestMapping(value= "/count.do", method = RequestMethod.GET) //나중에 post방식으로 바꿀 것.
	public String count() {
		
		return "res/count";
	}
	
	@ResponseBody
	@RequestMapping(value="/res/like.do", method=RequestMethod.POST)
	public String like(String center,HttpSession session){
	  
	  //System.out.println("--> like() created"); int uidx =
	  int uidx = (Integer)session.getAttribute("uidx");
	  
	  JSONObject obj = new JSONObject();
	  
	  ArrayList<String> msgs = new ArrayList<String>(); 
	  HashMap <String, Object>
	  hashMap = new HashMap<String, Object>(); 
	  hashMap.put("center", center);
	  hashMap.put("uidx", uidx);
	  
	  ReserveVO reserveVO = reserveService.read(hashMap);
	  
	  int like_cnt = reserveVO.getLikecheck(); //게시판의 좋아요 카운트 int like_check = 0;
	  int like_check = 0;
	  like_check  =reserveVO.getLikecheck(); //좋아요 체크 값
	  
	  if(reserveService.countbyLike(hashMap)==0){ 
		  
		  reserveService.create(hashMap); 
		  
	  }
	  
	  if(like_check == 0) { 
		  
		  msgs.add("좋아요!"); reserveService.like_check(hashMap);
		  like_check++; 
		  like_cnt++; 
		  reserveService.like_cnt_up(center); //좋아요 갯수 증가 
		  
	  } else { 
		  
		  msgs.add("좋아요 취소"); 
	  	  reserveService.like_check_cancel(hashMap);
	  	  like_check--; 
	  	  like_cnt--; 
	  	  reserveService.like_cnt_down(center);
	  	  
	  }
	  
	   //좋아요 갯수 감소 
	  obj.put("center", reserveVO.getCenter()); 
	  obj.put("like_check", like_check);
	  obj.put("like_cnt", like_cnt); 
	  obj.put("msg", msgs);
	  
	  return obj.toJSONString();
	  
	  }
	  
	@ResponseBody
	@RequestMapping(value="/res/read.do", method=RequestMethod.GET) 
	public String read(@RequestParam(value="clidx") String cneter, HttpSession session){
		  int uidx = (Integer)session.getAttribute("uidx");
		  int clidx = (Integer)session.getAttribute("clidx");	
		  
		  JSONObject obj = new JSONObject();
		  
		  HashMap<String, Object> 
		  hashMap = new HashMap<String, Object>();
		  hashMap.put("clidx", clidx); 
		  hashMap.put("uidx", uidx);
		  
		  if(reserveService.countbyLike(hashMap)==0) { 
			  reserveService.create(hashMap);
		  }
		  
		  ReserveVO reserveVO = reserveService.read(hashMap); 
		  
		  
		  obj.put("clidx", clidx); 
		  obj.put("uidx", uidx);
		  obj.put("likecheck", reserveVO.getLikecheck()); // 회원별 좋아요 체크값	
		  
		  
	  return obj.toJSONString(); 
	 }	
	
	
	
}
