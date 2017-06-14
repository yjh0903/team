package com.monorella.srf.branch.room;

import java.util.ArrayList;
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
import com.monorella.srf.branch.dto.EndDateList;
import com.monorella.srf.branch.dto.PayList;
import com.monorella.srf.branch.dto.Room;
import com.monorella.srf.branch.dto.RoomDashBoard;
import com.monorella.srf.branch.dto.Seat;
import com.monorella.srf.branch.dto.SeatRowCol;

@Controller
public class RoomController {
	@Autowired
	private RoomDao roomDao;
	
	//기간 만료예정
	@RequestMapping(value="room/member_period", method = RequestMethod.GET)
	public String memberPeriod(@RequestParam(value="dateNum",required=false, defaultValue="1")int dateNum
								,  HttpSession session
								,  Model model){
		System.out.println("RoomController memberPeriod()");
		System.out.println("dateNum :" + dateNum);
		BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
		List<EndDateList> enddatelist = roomDao.selectMemberEndDate(branchOwner, dateNum);
		model.addAttribute("enddatelist", enddatelist);
		
		return "room/member_period";
	}
	
	//자리이동
	@RequestMapping(value="/room/move_pro", method = RequestMethod.POST)
	public String moveSeat(Seat seat){
		System.out.println("RoomController moveSeat() seat :" + seat);
		//이전 열람실 코드 구하기
		Seat beforeRoomCd = roomDao.selectRoomCdeqSeatCd(seat.getSeat_cd());
		System.out.println("beforeRoomCd :" + beforeRoomCd );
		//이동할 좌석코드 구하기(이전 seat 이후 seatcd)
		Seat seatcd = roomDao.selectSeatCd(seat);
		System.out.println("seatcd :" + seatcd);

		//자리이동 1단계
		int result = roomDao.modifyMoveSeat(seat, seatcd);
		System.out.println("자리이동 수정 1단계 성공" + result);
		//자리이동 2단계
		seatcd.setColseat_state(beforeRoomCd.getColseat_state());
		roomDao.modifySeatCdAfter(seatcd);

		//열람실 현황 modify
		RoomDashBoard beforeDash = roomDao.selectRoomDashBoard(beforeRoomCd.getRoom_cd());
		RoomDashBoard afterDash = roomDao.selectRoomDashBoard(seatcd.getRoom_cd());
		System.out.println("beforeDash" + beforeDash);
		System.out.println("afterDash" + afterDash);
		roomDao.modifyAllRoomDashBoard(beforeDash);
		roomDao.modifyAllRoomDashBoard(afterDash);
		return "room/move_success";
	}
	
	//열람실 별 미결제 열람석 조회
	@RequestMapping(value="/room/move_seat", method = RequestMethod.POST)
	public ResponseEntity<String> notpay_seat(Seat seat){
		System.out.println(seat);
		List<Seat> seatlist = roomDao.selectNotPaySeat(seat);
		System.out.println("seatlist : " + seatlist);
		//JSON
		JSONObject jsonMain = new JSONObject();
		for(int i=0; i<seatlist.size(); i++){
			jsonMain.put("cnumber"+i,seatlist.get(i).getSeat_cnumber());
		}
		System.out.println(jsonMain.toString());
		//HttpHeaders 
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
		return new ResponseEntity<String>(jsonMain.toString(), responseHeaders, HttpStatus.OK);
	}
	
	//회원 자리 이동 form
	@RequestMapping(value="/room/move_form", method = RequestMethod.GET)
	public String seat_move(Seat seat, Model model, HttpSession session){
		BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
		List<Room> roomlist = roomDao.selectRoom(branchOwner);
		System.out.println("seat_move() seat_cd :" + seat.getSeat_cd()); 
		model.addAttribute("roomlist", roomlist);
		model.addAttribute("seat_cd", seat.getSeat_cd());
		return "room/move_form";
	}
	
	//열람실 현황 보기
	@RequestMapping(value="/room/room_dashboard" , method = RequestMethod.GET)
	public String room_dashboard(Model model, HttpSession session){
		System.out.println("room_dashboard()");
		BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
		//열람실 현황테이블 조회
		List<RoomDashBoard> roomdashlist = roomDao.selectRoomDashBoardNow(branchOwner);
		//열람실 만료예정자 조회
		int dateNum = 1;
		List<EndDateList> enddatelist = roomDao.selectCountEndDate(branchOwner, dateNum);
		System.out.println(enddatelist);
		ArrayList<PayList> paylist = new ArrayList<PayList>();
		for(RoomDashBoard rl : roomdashlist){
			PayList pay = new PayList();
			//만석률 구하기
			double percentage = ((double)rl.getPay_seat()/rl.getTotal_seat())*100;
			int percent = (int)percentage;
			//자동증가
			pay.setRoom_nm(rl.getRoom_nm());
			pay.setPayment_percentage(percent);
			paylist.add(pay);
		}
		
		model.addAttribute("roomdashlist", roomdashlist);
		model.addAttribute("paylist", paylist);
		model.addAttribute("enddatelist", enddatelist);
		return "room/room_dashboard";
	}
	
	//열람실 배치도 상세보기
	@RequestMapping(value="/room/room_view" , method = RequestMethod.GET)
	public String room_view(Room room, Model model){
		System.out.println("room_view()");
		System.out.println(room);
		List<Seat> seatlist = roomDao.selectRoomSeat(room);
		System.out.println(seatlist.get(0).getSeat_row());
	
		model.addAttribute("seatlist", seatlist);
		model.addAttribute("room", room);
	
		return "room/room_view";
	}
	
