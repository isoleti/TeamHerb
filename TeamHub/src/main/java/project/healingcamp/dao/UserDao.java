package project.healingcamp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public UserVo login(UserVo vo) {
		System.out.println(vo.toString());
		return sqlSession.selectOne("project.hilingcamp.mapper.userMapper.login", vo);
	}
	public int join(UserVo vo) {
		
		return sqlSession.insert("project.hilingcamp.mapper.userMapper.join", vo);
	}
	public int joinCoun(UserVo vo) {
		
		return sqlSession.insert("project.hilingcamp.mapper.userMapper.joinCoun", vo);
	}
	public int selectById(String id) {
		return sqlSession.selectOne("project.hilingcamp.mapper.userMapper.selectById",id);
	}
	public int selectByMail(String mail) {
		return sqlSession.selectOne("project.hilingcamp.mapper.userMapper.selectByMail",mail);
	}
	
	public String loginCheck(UserVo vo) {	
		return sqlSession.selectOne("project.hilingcamp.mapper.userMapper.loginCheck",vo);
	
	}
	
}
