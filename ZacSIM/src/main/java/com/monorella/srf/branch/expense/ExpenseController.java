package com.monorella.srf.branch.expense;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.monorella.srf.branch.dto.BranchOwner;
import com.monorella.srf.branch.dto.DashboardAccount;
import com.monorella.srf.branch.dto.Expense;

@Controller
public class ExpenseController {
	@Autowired
	private ExpenseDao expenseDao;
	
	//공지사항 검색
	@RequestMapping(value="/expense/expense_list_search" , method = RequestMethod.POST)
	public String ExpenseSearch(Model model
			, @RequestParam("searchStartDate") String searchStartDate
			, @RequestParam("searchEndDate") String searchEndDate){
		System.out.println("StaffController->StaffSearch()" + searchStartDate + searchEndDate);
			List<Expense> searchlist = expenseDao.searchExpense(searchStartDate, searchEndDate);
			System.out.println(searchlist);
		model.addAttribute("searchlist", searchlist);
		model.addAttribute("searchStartDate", searchStartDate);
	    model.addAttribute("searchEndDate", searchEndDate);
		return "expense/expense_list_search";
	}
	
	// 리스트 및 페이징 요청
	@RequestMapping(value="/expense/expense_list", method = RequestMethod.GET)
	public String ExpenseList(Model model, HttpSession session
            , @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		System.out.println("ExpenseController -> ExpenseList()");
		BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
		String branch_owner_cd = branchOwner.getBranch_owner_cd();
		System.out.println("StaffController-> StaffList() branch_owner_cd: "+ branch_owner_cd);
		/*int joinCount = 0;
		joinCount = expenseDao.getExpenseCount();*/
		int pagePerRow = 5;
		List<Expense> list = expenseDao.selectExpenseList(currentPage, pagePerRow, branch_owner_cd);
		int lastPage = (int)(Math.ceil(pagePerRow));
		if(pagePerRow != 0) {
			lastPage++;
		}
		
		int countPage = 5;
		int startPage = ((currentPage - 1)/5)*5+1;
		int endPage = startPage + countPage-1;
		int nextPage = ((currentPage - 1)/5)*5+2;
		int previousPage = ((currentPage - 1)/5)*5-5+1;
		
		if(previousPage <= 0) {
			previousPage = 1;
		}
		
		if(endPage > lastPage) {
			previousPage = 1;
		}
		
		if(nextPage > lastPage) {
			nextPage = lastPage;
		}
		
	/*	model.addAttribute("joinCount", joinCount);*/
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("previousPage", previousPage);
		model.addAttribute("lastPage", lastPage);
		
		return "expense/expense_list";
	}
	
	// 입력 폼 요청
	@RequestMapping(value = "/expense/expense_form", method = RequestMethod.GET)
	public String ExpenseForm(){
		System.out.println("ExpenseController -> expenseForm요청");
		return "expense/expense_form";
	}

	// 입력(처리)요청
	@RequestMapping(value = "/expense/expense_form_pro", method = RequestMethod.POST)
	public String ExpensePro(Expense expense, HttpSession session){
		System.out.println("ExpenseController-> ExpensePro()->"+expense);
		//세션에서 오너코드 받기
		BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
		String branch_owner_cd = branchOwner.getBranch_owner_cd();
		
		expenseDao.insertExpense(expense);
		
		//월별 지출 총액 조회
		DashboardAccount account = expenseDao.selectMonthExpense(branch_owner_cd);
		//System.out.println("DashboardAccount-> account: "+account);
		//월별 결제 총액 brunch_dashboard_account_list에 업데이트
		expenseDao.modifyMonthExpense(account);
		
		return "redirect:/expense/expense_list";// 글입력후 "/expense_list"로 리다이렉트(재요청)
	}
}
