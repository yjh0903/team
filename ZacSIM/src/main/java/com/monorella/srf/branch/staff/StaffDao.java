package com.monorella.srf.branch.staff;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.monorella.srf.branch.dto.Staff;
@Repository
public class StaffDao {
	 @Autowired
	    private SqlSessionTemplate sqlSessionTemplate;
	
	 // 직원아이디와 직원패스워드를 입력받아 한개의 직원 삭제
	    public int deleteStaff(String staff_id, String staff_pw) {
	    	Staff staff = new Staff();
	    	staff.setStaff_id(staff_id);
	    	staff.setStaff_pw(staff_pw);
	        return sqlSessionTemplate.delete("com.monorella.srf.branch.staff.StaffMapper.deleteStaff",staff);
	    }
	
	// 글수정 메서드 
		public int modifyStaff(Staff staff) {
	        return sqlSessionTemplate.update("com.monorella.srf.branch.staff.StaffMapper.modifyStaff"
											,staff);
	    }
		
	 // 한개의 게시글 내용보기
	    public Staff getStaff(String staff_id) {
	        return sqlSessionTemplate.selectOne("com.monorella.srf.branch.staff.StaffMapper.getStaff",staff_id);
	    }
	 
	 
	 //직원 검색 메서드
	 public List<Staff> searchStaff(String so, String sv){
			Map<String, String> map = new HashMap<String, String>();
			map.put("so", so);
			map.put("sv", sv);
			List<Staff> staffList = null;
			staffList = sqlSessionTemplate.selectList("com.monorella.srf.branch.staff.StaffMapper.searchStaff", map);
			return staffList;
		}

	 // 직원 조회 메서드 
	 public List<Staff> getStaffList(String branch_owner_cd){
		return  sqlSessionTemplate.selectList("com.monorella.srf.branch.staff.StaffMapper.getStaffList",branch_owner_cd);
		 
	 }
	// 직원추가 메서드 
	    public int insertStaff(Staff staff) {
	       System.out.println("StaffDao-> insertStaff(): "+staff);
	        return sqlSessionTemplate.insert("com.monorella.srf.branch.staff.StaffMapper.insertStaff"
	        								, staff);
	    }
	    
}