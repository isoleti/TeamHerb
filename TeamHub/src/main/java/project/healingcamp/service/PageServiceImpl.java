package project.healingcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.PageDao;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.MyCriteria;
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
		
		return pageDao.pwCheck(vo);
	}

	@Override
	public List<Community_BoardVO> list(MyCriteria cri) {
		System.out.println("서비스임플 list: "+cri.getContent());
		return pageDao.list(cri);
	}

	@Override
	public int total(MyCriteria cri) {
		
		return pageDao.total(cri);
	}
}
