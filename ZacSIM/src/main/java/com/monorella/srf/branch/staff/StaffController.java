package com.monorella.srf.branch.staff;




import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.monorella.srf.branch.dto.BranchOwner;
import com.monorella.srf.branch.dto.Staff;
@Controller
public class StaffController {
	@Autowired
	private StaffDao staffDao;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	// 직원 삭제 폼 요청(비밀번호 입력 폼)
		@RequestMapping(value="staff/staff_delete", method = RequestMethod.GET)
		public String staffDelete(@RequestParam(value="staff_id", required=true)String staff_id){
			return "staff/staff_delete";
		}
		// 직원 삭제 요청
		@RequestMapping(value ="staff/staff_delete", method = RequestMethod.POST)
		public String staffDelete(@RequestParam(value="staff_id")String staff_id
								,@RequestParam(value="staff_pw")String staff_pw){
			staffDao.deleteStaff(staff_id, staff_pw);
			return "redirect:/staff/staff_list";
		}
	

	// 직원 수정 폼 요청
		@RequestMapping(value="staff/staff_modify", method = RequestMethod.GET)
		public String staffModify(Model model 
								,@RequestParam(value="staff_id", required=true)String staff_id){
			System.out.println("StaffController->staffModify()->staff_id:"+staff_id);
			Staff staff= staffDao.getStaff(staff_id);
			model.addAttribute("staff", staff);
			return "staff/staff_modify";
		}
		
		// 직원 수정 요청
		@RequestMapping(value ="staff/staff_modify", method = RequestMethod.POST)
		public String staffModify(Staff staff){
			System.out.println("StaffController->staffModify()->"+staff);
			staffDao.modifyStaff(staff);
			return "redirect:/staff/staff_view?staff_id="+staff.getStaff_id();
		}

	// 글 상세 내용 요청
		@RequestMapping(value="staff/staff_view", method = RequestMethod.GET)
		public String StaffView(Model model 
								,@RequestParam(value="staff_id")String staff_id){
			System.out.println("StaffController->StaffView()" + staff_id);
			Staff staff = staffDao.getStaff(staff_id);
			model.addAttribute("staff", staff);
			return "staff/staff_view";
		}
	

	//게시판 검색
		@RequestMapping(value="staff/staff_search" , method = {RequestMethod.GET, RequestMethod.POST})
		public String StaffSearch(Model model
				, @RequestParam("so") String so
				, @RequestParam("sv") String sv){
			System.out.println("StaffController->StaffSearch()" + so + sv);
				List<Staff> searchlist = staffDao.searchStaff(so, sv);
				System.out.println(searchlist);
			model.addAttribute("searchlist", searchlist);
			model.addAttribute("so", so);
		    model.addAttribute("sv", sv);
			return "staff/staff_search";
		}
	// 직원 리스트 요청 
	@RequestMapping(value = "/staff/staff_list", method = RequestMethod.GET)
	public String StaffList(Model model, HttpSession session){
		System.out.println("StaffController-> StaffList()");
		BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
		String branch_owner_cd = branchOwner.getBranch_owner_cd();
		System.out.println("StaffController-> StaffList() branch_owner_cd: "+ branch_owner_cd);
		List<Staff> list = staffDao.getStaffList(branch_owner_cd);
		Staff staff = list.get(0);
		System.out.println(staff.getStaff_in_date()+"<<<<<get getStaff_in_date()");
		model.addAttribute("list", list);
		return "staff/staff_list";
		
	}
	// 입력(액션)요청
	@RequestMapping(value = "/staff/staff_pro", method = RequestMethod.POST)
	public String staffPro(Staff staff){
		System.out.println("StaffController-> Staff()");
		staffDao.insertStaff(staff);
		return "redirect:/staff/staff_list";// 글입력후 "/staff_list"로 리다이렉트(재요청)
	}
	
	// 입력 폼 요청
		@RequestMapping(value = "/staff/staff_form", method = RequestMethod.GET)
			public String staffForm(){
				System.out.println("StaffController -> staff_form요청");
				return "staff/staff_form";
			}
}
