package project.healingcamp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.service.UserSha256;
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
	
	public int loginCheck(UserVo vo) {	
		
		System.out.println("UserDAO");
		System.out.println("id : "+vo.getId());
		System.out.println("pw : "+vo.getPw());
		
		return sqlSession.selectOne("project.healingcamp.mapper.userMapper.loginCheck",vo);
	
	}
	
	public String findId(String mail){
		String id = sqlSession.selectOne("project.healingcamp.mapper.userMapper.findId", mail);
		System.out.println("id ÂïÈû?"+id);
		return sqlSession.selectOne("project.healingcamp.mapper.userMapper.findId", mail);
		
		
	}
	
}
