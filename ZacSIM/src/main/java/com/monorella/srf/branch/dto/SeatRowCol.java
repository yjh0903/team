package com.monorella.srf.branch.dto;

import java.util.List;

public class SeatRowCol {
	private List<String> room_cd;
	private List<Integer> seat_cnumber; // 열람석 번호
	private List<Integer> seat_left; // 열람석 left 좌표
	private List<Integer> seat_top; // 열람석 top 좌표
	public List<String> getRoom_cd() {
		return room_cd;
	}
	public void setRoom_cd(List<String> room_cd) {
		this.room_cd = room_cd;
	}
	public List<Integer> getSeat_cnumber() {
		return seat_cnumber;
	}
	public void setSeat_cnumber(List<Integer> seat_cnumber) {
		this.seat_cnumber = seat_cnumber;
	}
	public List<Integer> getSeat_left() {
		return seat_left;
	}
	public void setSeat_left(List<Integer> seat_left) {
		this.seat_left = seat_left;
	}
	public List<Integer> getSeat_top() {
		return seat_top;
	}
	public void setSeat_top(List<Integer> seat_top) {
		this.seat_top = seat_top;
	}
	
	@Override
	public String toString() {
		return "SeatRowCol [room_cd=" + room_cd + ", seat_cnumber=" + seat_cnumber + ", seat_left=" + seat_left
				+ ", seat_top=" + seat_top + "]";
	}
	
}
