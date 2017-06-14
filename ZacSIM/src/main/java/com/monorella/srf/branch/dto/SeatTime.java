package com.monorella.srf.branch.dto;

public class SeatTime {
	//`seat_time_code`,  `seat_cd`,  `member_cd`,  `seat_in_time`,  `seat_out_time`,  `seat_date`
	private int seat_time_cd; //입퇴실 일련번호
	private int seat_cd; //열람석 코드
	private String member_cd; //회원코드
	private String member_nm; //회원이름
	private String seat_in_time; //입실시간
	private String seat_out_time; //퇴실시간
	private String seat_date; //현재날짜

	public int getSeat_time_cd() {
		return seat_time_cd;
	}
	public void setSeat_time_cd(int seat_time_cd) {
		this.seat_time_cd = seat_time_cd;
	}
	public int getSeat_cd() {
		return seat_cd;
	}
	public void setSeat_cd(int seat_cd) {
		this.seat_cd = seat_cd;
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
	@Override
	public String toString() {
		return "SeatTime [seat_time_cd=" + seat_time_cd + ", seat_cd=" + seat_cd + ", member_cd=" + member_cd
				+ ", member_nm=" + member_nm + ", seat_in_time=" + seat_in_time + ", seat_out_time=" + seat_out_time
				+ ", seat_date=" + seat_date + "]";
	}

}
