package project.healingcamp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.service.UserSha256;
import project.healingcamp.vo.Community_BoardVO;
import project.healingcamp.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public UserVo login(UserVo vo) {
		System.out.println(vo.toString());
		return sqlSession.selectOne("project.healingcamp.mapper.userMapper.login", vo);
	}
	public int join(UserVo vo) {
		
		return sqlSession.insert("project.healingcamp.mapper.userMapper.join", vo);
	}
	public int joinCoun(UserVo vo) {
		
		return sqlSession.insert("project.healingcamp.mapper.userMapper.joinCoun", vo);
	}
	public int selectById(String id) {
		return sqlSession.selectOne("project.healingcamp.mapper.userMapper.selectById",id);
	}
	public int selectByMail(String mail) {
		return sqlSession.selectOne("project.healingcamp.mapper.userMapper.selectByMail",mail);
	}
	public int selectByPhone(int phone) {
		return sqlSession.selectOne("project.healingcamp.mapper.userMapper.selectByPhone",phone);
	}
	//ȸ��Ż��
	public int userDelete(UserVo vo) {
		return sqlSession.update("project.healingcamp.mapper.userMapper.userDelete", vo);
	}
	//ȸ������ ��ȸ
	public UserVo selectByUidx(int uidx) {
		return sqlSession.selectOne("project.healingcamp.mapper.userMapper.selectByUidx", uidx);
	}
	//ȸ������ ����
	public int userModify(UserVo vo) {
		return sqlSession.update("project.healingcamp.mapper.userMapper.userModify", vo);
	}
	
	public int loginCheck(UserVo vo) {	
		
		System.out.println("UserDAO");
		System.out.println("id : "+vo.getId());
		System.out.println("pw : "+vo.getPw());
		
		return sqlSession.selectOne("project.healingcamp.mapper.userMapper.loginCheck",vo);
	
	}
	//���̵� ã��
	public String findId(String mail){
		String id = sqlSession.selectOne("project.healingcamp.mapper.userMapper.findId", mail);
		System.out.println("id ����?"+id);
		return sqlSession.selectOne("project.healingcamp.mapper.userMapper.findId", mail);
	
	}
	
	//ȸ������ ��ȸ
	public UserVo selectJoin(String mail) {
		return sqlSession.selectOne("project.healingcamp.mapper.userMapper.selectJoin",mail);
	}
		
	//�н����� ����
	public int pwUpdate(UserVo vo) {
		System.out.println("Daovo:" + vo);
		return sqlSession.update("project.healingcamp.mapper.userMapper.pwUpdate", vo);
	}
	
}
