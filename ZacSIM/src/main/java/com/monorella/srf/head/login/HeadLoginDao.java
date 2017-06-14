package com.monorella.srf.head.login;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.monorella.srf.head.dto.HeadManager;

@Repository
public class HeadLoginDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public HeadManager loginPro(HeadManager hm){
		System.out.println("LoginDao-> loginPro()-> HeadManager: "+hm);
		return sqlSessionTemplate.selectOne("com.monorella.srf.head.login.HeadLoginMapper.LoginPro", hm);
	}
}
