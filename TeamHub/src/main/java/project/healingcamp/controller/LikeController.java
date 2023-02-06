package project.healingcamp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project.healingcamp.service.LikeService;
import project.healingcamp.vo.LikeVO;

@RequestMapping(value="/community")
@Controller
public class LikeController {
	
	@Autowired
	private LikeService likeService;
	
	@RequestMapping(value="/likeCount.do",method=RequestMethod.POST)
	@ResponseBody
	public int likeCount(LikeVO likeVO) {
		int result = likeService.likeCount(likeVO);
		return result;
	}
	
	//좋아요 +1
	@RequestMapping(value="/likeUp.do",method=RequestMethod.POST)
	@ResponseBody
	public void likeUp(LikeVO likeVO) {
		likeService.likeUp(likeVO);
	}
	
	//좋아요 -1
	@RequestMapping(value="/likeDown.do",method=RequestMethod.POST)
	@ResponseBody
	public void likeDown(LikeVO likeVO) {
		likeService.likeDown(likeVO);
	}

}
