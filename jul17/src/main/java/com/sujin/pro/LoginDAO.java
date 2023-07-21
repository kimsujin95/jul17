package com.sujin.pro;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public LoginDTO login(LoginDTO dto) {
		
		return sqlSession.selectOne("login.login", dto);
	}
}
