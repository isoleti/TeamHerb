package project.healingcamp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project.healingcamp.service.LikeService;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.LikeVO;

@RequestMapping(value={"/community","/counseller_board"})
@Controller
public class LikeController {
	
	@Autowired
	private LikeService likeService;
	
	//좋아요 체크 여부
	@RequestMapping(value="/likeCount.do",method=RequestMethod.POST)
	@ResponseBody
	public int likeCount(LikeVO likeVO) {
		int result = likeService.likeCount(likeVO);
		return result;
	}
	
	//좋아요 +1
	@RequestMapping(value="/likeUp.do",method=RequestMethod.POST)
	@ResponseBody
	public Community_BoardVO likeUp(LikeVO likeVO) {
		Community_BoardVO cboardVO = new Community_BoardVO();
		cboardVO = likeService.likeUp(likeVO);
		return cboardVO;
	}
	
	//좋아요 -1
	@RequestMapping(value="/likeDown.do",method=RequestMethod.POST)
	@ResponseBody
	public Community_BoardVO likeDown(LikeVO likeVO) {
		Community_BoardVO cboardVO = new Community_BoardVO();
		cboardVO = likeService.likeDown(likeVO);
		return cboardVO;
	}
	

}
