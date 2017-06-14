package com.monorella.srf.branch.dto;

public class Seat {
	//`seat_cd`,  `room_cd`,  `branch_owner_cd`,  `member_cd`,  `seat_cnumber`,  `colseat_state`,  `seat_in_time`,  `seat_out_time`,  `seat_date`,  `seat_appoint`
	private int seat_cd; //열람석 코드
	private String room_cd; //열람실 코드
	private String branch_owner_cd; //지점대표자 코드
	private String member_cd; //회원 코드
	private String member_nm; //회원 이름
	private int	seat_cnumber; //열람석 번호
	private String colseat_state; //열람석 상태
	private String seat_in_time; //입실
	private String seat_out_time; //퇴실
	private String seat_date; //날짜
	private String seat_appoint; //열람석 지정(결제여부)
	private int seat_row; //열람석 행
	private int seat_col; //열람석 열
	private String member_end_date; //회원 기간 만료일;
	
	public String getMember_end_date() {
		return member_end_date;
	}
	public void setMember_end_date(String member_end_date) {
		this.member_end_date = member_end_date;
	}
	public int getSeat_row() {
		return seat_row;
	}
	public void setSeat_row(int seat_row) {
		this.seat_row = seat_row;
	}
	public int getSeat_col() {
		return seat_col;
	}
	public void setSeat_col(int seat_col) {
		this.seat_col = seat_col;
	}
	public int getSeat_cd() {
		return seat_cd;
	}
	public void setSeat_cd(int seat_cd) {
		this.seat_cd = seat_cd;
	}
	public String getRoom_cd() {
		return room_cd;
	}
	public void setRoom_cd(String room_cd) {
		this.room_cd = room_cd;
	}
	public String getBranch_owner_cd() {
		return branch_owner_cd;
	}
	public void setBranch_owner_cd(String branch_owner_cd) {
		this.branch_owner_cd = branch_owner_cd;
	}
	public String getMember_cd() {
		return member_cd;
	}
	public void setMember_cd(String member_cd) {
		this.member_cd = member_cd;
	}
	public String getMember_nm() {
		return member_nm;
	}
	public void setMember_nm(String member_nm) {
		this.member_nm = member_nm;
	}
	public int getSeat_cnumber() {
		return seat_cnumber;
	}
	public void setSeat_cnumber(int seat_cnumber) {
		this.seat_cnumber = seat_cnumber;
	}
	public String getColseat_state() {
		return colseat_state;
	}
	public void setColseat_state(String colseat_state) {
		this.colseat_state = colseat_state;
	}
	public String getSeat_in_time() {
		return seat_in_time;
	}
	public void setSeat_in_time(String seat_in_time) {
		this.seat_in_time = seat_in_time;
	}
	public String getSeat_out_time() {
		return seat_out_time;
	}
	public void setSeat_out_time(String seat_out_time) {
		this.seat_out_time = seat_out_time;
	}
	public String getSeat_date() {
		return seat_date;
	}
	public void setSeat_date(String seat_date) {
		this.seat_date = seat_date;
	}
	public String getSeat_appoint() {
		return seat_appoint;
	}
	public void setSeat_appoint(String seat_appoint) {
		this.seat_appoint = seat_appoint;
	}
	
	@Override
	public String toString() {
		return "Seat [seat_cd=" + seat_cd + ", room_cd=" + room_cd + ", branch_owner_cd=" + branch_owner_cd
				+ ", member_cd=" + member_cd + ", member_nm=" + member_nm + ", seat_cnumber=" + seat_cnumber
				+ ", colseat_state=" + colseat_state + ", seat_in_time=" + seat_in_time + ", seat_out_time="
				+ seat_out_time + ", seat_date=" + seat_date + ", seat_appoint=" + seat_appoint + ", seat_row="
				+ seat_row + ", seat_col=" + seat_col + ", member_end_date=" + member_end_date + "]";
	}
}
