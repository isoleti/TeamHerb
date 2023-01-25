package project.healingcamp.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.healingcamp.vo.ReserveVO;

@Repository
public class ReserveDAO {

	 @Autowired
	 private static SqlSessionTemplate mybatis;
	
	 
	 public ReserveDAO() {
		
	 }
	 
	 public static int countbyLike(HashMap hashMap){
		 
		    int count = mybatis.selectOne("project.healingcamp.mapper.resMapper.countbyLike", hashMap);
		    return count;
		    
		  }
		  
	  public static int create(HashMap hashMap){
		  
	    int count = mybatis.insert("project.healingcamp.mapper.resMapper.create", hashMap);
	    return count;
	    
	  }	  
	 
	  public static int like_check(HashMap hashMap) {
		  
	    int count = mybatis.update("project.healingcamp.mapper.resMapper.like_check", hashMap);
	    return count;
	    
	  }
	 
	  public static int like_check_cancel(HashMap hashMap) {
		  
	    int count = mybatis.update("project.healingcamp.mapper.resMapper.like_check_cancel", hashMap);
	    return count;
	    
	  }
	 
	  public static ReserveVO read(HashMap hashMap) {
		  
		 ReserveVO reserveVO = mybatis.selectOne("project.healingcamp.mapper.resMapper.read", hashMap);
	    return reserveVO;
	    
	  }
	 
	  public static int deletebycenter (String center) {
		  
	    int count = mybatis.delete("project.healingcamp.mapper.resMapper.deletebycenter", center);
	    return count;
	    
	  }
	  
	  public static int deletebyuidx(int uidx) {
		  
	    int count = mybatis.delete("project.healingcamp.mapper.resMapper.deletebyuidx", uidx);
	    return count;
	    
	  }
}
