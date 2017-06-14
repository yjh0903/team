package com.monorella.srf.branch.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.monorella.srf.branch.dto.BranchOwner;
import com.monorella.srf.branch.dto.DashboardAgeGroup;
import com.monorella.srf.branch.dto.InsertNumList;
import com.monorella.srf.branch.dto.Member;
import com.monorella.srf.branch.dto.SeatTime;

@Controller
public class MemberController {
	@Autowired
	private MemberDao memberDao;

	// 회원 삭제 폼 요청
	@RequestMapping(value="/member/member_remove", method = RequestMethod.GET)
	public String MemberRemove(@RequestParam(value="member_cd", required=true) String member_cd){
		System.out.println("/member/member_remove 요청");
		return "member/member_remove";
	}

	// 회원 삭제 요청
	@RequestMapping(value ="/member/member_remove", method = RequestMethod.POST)
	public String MemberRemove(@RequestParam(value="member_cd") String member_cd
			, @RequestParam(value="branch_owner_cd") String branch_owner_cd) {
		memberDao.removeMember(member_cd, branch_owner_cd);
		System.out.println("삭제 완료");
		return "redirect:/member/member_list";
	}

	// 회원 수정 폼 요청
	@RequestMapping(value="/member/member_modify", method = RequestMethod.GET)
	public String MemberModify(Model model
			, @RequestParam(value="member_nm", required=true) String member_nm) {
		System.out.println("/member/member_modify2 요청");
		Member member = memberDao.getMember(member_nm);
		model.addAttribute("member", member);
		return "member/member_modify";
	}

	// 회원 수정 요청
	@RequestMapping(value ="/member/member_modify", method = RequestMethod.POST)
	public String MemberModify(Member member){
		System.out.println("/member/member_modify1 요청");
		memberDao.modifyMember(member);
		System.out.println("수정이름 : " + member.getMember_nm()+"/member/member_modify1 요청");
		return "redirect:/member/member_view?member_nm="+member.getMember_nm();
	}

	// 회원 입퇴실 요청
		@RequestMapping(value="/member/member_excci", method = RequestMethod.GET)
		public String MemberExcci(Model model 
				, @RequestParam(value="member_nm")String member_nm
				, @RequestParam(value="member_tel")String member_tel){
			System.out.println("/member/member_excci 요청");
			Member member= memberDao.getMeberView(member_tel);
			System.out.println("두번재 :" + member);
			System.out.println("이름 : " + member.getMember_nm());
			 List<SeatTime> seattime= memberDao.getExit(member.getMember_nm());
			 System.out.println("여기 :" + seattime);
			 model.addAttribute("seattime", seattime);
			model.addAttribute("member", member);
			return "member/member_excci";
	}
	
	// 회원 상세 요청
	@RequestMapping(value="/member/member_view", method = RequestMethod.GET)
	public String MemberView(Model model
			, @RequestParam(value="member_nm")String member_nm){
		System.out.println(member_nm + "/member/member_view 요청");
		Member member = memberDao.getMember(member_nm);
		model.addAttribute("member", member);
		return "member/member_view";
	}

	// 입퇴실 검색 요청
		@RequestMapping(value="/member/member_exe", method = {RequestMethod.GET, RequestMethod.POST})
		public String MemberExe(Model model
				, @RequestParam("so") String so
				, @RequestParam("sv") String sv
				, HttpSession session){
			System.out.println("MemberController->MemberExe()" + so + sv);
			BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
			List<Member> memberexit = memberDao.exeMember(so, sv, branchOwner);
			System.out.println(memberexit);
			model.addAttribute("memberexit", memberexit);
			model.addAttribute("so", so);
			model.addAttribute("sv", sv);
			return "member/member_exe";
	}
	
	// 회원 검색 요청
	@RequestMapping(value="/member/member_search", method = {RequestMethod.GET, RequestMethod.POST})
	public String MemberSearch(Model model
			, @RequestParam("so") String so
			, @RequestParam("sv") String sv
			, HttpSession session){
		System.out.println("MemberController->MemberSearch()" + so + sv);
		BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
		List<Member> searchlist = memberDao.searchMember(so, sv, branchOwner);
		System.out.println(searchlist);
		model.addAttribute("searchlist", searchlist);
		model.addAttribute("so", so);
		model.addAttribute("sv", sv);
		return "member/member_search";
	}

