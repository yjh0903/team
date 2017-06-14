package com.monorella.srf.branch.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.monorella.srf.branch.dto.BranchOwner;
import com.monorella.srf.branch.dto.Staff;
import com.monorella.srf.branch.dto.StaffLogin;
import com.monorella.srf.branch.member.MemberDao;

@Controller
public class LoginController {
	
	@Autowired LoginDao loginDao;
	@Autowired MemberDao memberDao;
	
	//페이지 테스트
	@RequestMapping(value="/page/data", method = RequestMethod.GET)
	public String page_form(){
		return "pages/tables/data_tb";
	}
	
	//홈
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String main_form(){
		return "home";
	}
	
	//로그아웃 처리
	@RequestMapping(value = "/login/logout", method = RequestMethod.GET)
	public String logout(){
		return "login/login_logout";
	}
	
	
	//index
	@RequestMapping(value = "/",  method = RequestMethod.GET)
	public String main(){
		return "index";
		
	}
	//로그인 폼
	@RequestMapping(value = "/login/loginFrom",  method = RequestMethod.GET)
	public String loginFrom(){ 
		return "login/login_form";
	}
	
	// 직원 로그인 처리
	@RequestMapping(value = "/login/loginStaff", method = RequestMethod.POST)
	public String staffLogin(Staff staff, HttpServletRequest request){
		System.out.println("LoginController-> staffLogin -> staff:" + staff);
		
		StaffLogin bs = loginDao.loginBranchStaff(staff);
		System.out.println("LoginController-> staffLogin-> bs:" +bs);
		
		if(bs == null){
			System.out.println("아이디와 비번이 일치하지 않습니다.");
			return "redirect:/login/loginFrom";
		}else{
			System.out.println("로그인 성공");
			request.getSession().setAttribute("branchStaff", bs);
		}
		
		return "redirect:/dashboard/all_status";

	}
	
	//로그인 처리
	@RequestMapping(value = "/login/loginpro", method = RequestMethod.POST)
	public String loginPro(BranchOwner branchOwner, HttpServletRequest request){
		//System.out.println("로그인 처리 요청");
		BranchOwner owner = loginDao.loginBranchOwner(branchOwner);
		//System.out.println("loginPro: " +owner);
		if(owner == null){
			//System.out.println("아이디와 비번이 일치하지 않습니다.");
			return "redirect:/login/loginFrom";
		}else{
			//System.out.println("로그인 성공");
			request.getSession().setAttribute("branchOwner", owner);
		}
		return "redirect:/dashboard/all_status";
	}
}
