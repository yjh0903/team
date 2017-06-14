package com.monorella.srf.branch.scheduler;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.monorella.srf.branch.dto.Member;

@Repository
public class SchedulerDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	//만료일 지난 회원 수정
	public int modifyEndDateMember(String member_cd){
		return sqlSessionTemplate.update("com.monorella.srf.branch.scheduler.SchedulerMapper.modifyEndDateMember", member_cd);
	}
	
	//만료일 지난 회원 조회
	public List<Member> selectEndDate(){
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.scheduler.SchedulerMapper.selectEndDate");
	}
}