	// 입퇴실 및 페이징 요청
			@RequestMapping(value="/member/member_exit", method = RequestMethod.GET)
			public String selectMemberExit(Model model
		            , @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
		            , HttpSession session) {
				System.out.println("member_exit 요청1");
				List<Member> memberexit = memberDao.exitMember();
				System.out.println("member_exit 요청1");
				
				System.out.println("member_exit 입퇴실 요청2");
				model.addAttribute("memberexit", memberexit);
				System.out.println("member_exit 요청1");
				
				System.out.println("member_exit 입퇴실 요청2");
				BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
				if(currentPage < 1){
					currentPage = 1;
		            }

				int joinCount = 0;
				joinCount = memberDao.exitMemberCount();

				int pagePerRow = 10;
				List<Member> list = memberDao.selectMemberExit(currentPage, pagePerRow, branchOwner);
				List<SeatTime> listExit = memberDao.listExit(currentPage, pagePerRow, branchOwner);	
				int lastPage = (int)(Math.ceil(joinCount / pagePerRow));
				if(joinCount%pagePerRow != 0) {
					lastPage++;
				}

				int countPage = 5;
				int startPage = ((currentPage - 1)/5)*5+1;
				int endPage = startPage + countPage-1;
				int nextPage = ((currentPage - 1)/5)*5+2;
				int previousPage = ((currentPage - 1)/5)*5-2+1;

				if(previousPage <= 0) {
					previousPage = 1;
				}

				if(endPage > lastPage) {
					previousPage = 1;
				}

				if(nextPage > lastPage) {
					nextPage = lastPage;
				}

				model.addAttribute("joinCount", joinCount);
				model.addAttribute("list", list);
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("nextPage", nextPage);
				model.addAttribute("previousPage", previousPage);
				model.addAttribute("lastPage", lastPage);
				model.addAttribute("listExit", listExit);
				
				System.out.println("member_exit1,2 요청완료");
				
				return "member/member_exit";
		}
	
	// 리스트 및 페이징 요청
	@RequestMapping(value="/member/member_list", method = RequestMethod.GET)
	public String selectMemberList(Model model
            , @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
            , HttpSession session) {
		System.out.println("/member/member_list 요청");
		BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
		if(currentPage < 1){
			currentPage = 1;
            }
		int joinCount = 0;
		joinCount = memberDao.selectMemberCount();
		int pagePerRow = 10;
		List<Member> list = memberDao.selectMemberList(currentPage, pagePerRow, branchOwner);
		int lastPage = (int)(Math.ceil(joinCount / pagePerRow));
		if(joinCount%pagePerRow != 0) {
			lastPage++;
		}

		int countPage = 5;
		int startPage = ((currentPage - 1)/5)*5+1;
		int endPage = startPage + countPage-1;
		int nextPage = ((currentPage - 1)/5)*5+2;
		int previousPage = ((currentPage - 1)/5)*5-2+1;

		if(previousPage <= 0) {
			previousPage = 1;
		}

		if(endPage > lastPage) {
			previousPage = 1;
		}

		if(nextPage > lastPage) {
			nextPage = lastPage;
		}

		model.addAttribute("joinCount", joinCount);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("previousPage", previousPage);
		model.addAttribute("lastPage", lastPage);

		return "member/member_list";
	}

