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
		return sqlSession.selectOne("project.hilingcamp.mappers.userMapper.login", vo);
	}
	public int selectById(String Id) {
		return sqlSession.selectOne("project.hilingcamp.mappers.userMapper.selectById", Id);
		
	}
	
	
	
}
