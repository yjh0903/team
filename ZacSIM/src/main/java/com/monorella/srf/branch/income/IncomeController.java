package com.monorella.srf.branch.income;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.monorella.srf.branch.dto.Payment;
import com.monorella.srf.branch.dto.RoomDashBoard;
import com.monorella.srf.branch.payment.PaymentDao;
import com.monorella.srf.branch.room.RoomDao;
import com.monorella.srf.branch.scheduler.SchedulerDao;

@Controller
public class IncomeController {
	
	@Autowired
	private IncomeDao incomeDao; 
	@Autowired
	private SchedulerDao schedulerDao;
	@Autowired
	private RoomDao roomDao;
	@Autowired
	private PaymentDao paymentDao;
	
	//결제 취소 처리
	@RequestMapping(value="/account/delete" , method=RequestMethod.GET)
	public String deleteIncome(Payment payment, HttpSession session){
		System.out.println(payment);
		
		// 세션에서 오너코드 받기
		BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
		String branch_owner_cd = branchOwner.getBranch_owner_cd();
		
		//결제취소할 row 조회
		Payment paymentcancel = incomeDao.selectIncomeCancel(payment);
		//결제취소 테이블에 insert
		incomeDao.insertCancel(paymentcancel);
		//결제 row 삭제
		int incomeDelete = incomeDao.deleteIncome(payment);
		
		// 결제취소시 월별 결제 정보 조회
		DashboardAccount account = paymentDao.selectMonthIncome(branch_owner_cd);
		System.out.println("IncomeController-> deleteIncome()-> incomeDelete:" + incomeDelete);
		paymentDao.modifyMonthIncome(account);
	
		
		if(paymentcancel.getPay_extension().equals("N")){
			
			//결제 취소 회원, 열람석 정보 수정
			schedulerDao.modifyEndDateMember(payment.getMember_cd());
			//결제 취소 해당회원 출결번호 삭제 
			incomeDao.deleteInout(payment);
			
			//열람실 현황 수정
			RoomDashBoard roomDashboard = roomDao.selectRoomDashBoard(payment.getRoom_cd());
			roomDao.modifyRoomDashBoard(roomDashboard);
			roomDao.modifySeatRoomDashBoard(roomDashboard);
			
		}
		
		
		return "redirect:/account/income?result=1";
	}
	
	
	// 수입 목록 검색
	@RequestMapping(value="/income_list_search_pro", method=RequestMethod.POST)
	public String selectIncomeList(Model model
			, @RequestParam(value="startDate") String startDate
			, @RequestParam(value="endDate") String endDate 
			, HttpSession session){
		System.out.println("IncomeController-> SelectIncomeList()-> startDate: "+ startDate+ ", endDate: "+endDate);
		// 오늘 날짜 및 해당 월 구하기 -----------------------------------------------------------
		Date today = new Date();
	    SimpleDateFormat simpleToday = new SimpleDateFormat("yyyy-MM-dd");
	    SimpleDateFormat month = new SimpleDateFormat("M");	     
	    
		// 세선에서 사업자 코드 받기
		BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
		String branch_owner_cd = branchOwner.getBranch_owner_cd();
		System.out.println("IncomeController-> SelectIncomeList()-> branch_owner_cd: "+ branch_owner_cd);
		
		// 기간별 수입 목록 검색
		List<Payment> pay = incomeDao.selectIncomeList(startDate, endDate, branch_owner_cd);
		System.out.println("IncomeController-> selectIncomeList()-> pay: "+ pay);
			
		if(pay.isEmpty()){ 		
		    //기간 수입 합계
 			int total = 0;
 			
 			model.addAttribute("total", total);
 			model.addAttribute("today", simpleToday.format(today));
		    model.addAttribute("month", month.format(today));	    
		    model.addAttribute("startDate", startDate);
			model.addAttribute("endDate", endDate);
 			
			return "/account/income";
		}else{
			// 기간 수입 합계
			int total = incomeDao.selectIncomeSum(startDate, endDate, branch_owner_cd);
			System.out.println("IncomeController-> selectIncomeList()-> total: "+ total);
			
			model.addAttribute("today", simpleToday.format(today));
		    model.addAttribute("month", month.format(today));
			model.addAttribute("total", total);		
			model.addAttribute("startDate", startDate);
			model.addAttribute("endDate", endDate);
			model.addAttribute("pay", pay);

			return "/account/income";
		}
	}
	
	// 수입 목록 폼
	@RequestMapping(value="/account/income", method=RequestMethod.GET)
	public String incomeForm(Model model, @RequestParam(value="result", required=false)String result){
		System.out.println("AccountController-> selectIncomeList()");
		
		// 오늘 날짜 및 해당 월 구하기 -----------------------------------------------------------
		Date today = new Date();
	    SimpleDateFormat simpleToday = new SimpleDateFormat("yyyy-MM-dd");
	    SimpleDateFormat month = new SimpleDateFormat("M");	    
	    
	    //System.out.println("IncomeController-> IncomeForm()-> simpleToday: "+ simpleToday.format(today));
 		//System.out.println("IncomeController-> IncomeForm()-> month: "+ month.format(today));
	    
	    model.addAttribute("today", simpleToday.format(today));
	    model.addAttribute("month", month.format(today));
	    model.addAttribute("result", result);
	    
	    return "/account/income";
	}
}
