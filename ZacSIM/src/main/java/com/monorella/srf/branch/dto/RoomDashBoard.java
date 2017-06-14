package com.monorella.srf.branch.dto;

public class RoomDashBoard {
	private	int room_dash_cd; //열람실 현황 코드
	private	String room_cd; //열람실 코드
	private	int seat_in; //입실 수
	private	int seat_out; //퇴실 수 
	private	int pay_seat; // 결제 열람석 수
	private	int notpay_seat; // 미결제 열람석 수
	private int total_seat; //총 열람석 수 
	private	int room_out; //만료예정 수
	private	int room_personnel; //총원 수 
	private String room_nm; //열람실 이름
	
	public int getTotal_seat() {
		return total_seat;
	}
	public void setTotal_seat(int total_seat) {
		this.total_seat = total_seat;
	}
	public String getRoom_nm() {
		return room_nm;
	}
	public void setRoom_nm(String room_nm) {
		this.room_nm = room_nm;
	}
	public int getRoom_dash_cd() {
		return room_dash_cd;
	}
	public void setRoom_dash_cd(int room_dash_cd) {
		this.room_dash_cd = room_dash_cd;
	}
	public String getRoom_cd() {
		return room_cd;
	}
	public void setRoom_cd(String room_cd) {
		this.room_cd = room_cd;
	}
	public int getSeat_in() {
		return seat_in;
	}
	public void setSeat_in(int seat_in) {
		this.seat_in = seat_in;
	}
	public int getSeat_out() {
		return seat_out;
	}
	public void setSeat_out(int seat_out) {
		this.seat_out = seat_out;
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
	public int getRoom_out() {
		return room_out;
	}
	public void setRoom_out(int room_out) {
		this.room_out = room_out;
	}
	public int getRoom_personnel() {
		return room_personnel;
	}
	public void setRoom_personnel(int room_personnel) {
		this.room_personnel = room_personnel;
	}
	@Override
	public String toString() {
		return "RoomDashBoard [room_dash_cd=" + room_dash_cd + ", room_cd=" + room_cd + ", seat_in=" + seat_in
				+ ", seat_out=" + seat_out + ", pay_seat=" + pay_seat + ", notpay_seat=" + notpay_seat + ", room_out="
				+ room_out + ", room_personnel=" + room_personnel + ", room_nm=" + room_nm + "]";
	}
	
	
	
	
}
