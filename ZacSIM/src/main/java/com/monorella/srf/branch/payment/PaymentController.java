package com.monorella.srf.branch.payment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.monorella.srf.branch.dto.BranchOwner;
import com.monorella.srf.branch.dto.Charges;
import com.monorella.srf.branch.dto.DashboardAccount;
import com.monorella.srf.branch.dto.Member;
import com.monorella.srf.branch.dto.Payment;
import com.monorella.srf.branch.dto.RoomDashBoard;
import com.monorella.srf.branch.member.MemberDao;
import com.monorella.srf.branch.room.RoomDao;

@Controller
public class PaymentController {
		
	@Autowired PaymentDao paymentDao;
	@Autowired RoomDao roomDao;
	@Autowired MemberDao memberDao;
	
	//회원코드 검색 pro
	@RequestMapping(value="payment/payment_search_pro",method=RequestMethod.GET)
	public String searchMemberPro(@RequestParam(value="sv", required=true)String sv
									, Model model, HttpSession session){
		System.out.println("sv :" + sv);
		String so = "member_nm";
		BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
		List<Member> memberlist = memberDao.searchMember(so, sv, branchOwner);
		System.out.println(memberlist);
		model.addAttribute("memberlist", memberlist);
		return "payment/payment_search_pro";
	}
	
	//회원코드 검색 form
	@RequestMapping(value="payment/payment_search", method=RequestMethod.GET)
	public String searchMember(){
		return "payment/payment_search";
	}
	
	//회원코드 중복확인
	@RequestMapping(value="payment/check_membercd", method=RequestMethod.GET)
	public ResponseEntity<String> checkMember(Member member){
		System.out.println("checkMemberCd()" + member);
		Member checkmember = paymentDao.checkMember(member);
		String result = "";
		if(checkmember.getMember_seat_state().equals("Y")){
			System.out.println("중복 멤버코드");
			result = "Y";
		}else{
			System.out.println("신규 멤버코드");
			result = "N";
		}
		JSONObject jsonMain = new JSONObject();
		jsonMain.put("check", result);
		System.out.println(jsonMain.toString());
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
	    return new ResponseEntity<String>(jsonMain.toString(), responseHeaders, HttpStatus.OK);  	
	}
	
	//기간 만료일 연장 성공
	@RequestMapping(value="payment/extension_success", method=RequestMethod.GET)
	public String extensionSuccess(){
		return "payment/extension_success";
	}
	
	//기간 만료일 연장 pro
	@RequestMapping(value="/payment/extension_pro", method = RequestMethod.POST)
	public String extensionEndDatePro(Payment payment){
		System.out.println("PaymentController /n" + payment);
		payment.setPay_extension("Y");
		int result = paymentDao.insertPayment(payment);
		if(result == 1){
			System.out.println("기간연장 결제처리 성공 ");
			paymentDao.modifyEndDate(payment);
			System.out.println("회원 기간연장 성공");
			return "redirect:/payment/extension_success";
		}
		return "redirect:/payment/newwindetail";
	}
	
	//연장 form(회원 기간만료예정자메뉴)
	@RequestMapping(value="/payment/member_period_extension", method = RequestMethod.GET)
	public String extensionPaymentFrom02(Member member, Model model){
		Member detailmember = paymentDao.detailMember(member);
		model.addAttribute("detailmember", detailmember);
		return "room/member_period_extension";
	}
	
	
	//연장 form
	@RequestMapping(value="/payment/extension_form" , method = RequestMethod.GET)
	public String extensionPaymentFrom(Member member, Model model){
		System.out.println("extensionPaymentFrom() 실행");
		System.out.println("PaymentController member :" + member);
		Member detailmember = paymentDao.detailMember(member);
		System.out.println("PaymentController detailmember :" + detailmember);
		model.addAttribute("detailmember", detailmember);
		return "payment/extension_form";
	}
	
	//결제 form
	@RequestMapping(value="/payment/newwinpayment", method = RequestMethod.GET)
	public String paymentFrom(Model model,
			@RequestParam(value="branch_owner_cd", required=true) String branch_owner_cd,	
			@RequestParam(value="room_cd", required=true) String room_cd,
			@RequestParam(value="seat_cd", required=true) String seat_cd,
			@RequestParam(value="member_cd", required=true) String member_cd){

		List<Charges> chargeslist = paymentDao.selectCharges(branch_owner_cd);
		System.out.println("PaymentController paymentFrom() chargeslist: "+ chargeslist);
		model.addAttribute("chargeslist", chargeslist);
		model.addAttribute("branch_owner_cd", branch_owner_cd);
		model.addAttribute("room_cd", room_cd);
		model.addAttribute("seat_cd", seat_cd);
		model.addAttribute("member_cd", member_cd);

		return "payment/newwinpayment";
	}
	
	@RequestMapping(value="/payment/newwinmember", method = RequestMethod.GET)
	public String winmember(){
		return "payment/newwinmember";
	}
	
	// 상세정보 요청
	@RequestMapping(value="/payment/newwindetail", method = RequestMethod.GET)
	public String newwindetail(Member member, Model model){
		Member detailmember = paymentDao.detailMember(member);
		System.out.println("member: "+ detailmember);
		model.addAttribute("detailmember", detailmember);
		return "payment/newwindetail";
	}
	
	// 결제완료
	@RequestMapping(value="/payment/paymentend", method = RequestMethod.POST)
	public String paymentpro(Payment payment, Member member, Model model, HttpSession session){
		System.out.println("paymentpro 요청");
		//세션에서 오너코드 받기
		BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
		String branch_owner_cd = branchOwner.getBranch_owner_cd();
		
		//결제 입력
		payment.setPay_extension("N");
		int result = paymentDao.insertPayment(payment);
		System.out.println("insertPayment 요청");
		if(result == 1){
			//월별 결제 총액 조회
			DashboardAccount account = paymentDao.selectMonthIncome(branch_owner_cd);
			System.out.println("DashboardAccount-> account: "+account);
			//월별 결제 총액 brunch_dashboard_account_list에 업데이트
			paymentDao.modifyMonthIncome(account);
			
			//성공시(열람석 지정 'Y'로)
			paymentDao.modifyPaymentSeat(payment);	
			//출결번호 테이블 insert
			paymentDao.insertPaymentinout(payment);
			//멤버테이블 요일 update
			paymentDao.modifyPaymentMember(payment);
			System.out.println("modifyPaymentMemberresulting 요청");
			System.out.println("modifyPaymentMembermember 요청"+ member);
			//inout 코드 조회
			int inouting = paymentDao.inoutingdetail(payment);
			System.out.println("inouting :" + inouting);
			
			member.setInout_num(inouting);
			System.out.println("Paymentinoutupmember 요청"+ member);
			paymentDao.Paymentinoutup(member);
			System.out.println("Paymentinoutupmember 요청"+ member);
			
			//열람실현황 조회
			RoomDashBoard roomdash = roomDao.selectRoomDashBoard(payment.getRoom_cd());
			System.out.println(roomdash);
			//열람실현황 수정
			roomDao.modifyRoomDashBoard(roomdash);

			//출결번호
			model.addAttribute("inouting", inouting);
			
		}else{
			//실패시 			
		}
		return "payment/paymentend";
		}
}
