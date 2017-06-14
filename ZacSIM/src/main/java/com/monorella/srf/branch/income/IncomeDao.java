package com.monorella.srf.branch.income;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.monorella.srf.branch.dto.Payment;

@Repository
public class IncomeDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//결제취소 출결번호 테이블에서 해당 회원 삭제
	public int deleteInout(Payment payment){
		return sqlSessionTemplate.delete("com.monorella.srf.branch.income.IncomeMapper.deleteInout", payment);
	}
	
	//결제취소 테이블에 insert
	public int insertCancel(Payment payment){
		return sqlSessionTemplate.insert("com.monorella.srf.branch.income.IncomeMapper.insertCancel", payment);
	}
	
	//결제 취소 row 조회
	public Payment selectIncomeCancel(Payment payment){
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.income.IncomeMapper.selectIncomeCancel", payment);
	}
	
	//결제 취소 해당 결제 코드 row 삭제
	public int deleteIncome(Payment payment){
		return sqlSessionTemplate.delete("com.monorella.srf.branch.income.IncomeMapper.deleteIncome" , payment);
	}
	
	// 기간 수입 합계
	public int selectIncomeSum(String startDate, String endDate, String branch_owner_cd){
		System.out.println("IncomeDao-> SelectIncomeSum() startDate: "+startDate+", endDate:"+endDate+", branch_owner_cd: "+branch_owner_cd);
		Map<String, String> map = new HashMap<String, String>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("branch_owner_cd", branch_owner_cd);
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.income.IncomeMapper.selectIncomeSum", map);
	}
	
	// 기간 설정 및 검색
	public List<Payment> selectIncomeList(String startDate, String endDate, String branch_owner_cd){
		System.out.println("IncomeDao-> selectPaymentList() startDate: "+startDate+", endDate:"+endDate+", branch_owner_cd: "+branch_owner_cd);
		Map<String, String> map = new HashMap<String, String>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("branch_owner_cd", branch_owner_cd);
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.income.IncomeMapper.selectIncomeList", map);
	}
}
