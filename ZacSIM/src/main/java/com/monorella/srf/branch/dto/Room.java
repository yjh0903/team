package com.monorella.srf.branch.dto;

public class Room {
	private String room_cd; //열람실 코드
	private String branch_owner_cd; //지점대표코드
	private String room_nm; //열람실명
	private int seat_num; //열람석 수
	private String room_division; //열람석 구분
	private int pay_seat; // 결제 좌석 수 
	private int notpay_seat; //비결제 좌석 수
	
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
	public String getRoom_nm() {
		return room_nm;
	}
	public void setRoom_nm(String room_nm) {
		this.room_nm = room_nm;
	}
	public int getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(int seat_num) {
		this.seat_num = seat_num;
	}
	public String getRoom_division() {
		return room_division;
	}
	public void setRoom_division(String room_division) {
		this.room_division = room_division;
	}
	public int getPay_seat() {
		return pay_seat;
	}
	public void setPay_seat(int pay_seat) {
		this.pay_seat = pay_seat;
	}
	public int getNotpay_seat() {
		return notpay_seat;
	}
	public void setNotpay_seat(int notpay_seat) {
		this.notpay_seat = notpay_seat;
	}
	
	@Override
	public String toString() {
		return "Room [room_cd=" + room_cd + ", branch_owner_cd=" + branch_owner_cd + ", room_nm=" + room_nm
				+ ", seat_num=" + seat_num + ", room_division=" + room_division + ", pay_seat=" + pay_seat
				+ ", notpay_seat=" + notpay_seat + "]";
	}
}
