package com.monorella.srf.branch.room;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.monorella.srf.branch.dto.BranchOwner;
import com.monorella.srf.branch.dto.EndDateList;
import com.monorella.srf.branch.dto.Room;
import com.monorella.srf.branch.dto.RoomDashBoard;
import com.monorella.srf.branch.dto.Seat;

@Repository
public class RoomDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//만료예정자 조회
	public List<EndDateList> selectMemberEndDate(BranchOwner branchOwner, int dateNum){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("branch_owner_cd", branchOwner.getBranch_owner_cd());
		map.put("dateNum", dateNum);
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.room.RoomMapper.selectMemberEndDate", map);
	}
	
	//열람실별 만료예정자 수 전체조회
	public List<EndDateList> selectCountEndDate(BranchOwner branchOwner, int dateNum){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("branch_owner_cd", branchOwner.getBranch_owner_cd());
		map.put("dateNum", dateNum);
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.room.RoomMapper.selectCountEndDate", map);
	}
	
	//열람석 MAX 번호 조회
	public int selectMaxCnumber(Room room){
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.room.RoomMapper.selectMaxCnumber", room);
	}
	
	//자리이동(이동후 좌석 지정 Y)
	public int modifySeatCdAfter(Seat seatcd){
		return sqlSessionTemplate.update("com.monorella.srf.branch.room.RoomMapper.modifySeatCdAfter", seatcd);
	}
	
	//자리이동(이동전 좌석 지정 N, 회원 seat_cd 변경)
	public int modifyMoveSeat(Seat seat, Seat seatcd){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seatcd_before", seat.getSeat_cd());
		map.put("seatcd_after", seatcd.getSeat_cd());
		return sqlSessionTemplate.update("com.monorella.srf.branch.room.RoomMapper.modifyMoveSeat", map);
	}
	
	//열람석 코드 조회
	public Seat selectSeatCd(Seat seat){
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.room.RoomMapper.selectSeatCd", seat);
	}
	
	//열람실 별 미결제 좌석 조회
	public List<Seat> selectNotPaySeat(Seat seat){
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.room.RoomMapper.selectNotPaySeat", seat);
	}
	
	//열람석 code 전체 조회 
	public List<Room> selectRoomAllCd(){
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.room.RoomMapper.selectRoomAllCd");
	}
	
	//열람석 code에 일치하는 열람실 Code 조회
	public Seat selectRoomCdeqSeatCd(int seat_cd){
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.room.RoomMapper.selectRoomCdeqSeatCd", seat_cd);
	}
	//열람실 현황 allmodify
	public int modifyAllRoomDashBoard(RoomDashBoard roomDashBoard){
		return sqlSessionTemplate.update("com.monorella.srf.branch.room.RoomMapper.modifyAllRoomDashBoard", roomDashBoard);
	}
	
	//열람실 입실 현황 modify
	public int modifySeatRoomDashBoard(RoomDashBoard roomDashBoard){
		return sqlSessionTemplate.update("com.monorella.srf.branch.room.RoomMapper.modifySeatRoomDashBoard", roomDashBoard);
	}
	
	//열람실 결제& 미결제 현황  modify
	public int modifyRoomDashBoard(RoomDashBoard roomDashboard){
		return sqlSessionTemplate.update("com.monorella.srf.branch.room.RoomMapper.modifyRoomDashBoard", roomDashboard);
	}
	
	//열람실 현황 조회
	public List<RoomDashBoard> selectRoomDashBoardNow(BranchOwner branchOwner){
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.room.RoomMapper.selctRoomDashBoardNow", branchOwner);
	}
	
	//열람실 현황 입력데이터 조회
	public RoomDashBoard selectRoomDashBoard(String room_cd){
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.room.RoomMapper.selectRoomDashBoard", room_cd);
	}
	
	//지점별 열람실 코드 조회
	public int selectRoomCdBranch(Room room){
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.room.RoomMapper.selectRoomCdBranch", room);
	}
	
	//열람실 코드 전체 조회
	public List<Room> selectRoomCdAll(){
		return sqlSessionTemplate.selectList("");
	}
	
	//열람실 코드 조회
	public String selectRoomCd(){
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.room.RoomMapper.selectRoomCd");
	}
	
	//열람실별 열람석 조회
	public List<Seat> selectRoomSeat(Room room){
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.room.RoomMapper.selectRoomSeat", room);
	}
	
	//열람실 열람석 배치
	public int modifyRoomSeat(Seat seat){
		System.out.println("modifyRoomSeat()");
		return sqlSessionTemplate.update("com.monorella.srf.branch.room.RoomMapper.modifyRoomSeat", seat);
	}
	//열람실 현황 삭제
	public int deleteRoomDashBoard(String room_cd){
		return sqlSessionTemplate.delete("com.monorella.srf.branch.room.RoomMapper.deleteRoomDashBoard", room_cd);
	}
	
	//열람석 삭제
	public int deleteSeat(String room_cd){
		System.out.println("deleteSeat()");
		return sqlSessionTemplate.delete("com.monorella.srf.branch.room.RoomMapper.deleteSeat", room_cd);
	}
	
	//열람실 삭제
	public int deleteRoom(String room_cd){
		System.out.println("deleteRoom()");
		return sqlSessionTemplate.delete("com.monorella.srf.branch.room.RoomMapper.deleteRoom", room_cd);
	}
	
	//열람석 select
	public List<Seat> selectSeat(BranchOwner branchOwner){
		System.out.println("selectSeat()");
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.room.RoomMapper.selectSeat", branchOwner);
	}
	
	//열람실 select
	public List<Room> selectRoom(BranchOwner branchOwner){
		System.out.println("selectRoom()");
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.room.RoomMapper.selectRoom", branchOwner);
	}
	
	//열람실 현황 insert
	public int insertRoomDashBoard(RoomDashBoard roomdash){
		return sqlSessionTemplate.insert("com.monorella.srf.branch.room.RoomMapper.insertRoomDashBoard", roomdash);
	}
	
	//열람석 insert
	public int insertSeat(Seat seat){
		return sqlSessionTemplate.insert("com.monorella.srf.branch.room.RoomMapper.insertSeat", seat);
	}
	
	//열람실 insert
	public int insertRoom(Room room){
		System.out.println(room);
		return sqlSessionTemplate.insert("com.monorella.srf.branch.room.RoomMapper.insertRoom", room);
	}
	
	//열람실 최초 insert
	public int insertFristRoom(Room room){
		return sqlSessionTemplate.insert("com.monorella.srf.branch.room.RoomMapper.insertFristRoom", room);
	}
	
	//열람실 총코드수 select
	public int selectCountRoomCd(){
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.room.RoomMapper.selectCountRoomCd");
	}
}
