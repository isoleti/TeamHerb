package project.healingcamp.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.ReserveDAO;
import project.healingcamp.vo.ReserveVO;

@Service //작동 안하면 @Component로 바꿀 것,
public class ReserveServiceImpl implements ReserveService{
	
	@Autowired
	private ReserveDAO reserveDAO;
	
	@Override
	public int countLike(HashMap hashMap) {
		
		return 0;
	}

	@Override
	public int createlike(HashMap hashMap) {
		
		return 0;
	}

	@Override
	public int like_check(HashMap hashMap) {
		
		return 0;
	}

	@Override
	public int like_check_cancel(HashMap hashMap) {
		
		return 0;
	}

	@Override
	public ReserveVO read(HashMap hashMap) {
	
		return null;
	}

	@Override
	public int deleteby(int clidx) {
	
		return 0;
	}

	@Override
	public int deletebyMno(String center) {
	
		return 0;
	}

}
