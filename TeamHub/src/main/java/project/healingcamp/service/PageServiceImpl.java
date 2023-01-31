package project.healingcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.healingcamp.dao.PageDao;
import project.healingcamp.vo.ReserveVO;

@Service
public class PageServiceImpl implements PageService{

	@Autowired
	private PageDao pageDao;

	@Override
	public List<ReserveVO> list(ReserveVO vo) {
		
		return pageDao.list(vo);
	}
}
