package project.healingcamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/counseller_board")
@Controller
public class CounsellerController {

	@RequestMapping(value="/counseller_board_list.do",method=RequestMethod.GET)
	public String counseller_board_list() {
		return "counseller_board/counseller_board_list";
	}
	
	@RequestMapping(value="/counseller_board_write.do",method=RequestMethod.GET)
	public String counseller_board_write() {
		return "counseller_board/counseller_board_write";
	}
}
