package com.monorella.srf.head.branchOwner;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.monorella.srf.head.dto.HeadBranchOwner;

@Repository
public class HeadBranchOwnerDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate; 
	

	// 사업자 삭제시 brunch_dashboard_account_list 테이블 레코드 삭제
	public int deleteAccountList(String branch_owner_cd){
		//System.out.println("HeadBranchOwnerDao-> deleteAgeGroupList-> branch_owner_cd: "+ branch_owner_cd);
		return sqlSessionTemplate.delete("com.monorella.srf.head.branchOwner.HeadBranchOwnerMapper.deleteAccountList", branch_owner_cd);
	}
	// 사업자 등록시 brunch_dashboard_account_list 테이블에 레코드 생성
	public int insertAccountList(String branch_owner_cd){
		//System.out.println("HeadBranchOwnerDao-> insertAccountList-> branch_owner_cd: "+ branch_owner_cd);
		return sqlSessionTemplate.delete("com.monorella.srf.head.branchOwner.HeadBranchOwnerMapper.insertAccountList", branch_owner_cd);
	}
	
	
	// 지점현황 리스트 메서드 
	public List<HeadBranchOwner> selectPresentList(){
		//System.out.println("HeadBranchOwnerDao->selectPresentList");
		return sqlSessionTemplate.selectList("com.monorella.srf.head.branchOwner.HeadBranchOwnerMapper.selectPresentList");	
	}
	
	// 사업자 삭제시 insert_num_list 테이블에 해당 branch_owner_cd와 관련딘 레코드 삭제
	public int deleteAgeGroupList(String branch_owner_cd){
		//System.out.println("HeadBranchOwnerDao-> deleteAgeGroupList-> branch_owner_cd: "+ branch_owner_cd);
		return sqlSessionTemplate.delete("com.monorella.srf.head.branchOwner.HeadBranchOwnerMapper.deleteAgeGroupList", branch_owner_cd);
	}
	
	// 사업자 등록시 branch_dashboard_age_group 테이블에 branch_owner_cd 및 member_sex 값을 가진 레코드 생성
	public int insertAgeGroupList(String branch_owner_cd){
		//System.out.println("HeadBranchOwnerDao-> insertAgeGroupList-> branch_owner_cd: "+ branch_owner_cd);
		return sqlSessionTemplate.insert("com.monorella.srf.head.branchOwner.HeadBranchOwnerMapper.insertAgeGroupList", branch_owner_cd);
	}
	
	// 사업자 삭제시 insert_num_list 테이블에 해당 branch_owner_cd와 관련딘 레코드 삭제
	public int deleteNumList(String branch_owner_cd){
		//System.out.println("HeadBranchOwnerDao-> deleteNumList-> branch_owner_cd: "+ branch_owner_cd);
		return sqlSessionTemplate.delete("com.monorella.srf.head.branchOwner.HeadBranchOwnerMapper.deleteNumList", branch_owner_cd);
	}
	
	// 사업자 등록시 insert_num_list 테이블에 branch_owner_cd 및 member_sex 값을 가진 레코드 생성
	public int insertNumList(String branch_owner_cd){
		//System.out.println("HeadBranchOwnerDao-> insertNumList-> branch_owner_cd: "+ branch_owner_cd);
		return sqlSessionTemplate.insert("com.monorella.srf.head.branchOwner.HeadBranchOwnerMapper.insertNumList", branch_owner_cd);
	}

	//사업자 정보 삭제 처리
	public int deleteBranchOwner(String branch_owner_cd){
		//System.out.println("BranchOwnerDao-> deleteBranchOwner()-> branchOwner: "+branch_owner_cd);
		return sqlSessionTemplate.delete("com.monorella.srf.head.branchOwner.HeadBranchOwnerMapper.deleteBranchOwner", branch_owner_cd);
	}
	
	//사업자 정보 수정 처리
	public int modifyBranchOwner(HeadBranchOwner branchOwner){
		//System.out.println("BranchOwnerDao-> ModifyBranchOwner()-> branchOwner: "+branchOwner);
		return sqlSessionTemplate.update("com.monorella.srf.head.branchOwner.HeadBranchOwnerMapper.modifyBranchOwner", branchOwner);
	}
	
	//사업자 정보 단일 조회
	public HeadBranchOwner selectOneBranchOwner(String branch_owner_cd){
		//System.out.println("BranchOwnerDao-> selectOneBranchOwner()-> branch_owner_cd: "+branch_owner_cd);
		return sqlSessionTemplate.selectOne("com.monorella.srf.head.branchOwner.HeadBranchOwnerMapper.selectOneBranchOwner", branch_owner_cd);
	}
	
	//사업자 목록
	public List<HeadBranchOwner> selectBranchOwnerList(){
		//System.out.println("BranchOwnerDao-> selectBranchOwnerList()");
		return sqlSessionTemplate.selectList("com.monorella.srf.head.branchOwner.HeadBranchOwnerMapper.selectBranchOwnerList");
	}
	
	//사업자 등록
	public int insertBranchOwner(HeadBranchOwner branchOwner){
		//System.out.println("BranchOwnerDao-> insertBranchOwner-> branchOwner: "+branchOwner);
		return sqlSessionTemplate.insert("com.monorella.srf.head.branchOwner.HeadBranchOwnerMapper.insertBranchOwner", branchOwner);
	}
}