	// 독서실 회원 코드 자동 증가 및 POST 요청
	@RequestMapping(value="/member/member_pro", method= RequestMethod.POST)
	public String MemberPro(Member member, HttpSession session) {
		System.out.println("회원코드 자동증가 폼");
		System.out.println(member);

		//코드 MAX select
		int code = memberDao.selectMemberCode();
		
		// 세선에서 사업자 코드 받기
		BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
		String branch_owner_cd = branchOwner.getBranch_owner_cd();
		
		if(code == 0){ 
			member.setMember_cd("member_cd1");
			memberDao.insertMember(member);

		} else {	
			int result = memberDao.autoMemberCode(member);
			System.out.println("값 :" + result);
			if(result == 1) {
				System.out.println("회원 등록 성공");
				
				//--------------------------------------------------------------------------------------
				// 가입시 해당 월 남자 가입자수 조회 
				InsertNumList insertNumList = memberDao.selectMonthInsertNumMen(branch_owner_cd);
				//System.out.println("MemberController-> MemberPro-> insertNumList: "+ insertNumList);
				// 사업자 코드로 해당 월 가입자 수 업데이트
				memberDao.modifyMonthInsertInfoMen(insertNumList);
				// 가입시 해당 월 여자 가입자수 조회 
				InsertNumList insertNumListW = memberDao.selectMonthInsertNumWoman(branch_owner_cd);
				//System.out.println("MemberController-> MemberPro-> insertNumListW: "+ insertNumListW);
				// 사업자 코드로 해당 월 가입자 수 업데이트
				memberDao.modifyMonthInsertInfoWoman(insertNumListW);
				
				//--------------------------------------------------------------------------------------
				// 가입시 연령대별 남자 이용회원 조회
				DashboardAgeGroup insertAgeGroupListM = memberDao.selectAgeGroupMen(branch_owner_cd);
				// 수정
				memberDao.modifyMenAgeGroupInfo(insertAgeGroupListM);
				// 가입시 연령대별 여자 이용회원 조회
				DashboardAgeGroup insertAgeGroupListW = memberDao.selectAgeGroupWoman(branch_owner_cd);
				// 수정
				memberDao.modifyWomanAgeGroupInfo(insertAgeGroupListW);
				
				return "redirect:/member/member_list";
			} else {
				System.out.println("회원 등록 실패");
			}
		}
		return "redirect:/member/member_list";
	}

	// 독서실 회원 코드 자동 증가 및 POST 요청 
	// 열람실 window창에서 필요한 내용이니 지우지 말 것
	@RequestMapping(value="/member/paymember_pro", method= RequestMethod.POST)
	public String PayMemberPro(Member member, HttpSession session) {
		System.out.println("회원코드 자동증가 폼pay");
		System.out.println(member);
		
		// 세선에서 사업자 코드 받기
		BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
		String branch_owner_cd = branchOwner.getBranch_owner_cd();

		//코드 MAX select
		int code = memberDao.selectMemberCode();

		if(code == 0){ 
			member.setMember_cd("member_cd1");
			memberDao.insertMember(member);

		} else {
			int result = memberDao.autoMemberCode(member);
			if(result == 1) {
				System.out.println("요금제 등록 성공pay");
				
				//--------------------------------------------------------------------------------------
				// 가입시 해당 월 남자 가입자수 조회 
				InsertNumList insertNumList = memberDao.selectMonthInsertNumMen(branch_owner_cd);
				//System.out.println("MemberController-> MemberPro-> insertNumList: "+ insertNumList);
				// 사업자 코드로 해당 월 가입자 수 업데이트
				memberDao.modifyMonthInsertInfoMen(insertNumList);
				// 가입시 해당 월 여자 가입자수 조회 
				InsertNumList insertNumListW = memberDao.selectMonthInsertNumWoman(branch_owner_cd);
				//System.out.println("MemberController-> MemberPro-> insertNumListW: "+ insertNumListW);
				// 사업자 코드로 해당 월 가입자 수 업데이트
				memberDao.modifyMonthInsertInfoWoman(insertNumListW);
				
				//--------------------------------------------------------------------------------------
				// 가입시 연령대별 남자 이용회원 조회
				DashboardAgeGroup insertAgeGroupListM = memberDao.selectAgeGroupMen(branch_owner_cd);
				// 수정
				memberDao.modifyMenAgeGroupInfo(insertAgeGroupListM);
				// 가입시 연령대별 여자 이용회원 조회
				DashboardAgeGroup insertAgeGroupListW = memberDao.selectAgeGroupWoman(branch_owner_cd);
				// 수정
				memberDao.modifyWomanAgeGroupInfo(insertAgeGroupListW);
				
				return "payment/memberend";
			} else {
				System.out.println("요금제 등록 실패");
			}
		}
		return "redirect:/payment/memberend";		
	}

	// 회원 등록 폼 요청
	@RequestMapping(value="/member/member_form", method = RequestMethod.GET)
	public String MemberForm(Model model) {
		System.out.println("member_form 요청");
		List<Member> memberlist = memberDao.selectMember();
		model.addAttribute("memberlist", memberlist);
		return "member/member_form";
	}
}