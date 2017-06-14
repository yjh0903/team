package com.monorella.srf.branch.login;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.monorella.srf.branch.dto.BranchOwner;
import com.monorella.srf.branch.dto.Staff;
import com.monorella.srf.branch.dto.StaffLogin;

@Repository
public class LoginDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 지점직원 로그인
	public StaffLogin loginBranchStaff(Staff staff){
		System.out.println("LoginDao-> loginBranchStaff()-> staff:"+staff);
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.login.LoginMapper.loginBranchStaff", staff);
	}
	
	//지점대표자 로그인
	public BranchOwner loginBranchOwner(BranchOwner branchOwner){
		System.out.println("loginBranchOwner com.monorella.srf.branch.login LoginDao");
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.login.LoginMapper.loginBranchOwner", branchOwner);
	}
}
