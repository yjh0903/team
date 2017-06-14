package com.monorella.srf.head.dashboard;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.monorella.srf.branch.dto.BranchOwner;
import com.monorella.srf.branch.dto.DashboardAccount;

@Controller
public class HeadDashboardController {
	
	@Autowired
	HeadDashboardDao headDashboardDao;
	
	
	@RequestMapping(value="/head/branchTotal", method= RequestMethod.POST)
	public ResponseEntity<String> branchTotal(DashboardAccount dashboardAccount){
		System.out.println(dashboardAccount);
		//지점별 월매출 현황리스트
		DashboardAccount accountlist = headDashboardDao.selectBranchTotalIncome(dashboardAccount);
	    System.out.println("accountlist :" + accountlist);
	    
	    //JSONObject
	    JSONObject jsonMain = new JSONObject();
	    jsonMain.put("january", accountlist.getJanuary());
	    jsonMain.put("february", accountlist.getFebruary());
	    jsonMain.put("march", accountlist.getMarch());
	    jsonMain.put("april", accountlist.getApril());
	    jsonMain.put("may", accountlist.getMay());
	    jsonMain.put("june", accountlist.getJune());
	    jsonMain.put("july", accountlist.getJuly());
	    jsonMain.put("august", accountlist.getAugust());
	    jsonMain.put("september", accountlist.getSeptember());
	    jsonMain.put("october", accountlist.getOctober());
	    jsonMain.put("november", accountlist.getNovember());
	    jsonMain.put("december", accountlist.getDecember());
	    
	    System.out.println(jsonMain.toString());
	    HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
		return new ResponseEntity<String>(jsonMain.toString(), responseHeaders, HttpStatus.OK);
	}
	
	@RequestMapping(value="/head/dashboard/dashboard", method = RequestMethod.GET)
	public String dashboard(Model model){
		System.out.println("DashboardController-> dashboard()");
		// 오늘 날짜 및 해당 월 구하기 -----------------------------------------------------
		Date today = new Date();
	    SimpleDateFormat simpleToday = new SimpleDateFormat("yyyy-MM-dd");
	    SimpleDateFormat month = new SimpleDateFormat("M");
	    List<BranchOwner> branchlist =  headDashboardDao.selectBranch();
	    System.out.println("branchlist :" + branchlist);
	    //System.out.println("DashboardController-> selectTodayStatus()-> simpleToday: "+ simpleToday.format(today));
 		//System.out.println("DashboardController-> selectTodayStatus()-> month: "+ month.format(today));
	    
	    model.addAttribute("today", simpleToday.format(today));
	    model.addAttribute("month", month.format(today));
	    model.addAttribute("branchlist", branchlist);
	    
		return "head/dashboard/dashboard";
	}
}
