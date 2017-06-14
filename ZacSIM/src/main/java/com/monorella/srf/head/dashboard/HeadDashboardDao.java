package com.monorella.srf.head.dashboard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.monorella.srf.branch.dto.BranchOwner;
import com.monorella.srf.branch.dto.DashboardAccount;

@Repository
public class HeadDashboardDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//지점코드와 지점이름 조회
	public List<BranchOwner> selectBranch(){
		return sqlSessionTemplate.selectList("com.monorella.srf.head.dashboard.HeadDashboardMapper.selectBranch");
	}
	
	//지점별 월매출 조회
	public DashboardAccount selectBranchTotalIncome(DashboardAccount dashboardAccount){
		return sqlSessionTemplate.selectOne("com.monorella.srf.head.dashboard.HeadDashboardMapper.selectBranchTotalIncome", dashboardAccount);
	}
}
