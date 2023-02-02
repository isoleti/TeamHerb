package project.healingcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.PageDao;
import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.UserVo;

@Service
public class PageServiceImpl implements PageService{

	@Autowired
	private PageDao pageDao;

	@Override
	public List<ReserveVO> list(ReserveVO vo) {
		
		return pageDao.list(vo);
	}

	@Override
	public UserVo pwCheck(UserVo vo) {
		System.out.println("서비스 임플에서 pw: "+vo.getPw());
		return pageDao.pwCheck(vo);
	}
}
