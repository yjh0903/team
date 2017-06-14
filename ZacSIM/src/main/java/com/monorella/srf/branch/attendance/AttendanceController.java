package com.monorella.srf.branch.attendance;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.monorella.srf.branch.dto.Member;
import com.monorella.srf.branch.dto.RoomDashBoard;
import com.monorella.srf.branch.dto.Seat;
import com.monorella.srf.branch.dto.SeatTime;
import com.monorella.srf.branch.room.RoomDao;

@Controller
public class AttendanceController {
	@Autowired
	private AttendanceDao attendanceDao;
	@Autowired
	private RoomDao roomDao;
	
	//출결번호 입력 처리
	@RequestMapping(value="/attendance/attendance_pro", method=RequestMethod.POST)
	public ResponseEntity<String> attendance_pro(@RequestParam(value="inout_num", required=true) String inout_num
								,@RequestParam(value="now_date", required=true) String now_date){
		System.out.println("attendance_pro() inout_num :" + inout_num);
		System.out.println("attendance_pro() now_time :" + now_date );
		//출결번호 체크
		Member member = attendanceDao.selectInoutNum(inout_num);
		System.out.println("member :" + member);
		
		
		if(member.getMember_nm() != null){
			System.out.println("출결번호 체크 확인");
			//입실 여부 체크
			String seat_state = attendanceDao.selectSeatState(member);
			System.out.println("seat_state :" + seat_state);
			if(seat_state.equals("배치") || seat_state.equals("퇴실")){
				//member seat_state 변경
				seat_state = "입실";
				//입실시간 입력
				attendanceDao.insertSeatInTime(member);

			}else{
				//member seat_state 변경
				seat_state = "퇴실";
				SeatTime seattime = attendanceDao.selectSeatTimeCd(member, now_date);
				System.out.println(seattime);
				int result = attendanceDao.modifySeatOutTime(seattime);
				System.out.println("퇴실 시간 입력 결과 : " + result);
				if(result == 1){
					System.out.println("퇴실 시간 입력 성공");
				}
			}
			
			//좌석번호와 일치하는 열람실 코드 조회 
			Seat seatRoom = roomDao.selectRoomCdeqSeatCd(member.getSeat_cd());
			System.out.println("AttendanceController, room_cd :" + seatRoom);
			//열람실 현황 조회
			RoomDashBoard roomDashBoard = roomDao.selectRoomDashBoard(seatRoom.getRoom_cd());
			int in_count = roomDashBoard.getSeat_in(); //입실 수
			int out_count = roomDashBoard.getSeat_out(); //퇴실 수
			
			if(seat_state.equals("입실")){
				//입 퇴실 수 계산
				in_count += 1;
				if(out_count > 0){
					out_count -=1;
				}
				
			}else if(seat_state.equals("퇴실")){
				//입 퇴실 수 계산
				in_count -= 1;
				out_count += 1;
			}
			
			roomDashBoard.setSeat_in(in_count);
			roomDashBoard.setSeat_out(out_count);
			
			//입퇴실 수 수정
			roomDao.modifySeatRoomDashBoard(roomDashBoard);
			
			//입퇴실 수정
			attendanceDao.modifySeatState(seat_state, member);
			//입실시간 퇴실시간 초기화
			

			
			System.out.println("AttendanceController, roomDashBoard :" + roomDashBoard);
			roomDao.modifySeatRoomDashBoard(roomDashBoard);
			
			//입퇴실 여부 출력 JSON
			JSONObject jsonMain = new JSONObject(); 
			jsonMain.put("name", member.getMember_nm());
			jsonMain.put("status", seat_state);
			System.out.println(jsonMain.toString());
			//HttpHeaders 객체 생성
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
		    return new ResponseEntity<String>(jsonMain.toString(), responseHeaders, HttpStatus.OK);  	
		}
	    return null; 
	}
	
	//출결번호 입력 폼
	@RequestMapping(value="/attendance/attendance_form" , method=RequestMethod.GET)
	public String attendance_from(){
		System.out.println("attendance_from()");
		return "attendance/attendance_form";
	}
	//출결번호 입력 창
	@RequestMapping(value="/attendance/attendance_input" , method=RequestMethod.GET)
	public String attendance_input(){
		System.out.println("attendance_input()");
		return "attendance/attendance_input";
	}
}
