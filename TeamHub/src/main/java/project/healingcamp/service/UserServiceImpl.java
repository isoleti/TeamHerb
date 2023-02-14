package project.healingcamp.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.healingcamp.dao.UserDao;
import project.healingcamp.util.FileUtils;
import project.healingcamp.vo.UserVo;

@Service
public class UserServiceImpl implements UserService {

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public UserVo login(UserVo vo) {
		
		return userDao.login(vo);
	}

	@Override
	public int join(UserVo vo) {
	
		return userDao.join(vo);
	}

	@Override
	public int joinCoun(UserVo vo, MultipartHttpServletRequest mpRequest) throws Exception{

		
		  List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest);
		  int size = list.size(); for(int i=0; i<size; i++){
		  userDao.insertFile(list.get(i)); }
	
		return userDao.joinCoun(vo);
	}
	
	@Override
	public int selectById(String id) {
		
		return userDao.selectById(id);
	}

	@Override
	public int selectByMail(String mail) {
		
		return userDao.selectByMail(mail);
	}
	@Override
	public int selectByPhone(int phone) {
		
		return userDao.selectByPhone(phone);
	}
	@Override
	public int loginCheck(UserVo vo, HttpSession session) {
		System.out.println("UserService");
		System.out.println("ID : " + vo.getId());
		System.out.println("PW : " + vo.getPw());
		return userDao.loginCheck(vo);
	}

	@Override
	public String findId(String mail) {
	
		return userDao.findId(mail);
	}

	@Override
	public int userDelete(UserVo vo) {
		
		return userDao.userDelete(vo);
	}

	@Override
	public UserVo selectByUidx(int uidx) {
		
		return userDao.selectByUidx(uidx);
	}
	//ȸ������ ����
	@Override
	public int userModify(UserVo vo) {
		System.out.println("�������ÿ��� uidx: "+vo.getUidx());
		return userDao.userModify(vo);
	}
	//ȸ������ ��й�ȣ ����
	@Override
	public int pwReset(UserVo vo) {
		return userDao.pwReset(vo);
	}

	//��й�ȣ ȸ������ ��ȸ
	@Override
	public UserVo selectJoin(String mail) {
		
		return userDao.selectJoin(mail);
	}
		
	//��й�ȣ ������Ʈ
	@Override
	public int pwUpdate(UserVo vo) {
	
	//��й�ȣ ��ȣȭ
	String s_pw = UserSha256.encrypt(vo.getPw()); 
	vo.setPw(s_pw);
	
	//��ȣȭ Ȯ��
	System.out.println("s_pw:" + s_pw);
			
	return userDao.pwUpdate(vo);
	}

	
		
}
