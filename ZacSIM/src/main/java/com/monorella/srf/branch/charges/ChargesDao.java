package com.monorella.srf.branch.charges;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.monorella.srf.branch.dto.BranchOwner;
import com.monorella.srf.branch.dto.Charges;

@Repository
public class ChargesDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//요금제 code select
	public int selectChargesCode(){
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.charges.ChargesMapper.selectChargesCode");
	}

	//요금제 modify
	public int modifyCharges(Charges charges){
		return sqlSessionTemplate.update("com.monorella.srf.branch.charges.ChargesMapper.modifyCharges", charges);
	}
	
	//요금제 delete
	public int deleteCharges(String charges_code){
		return sqlSessionTemplate.delete("com.monorella.srf.branch.charges.ChargesMapper.deleteCharges", charges_code);
	}
	
	//요금제 select
	public List<Charges> selectCharges(BranchOwner branchOwner){
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.charges.ChargesMapper.selectCharges", branchOwner);
	}
	
	//요금제 자동등록
	public int insertAutoCharges(Charges charges){
		System.out.println("insertAutoCharges");
		return sqlSessionTemplate.insert("com.monorella.srf.branch.charges.ChargesMapper.insertAutoCharges", charges);
				
	}
	
	//요금제 등록
	public int insertCharges(Charges charges){
		System.out.println("insertCharge");                                                                                                                                                                                                                                                                                                                                        
		return sqlSessionTemplate.insert("com.monorella.srf.branch.charges.ChargesMapper.insertCharges", charges);
	}
}
