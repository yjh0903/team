package com.monorella.srf.branch.attendance;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.monorella.srf.branch.dto.Member;
import com.monorella.srf.branch.dto.SeatTime;

@Controller
public class AttendanceDao {

	@Autowired 
	private SqlSessionTemplate sqlSessionTemplate;
	
	//퇴실 시간 입력
	public int modifySeatOutTime(SeatTime seattime){
		return sqlSessionTemplate.update("com.monorella.srf.branch.attendance.AttendanceMapper.modifySeatOutTime",seattime);
	}
	
	//입퇴실 테이블 한명의 정보 select
	public SeatTime selectSeatTimeCd(Member member, String now_date){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_cd", member.getMember_cd());
		map.put("now_date", now_date);
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.attendance.AttendanceMapper.selectSeatTimeCd", map);
	}
	
	//입실 시간 insert
	public int insertSeatInTime(Member member){
		return sqlSessionTemplate.insert("com.monorella.srf.branch.attendance.AttendanceMapper.insertSeatinTime", member);
	}
	
	//입퇴실 수정
	public int modifySeatState(String seat_state, Member member){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seat_state", seat_state);
		map.put("seat_cd", member.getSeat_cd());
		return sqlSessionTemplate.update("com.monorella.srf.branch.attendance.AttendanceMapper.modifySeatState", map);
	}
	
	//열람석 입퇴실 여부 조회
	public String selectSeatState(Member member){
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.attendance.AttendanceMapper.selectSeatState", member);
	}
	
	//출결번호 조회
	public Member selectInoutNum(String inout_num){
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.attendance.AttendanceMapper.selectInoutNum", inout_num);
	}

}
