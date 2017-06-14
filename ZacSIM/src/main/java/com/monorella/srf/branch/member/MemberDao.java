package com.monorella.srf.branch.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.monorella.srf.branch.dto.BranchOwner;
import com.monorella.srf.branch.dto.DashboardAgeGroup;
import com.monorella.srf.branch.dto.InsertNumList;
import com.monorella.srf.branch.dto.Member;
import com.monorella.srf.branch.dto.SeatTime;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//------------------------------------------------------------------------------------------
	// 회원가입시 여자 연령대 수정
	public int modifyWomanAgeGroupInfo(DashboardAgeGroup dashboardAgeGroup){
		//System.out.println("MemberDao-> modifyWomanAgeGroupInfo()-> dashboardAgeGroup: "+dashboardAgeGroup);
		return sqlSessionTemplate.update("com.monorella.srf.branch.member.MemberMapper.modifyWomanAgeGroupInfo", dashboardAgeGroup);
	}
	// 회원가입시 남자 연령대 수정
	public int modifyMenAgeGroupInfo(DashboardAgeGroup dashboardAgeGroup){
		//System.out.println("MemberDao-> modifyMenAgeGroupInfo()-> dashboardAgeGroup: "+dashboardAgeGroup);
		return sqlSessionTemplate.update("com.monorella.srf.branch.member.MemberMapper.modifyMenAgeGroupInfo", dashboardAgeGroup);
	}
	// 회원가입시 여자 연령대 조회
	public DashboardAgeGroup selectAgeGroupWoman(String branch_owner_cd){
		//System.out.println("MemberDao-> selectAgeGroupWoman-> branch_owner_cd: "+ branch_owner_cd);
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.member.MemberMapper.selectAgeGroupWoman", branch_owner_cd);
	}
	// 회원가입시 남자 연령대 조회
	public DashboardAgeGroup selectAgeGroupMen(String branch_owner_cd){
		//System.out.println("MemberDao-> selectAgeGroupMen-> branch_owner_cd: "+ branch_owner_cd);
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.member.MemberMapper.selectAgeGroupMen", branch_owner_cd);
	}
	
	//----------------------------------------------------------
	// 회원 가입시 월별 여자 가입자수 업데이트
	public int modifyMonthInsertInfoWoman(InsertNumList insertNumListW){
		//System.out.println("MemberDao-> modifyMonthInsertInfoWoman()-> insertNumListW: "+insertNumListW);
		return sqlSessionTemplate.update("com.monorella.srf.branch.member.MemberMapper.modifyMonthInsertInfoWoman", insertNumListW);
	}
	
	// 회원 가입시 월별 남자 가입자수 업데이트
	public int modifyMonthInsertInfoMen(InsertNumList insertNumList){
		//System.out.println("MemberDao-> modifyMonthInsertInfoMen()-> insertNum: "+insertNumList);
		return sqlSessionTemplate.update("com.monorella.srf.branch.member.MemberMapper.modifyMonthInsertInfoMen", insertNumList);
	}
	
	// 회원 등록시 월별 여자 가입자수 조회
	public InsertNumList selectMonthInsertNumWoman(String branch_owner_cd){
		//System.out.println("MemberDao-> monthInsertNum()-> branch_owner_cd: "+branch_owner_cd);
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.member.MemberMapper.selectMonthInsertNumWoman", branch_owner_cd);
	}
	
	// 회원 등록시 월별 남자 가입자수 조회
	public InsertNumList selectMonthInsertNumMen(String branch_owner_cd){
		//System.out.println("MemberDao-> monthInsertNum()-> branch_owner_cd: "+branch_owner_cd);
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.member.MemberMapper.selectMonthInsertNumMen", branch_owner_cd);
	}
	
	
	// 회원삭제 메서드
    public int removeMember(String member_cd, String branch_owner_cd) {
    	Member member = new Member();
    	member.setMember_cd(member_cd);
    	member.setBranch_owner_cd(branch_owner_cd);
    	System.out.println("10st removeMember");
        return sqlSessionTemplate.delete("com.monorella.srf.branch.member.MemberMapper.MemberRemove", member);
    }
	
	//회원수정 메서드
	public int modifyMember(Member member) {
		System.out.println("9st modifyMember");
		return sqlSessionTemplate.update("com.monorella.srf.branch.member.MemberMapper.MemberModify", member);
	}

	// 하나의 입퇴실 회원 보기
	public Member getMeberView(String member_nm){
		System.out.println("MemberDao->getMeberView->"+member_nm);
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.member.MemberMapper.getMeberView",member_nm);
	}
	//하나의 입퇴실 보기
		public List<SeatTime> getExit(String member_nm) {
			System.out.println("8st getExit");
	        return sqlSessionTemplate.selectList("com.monorella.srf.branch.member.MemberMapper.getExit", member_nm);
	}
	
	//하나의 회원 보기
	public Member getMember(String member_nm) {
		System.out.println("8st getMember");
        return sqlSessionTemplate.selectOne("com.monorella.srf.branch.member.MemberMapper.getMember", member_nm);
    }
	
	// 입퇴실 내역검색 메서드
		public List<Member> exeMember(String so, String sv, BranchOwner branchOwner){
			Map<String, String> map = new HashMap<String, String>();
			map.put("so", so);
			map.put("sv", sv);
			map.put("branch_owner_cd", branchOwner.getBranch_owner_cd());
			System.out.println("7st exelist");
			return sqlSessionTemplate.selectList("com.monorella.srf.branch.member.MemberMapper.exeMember", map);
			 
		}
	/*
	// 입퇴실 회원검색 메서드
	public List<Member> exeMember(String so, String sv){
		Map<String, String> map = new HashMap<String, String>();
		map.put("so", so);
		map.put("sv", sv);
		List<Member> memberexit = null;
		System.out.println("7st exeMember");
		memberexit = sqlSessionTemplate.selectList("com.monorella.srf.branch.member.MemberMapper.exeMember", map);
		return memberexit;
	}*/
	
	// 회원검색 메서드
	public List<Member> searchMember(String so, String sv, BranchOwner branchOwner){
		Map<String, String> map = new HashMap<String, String>();
		map.put("so", so);
		map.put("sv", sv);
		map.put("branch_owner_cd", branchOwner.getBranch_owner_cd());
		List<Member> memberList = null;
		System.out.println("7st searchMember");
		memberList = sqlSessionTemplate.selectList("com.monorella.srf.branch.member.MemberMapper.searchMember", map);
		return memberList;
	}

	// 입퇴실 리스트 메서드
	public List<SeatTime> listExit(int currentPage, int pagePerRow, BranchOwner branchOwner) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", (currentPage-1)*pagePerRow);
		map.put("pagePerRow", pagePerRow);
		map.put("branch_owner_cd", branchOwner.getBranch_owner_cd());
		System.out.println("6st listExit");
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.member.MemberMapper.exitList", map);
	}

	// 입퇴실 회원 리스트 메서드
	public List<Member> selectMemberExit(int currentPage, int pagePerRow, BranchOwner branchOwner) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", (currentPage-1)*pagePerRow);
		map.put("pagePerRow", pagePerRow);
		map.put("branch_owner_cd", branchOwner.getBranch_owner_cd());
		System.out.println("6st selectMemberExit");
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.member.MemberMapper.selectMemberExit", map);
	}

	// 회원리스트 메서드
	public List<Member> selectMemberList(int currentPage, int pagePerRow, BranchOwner branchOwner ) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", (currentPage-1)*pagePerRow);
		map.put("pagePerRow", pagePerRow);
		map.put("branch_owner_cd", branchOwner.getBranch_owner_cd());
		System.out.println("6st selectMemberList");
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.member.MemberMapper.selectMemberList", map);
	}

	// 입퇴실 select
	public List<SeatTime> Exit() {
		System.out.println("5st Exit");
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.member.MemberMapper.exitList");
	}
	
	// 입퇴실회원 select
	public List<Member> exitMember() {
		System.out.println("5st exitMember");
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.member.MemberMapper.exitMember");
	}
	
	// 회원 select
	public List<Member> selectMember() {
		System.out.println("5st selectMember");
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.member.MemberMapper.selectMember");
	}
	
	// 입퇴실 count
	public int exitMemberCount() {
		int row = sqlSessionTemplate.selectOne("com.monorella.srf.branch.member.MemberMapper.exitMemberCount");
		System.out.println("4st exitMemberCount");
		return row;
	}
	
	// 회원 count
	public int selectMemberCount() {
		int row = sqlSessionTemplate.selectOne("com.monorella.srf.branch.member.MemberMapper.selectMemberCount");
		System.out.println("4st selectMemberCount");
		return row;
	}

	// 입퇴실 code select
	public int exitMemberCode() {
		System.out.println("3st exitMemberCode");
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.member.MemberMapper.exitMemberCode");
	}
	
	// 회원 code select
	public int selectMemberCode() {
		System.out.println("3st selectMemberCode");
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.member.MemberMapper.selectMemberCode");
	}
	
	//회원코드 자동증가 메서드
	public int autoMemberCode(Member member){
		System.out.println("2st autoMemberCode");
		return sqlSessionTemplate.insert("com.monorella.srf.branch.member.MemberMapper.autoMemberCode", member);
	}
	
	// 회원추가 메서드
	public int insertMember(Member member) {
		System.out.println("1st insertMember");
		return sqlSessionTemplate.insert("com.monorella.srf.branch.member.MemberMapper.insertMember", member);
	}
}