	//열람실 배치도 등록
	@RequestMapping(value="/room/room_placement" , method = RequestMethod.POST)
	public String room_placement(SeatRowCol seatrowcol){
		System.out.println(seatrowcol);
		
		for(int i=0; i<seatrowcol.getRoom_cd().size(); i++){
			Seat seat = new Seat();
			seat.setRoom_cd(seatrowcol.getRoom_cd().get(i));
			seat.setSeat_cnumber(seatrowcol.getSeat_cnumber().get(i));
			seat.setSeat_col(seatrowcol.getSeat_left().get(i));
			seat.setSeat_row(seatrowcol.getSeat_top().get(i));
			System.out.println("번호 :" + seat.getSeat_cnumber() + ", col: " + seat.getSeat_col() + ", row : "+ seat.getSeat_row());
			roomDao.modifyRoomSeat(seat);
		}
		return "redirect:/room/room_main";
		
	/*	String[] seat_col = seatrowcol.getSeat_col().split(",");
		String[] seat_row = seatrowcol.getSeat_row().split(",");
		
	    for(String col : seat_col){
			System.out.println(col);
		}
		for(String row : seat_row){
			System.out.println(row);
		}
	
		for(int i=0; i<seatrowcol.getSeat_cnumber().size(); i++){
			Seat seat = new Seat();
			seat.setRoom_cd(seatrowcol.getRoom_cd().get(i));
			seat.setSeat_cnumber(seatrowcol.getSeat_cnumber().get(i));
			seat.setSeat_col(Integer.parseInt(seat_col[i+1]));
			seat.setSeat_row(Integer.parseInt(seat_row[i+1]));
			System.out.println("번호 :" + seat.getSeat_cnumber() +", row : "+ seat.getSeat_row() + ", col: " + seat.getSeat_col());
			roomDao.modifyRoomSeat(seat);
		}*/
		
	}
	
	
	//열람실 삭제
	@RequestMapping(value="/room/room_delete" , method = RequestMethod.GET)
	public String room_Delete(@RequestParam(value="room_cd", required=true) String room_cd){
		System.out.println("room_cd :" + room_cd);
		try{
			System.out.println("열람실 & 열람석 삭제");
			roomDao.deleteSeat(room_cd);
			roomDao.deleteRoom(room_cd);
			roomDao.deleteRoomDashBoard(room_cd);
		
			return "redirect:/room/room_form";
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/room/room_form";
	}
	
	//열람실 등록
	@RequestMapping(value="/room/room_pro", method = RequestMethod.POST)
	public String room_pro(Room room, Model model){
		System.out.println("room_pro 열람실 등록");
		//열랑실 코드 총 수 조회
		int roomcdCount = roomDao.selectCountRoomCd();
		//지점별 열람실 코드 조회
		int roomcd = roomDao.selectRoomCdBranch(room);
		System.out.println("roomcdCount" + roomcdCount);
		if(roomcdCount == 0){
			//열람실 최초 등록
			System.out.println("최초");
			room.setRoom_cd("room_cd1");
			roomDao.insertFristRoom(room);
		}else{
			//열람실 자동 등록
			System.out.println("자동");
			roomDao.insertRoom(room);
		}	
			System.out.println("열람실 등록 성공");
			//열람석 등록
			ArrayList<Seat> seatli = new ArrayList<Seat>();
			//열람석 총 수 만큼 반복문
			
			for(int i=0; i<room.getSeat_num(); i++){
				Seat seat = new Seat();
				seat.setBranch_owner_cd(room.getBranch_owner_cd());
				seat.setRoom_cd(room.getRoom_cd());
				//열람실 최초등록일 경우
				if(roomcd == 0){
					seat.setSeat_cnumber(i+1);
				}else{
					int cnumber = roomDao.selectMaxCnumber(room);
					seat.setSeat_cnumber(cnumber+1);
				}
				roomDao.insertSeat(seat);
				seatli.add(seat);
			}
			//열람실 현황 데이터 
			RoomDashBoard roomdash = new RoomDashBoard();
			//열람실 코드 조회
			String room_cd = roomDao.selectRoomCd();
			System.out.println("room_cd : " + room_cd);
			//열람실 현황 입력데이터 조회
			roomdash = roomDao.selectRoomDashBoard(room_cd);
			System.out.println(roomdash);
			//열람실 현황 입력 초기화
			roomDao.insertRoomDashBoard(roomdash);
			
			model.addAttribute("room", room);
			model.addAttribute("seat", seatli);
			return "room/chair_form";
	}
	
	//열람실 등록폼
   @RequestMapping(value="/room/room_form", method = RequestMethod.GET)
	public String room_form(Model model, HttpSession session){
	   	System.out.println("room_form 요청");	
	   	BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
		model.addAttribute("roomlist", roomDao.selectRoom(branchOwner));
		return "room/room_form";
	}
	//좌석등록
	@RequestMapping(value="/room/chair_form", method = RequestMethod.GET)
	public String chair_form() {
		System.out.println("chair_form 요청");
		return "room/chair_form";
	}
	//열람실 관리
	@RequestMapping(value="/room/room_main", method = RequestMethod.GET)
	public String room_main(Model model, HttpSession session){
		//세션 값 get 
		BranchOwner branchOwner = (BranchOwner)session.getAttribute("branchOwner");
		System.out.println("branchOwner :" + branchOwner.getBranch_owner_cd());
		
		List<Seat> seatlist = roomDao.selectSeat(branchOwner);
		model.addAttribute("roomlist", roomDao.selectRoom(branchOwner));
		model.addAttribute("seatlist", seatlist);
		return "room/room_main";
	}
}
