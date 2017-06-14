package com.monorella.srf.head.branchOwner;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.monorella.srf.head.dto.HeadBranchOwner;

@Controller
public class HeadBranchOwnerController {
	
	@Autowired
	HeadBranchOwnerDao headBranchOwnerDao;
	

	// 지점 현황
	@RequestMapping(value="/head/branch/branch_present", method = RequestMethod.GET)
	public String selectpresentList(Model model){
		//System.out.println("HeadBranchOwnerController-> selectpresentList()");	
		List<HeadBranchOwner> list = headBranchOwnerDao.selectPresentList();
		model.addAttribute("list", list);
		return "/head/branch/branch_present";		
	}
	
	//사업자 정보 삭제
	@RequestMapping(value="/head/branch_owner_delete_pro" , method = RequestMethod.GET)
	public String deleteBranchOwner(@RequestParam(value="branch_owner_cd") String branch_owner_cd){
		//System.out.println("HeadBranchOwnerController-> deleteBranchOwner()-> branch_owner_cd: "+branch_owner_cd);
		int result = headBranchOwnerDao.deleteBranchOwner(branch_owner_cd);
		//System.out.println("HeadBranchOwnerController->deleteBranchOwner()-> result: "+result);
		if(result==1){
			// 사업자 삭제시 insert_num_list 테이블에 해당 branch_owner_cd와 관련딘 레코드 삭제
			headBranchOwnerDao.deleteNumList(branch_owner_cd);
			// 연령대 테이블 레코드 삭제
			headBranchOwnerDao.deleteAgeGroupList(branch_owner_cd);
			// 회계 테이블 레코드 삭제
			headBranchOwnerDao.deleteAccountList(branch_owner_cd);
		}
		return "redirect:/head/branch_owner/branch_owner_list";
	}
	
	//사업자 정보 수정 처리
	@RequestMapping(value="/head/branch_owner_modify_pro" , method = RequestMethod.POST)
	public String modifyBranchOwner(HeadBranchOwner branchOwner, Model model){
		//System.out.println("HeadBranchOwnerController-> ModifyBranchOwner()-> branchOwner: "+branchOwner);
		headBranchOwnerDao.modifyBranchOwner(branchOwner);
		return "redirect:/head/branch_owner/branch_owner_modify?branch_owner_cd="+branchOwner.getBranch_owner_cd();
	}
	
	//사업자 정보 수정 폼, 단일 사업자 정보 조회
	@RequestMapping(value="/head/branch_owner/branch_owner_modify" , method = RequestMethod.GET)
	public String selectOneBranchOwner(@RequestParam(value="branch_owner_cd") String branch_owner_cd, Model model){
		//System.out.println("HeadBranchOwnerController-> SelectOneBranchOwner()-> owner_num: "+owner_num);
		HeadBranchOwner info = headBranchOwnerDao.selectOneBranchOwner(branch_owner_cd);
		//System.out.println("HeadBranchOwnerController-> SelectOneBranchOwner()-> info: "+info);
		model.addAttribute("info", info);
		return "/head/branch_owner/branch_owner_modify";
	}
	
	//사업자 목록
	@RequestMapping(value="/head/branch_owner/branch_owner_list" , method = RequestMethod.GET)
	public String selectBranchOwnerList(Model model){
		//System.out.println("HeadBranchOwnerController-> selectBranchOwnerList()");
		List<HeadBranchOwner> ownerList = headBranchOwnerDao.selectBranchOwnerList(); //이용중 회원 목록
		model.addAttribute("ownerList", ownerList);
		return "/head/branch_owner/branch_owner_list";
	}
	
	//사업자 등록 요청
	@RequestMapping(value="/head/branch_owner_insert_pro", method=RequestMethod.POST)
	public String insertBranchOwner(HeadBranchOwner branchOwner){
		//System.out.println("HeadBranchOwnerController-> insertBranchOwner()-> BranchOwner: "+branchOwner.toString());
		int result = headBranchOwnerDao.insertBranchOwner(branchOwner);
		if(result==1){
			//사업자 등록시 insert_num_list 테이블에 branch_owner_cd 및 member_sex 값을 가진 레코드 두 줄 생성
			headBranchOwnerDao.insertNumList(branchOwner.getBranch_owner_cd());	
			// 연령대 테이블에 레코드 추가
			headBranchOwnerDao.insertAgeGroupList(branchOwner.getBranch_owner_cd());
			// 회계 테이블에 레코드 추가
			headBranchOwnerDao.insertAccountList(branchOwner.getBranch_owner_cd());
		}
		return "redirect:/head/branch_owner/branch_owner_list";
	}
	
	//사업자 등록 폼 요청
	@RequestMapping(value="/head/branch_owner/branch_owner_insert", method=RequestMethod.GET)
	public String branchOwnerForm(){
		//System.out.println("HeadBranchOwnerController-> branchOwnerForm()");
		return "/head/branch_owner/branch_owner_insert";
	}
}
