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
	
	//���ã��
	@RequestMapping(value = "/findcenter.do", method = RequestMethod.GET)
	public String findcenter() {

		return "res/findcenter";
	}
	
	//�����
	@RequestMapping(value = "/center.do", method = RequestMethod.GET)
	public String center() {

		return "res/center";
	}
	
	//����������
	@RequestMapping(value = "/respage.do", method = RequestMethod.GET)
	public String page() {
		
		return "res/respage";
	}
	
	//����Ϸ�
	@RequestMapping(value = "/resf.do", method = RequestMethod.GET)
	public String res() {

		return "res/resf";
	}
	
	//����Ϸ�
		@RequestMapping(value = "/resf.do", method = RequestMethod.POST)
		public String resF() {

			return "res/resf";
		}
	
	
}
