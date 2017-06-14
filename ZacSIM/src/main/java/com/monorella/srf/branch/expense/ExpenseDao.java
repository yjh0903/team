package com.monorella.srf.branch.expense;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.monorella.srf.branch.dto.DashboardAccount;
import com.monorella.srf.branch.dto.Expense;


@Repository
public class ExpenseDao {
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	// 결제 등록시 월별 지출 총액 업데이트
	public int modifyMonthExpense(DashboardAccount dashboardAccount){
		System.out.println("PaymentDao-> modifyMonthIncome()-> dashboardAccount: "+ dashboardAccount);
		return sqlSessionTemplate.update("com.monorella.srf.branch.expense.ExpenseMapper.modifyMonthExpense", dashboardAccount);
	}
	// 지출 등록시 월별 지출 총액 셀렉트
	public DashboardAccount selectMonthExpense(String branch_owner_cd){
		System.out.println("PaymentDao-> selectMonthIncome()-> branch_owner_cd: "+ branch_owner_cd);
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.expense.ExpenseMapper.selectMonthExpense", branch_owner_cd);
	}
	
	
	//지출내역 기간별로  검색 메서드
	public List<Expense> searchExpense(String searchStartDate, String searchEndDate){
		System.out.println("ExpenseDao->searchExpense ->searchStartDate:" +searchStartDate
				 +"searchEndDate:" + searchEndDate);
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchStartDate", searchStartDate);
		map.put("searchEndDate", searchEndDate);
		List<Expense> expenseList = null;
		expenseList = sqlSessionTemplate.selectList("com.monorella.srf.branch.expense.ExpenseMapper.searchExpense", map);
		return expenseList;
	}
	
	/*//전체 공지사항의 수를 구하는 메서드
	public int getExpenseCount(){
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.expense.ExpenseMapper.getExpenseCount");
	}
		*/	
	// 지출리스트 메서드
	public List<Expense> selectExpenseList(int currentPage, int pagePerRow, String branch_owner_cd) {
		System.out.println("ExpenseDao-> selectExpenseList-> currentPage: " + currentPage 
				+"pagePerRow: "+pagePerRow);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", (currentPage-1)*pagePerRow);
		map.put("pagePerRow", pagePerRow);
		map.put("branch_owner_cd", branch_owner_cd);
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.expense.ExpenseMapper.selectExpenseList", map);
	}
	
	// 지출입력 메서드
    public int insertExpense(Expense expense) {
		System.out.println("ExpenseDao->insertExpense()->"+expense);
	    return sqlSessionTemplate.insert("com.monorella.srf.branch.expense.ExpenseMapper.insertExpense", expense);
    }
}
