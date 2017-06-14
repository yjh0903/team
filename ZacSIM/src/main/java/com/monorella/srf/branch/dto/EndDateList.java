package com.monorella.srf.branch.dto;

//기간 만료 예정자
public class EndDateList {
	private String member_cd;
	private String seat_cd;
	private String member_nm;
	private String member_end_date;
	private int seat_cnumber;
	private String room_cd;
	private String room_nm;
	private int member_count;
	private int member_percentage;
	private int paynumber;
	private String member_tel;
	
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public int getPaynumber() {
		return paynumber;
	}
	public void setPaynumber(int paynumber) {
		this.paynumber = paynumber;
	}
	public int getMember_percentage() {
		return member_percentage;
	}
	public void setMember_percentage(int member_percentage) {
		this.member_percentage = member_percentage;
	}
	public int getMember_count() {
		return member_count;
	}
	public void setMember_count(int member_count) {
		this.member_count = member_count;
	}
	public String getMember_cd() {
		return member_cd;
	}
	public void setMember_cd(String member_cd) {
		this.member_cd = member_cd;
	}
	public String getSeat_cd() {
		return seat_cd;
	}
	public void setSeat_cd(String seat_cd) {
		this.seat_cd = seat_cd;
	}
	public String getMember_nm() {
		return member_nm;
	}
	public void setMember_nm(String member_nm) {
		this.member_nm = member_nm;
	}
	public String getMember_end_date() {
		return member_end_date;
	}
	public void setMember_end_date(String member_end_date) {
		this.member_end_date = member_end_date;
	}
	public int getSeat_cnumber() {
		return seat_cnumber;
	}
	public void setSeat_cnumber(int seat_cnumber) {
		this.seat_cnumber = seat_cnumber;
	}
	public String getRoom_cd() {
		return room_cd;
	}
	public void setRoom_cd(String room_cd) {
		this.room_cd = room_cd;
	}
	public String getRoom_nm() {
		return room_nm;
	}
	public void setRoom_nm(String room_nm) {
		this.room_nm = room_nm;
	}
	@Override
	public String toString() {
		return "EndDateList [member_cd=" + member_cd + ", seat_cd=" + seat_cd + ", member_nm=" + member_nm
				+ ", member_end_date=" + member_end_date + ", seat_cnumber=" + seat_cnumber + ", room_cd=" + room_cd
				+ ", room_nm=" + room_nm + ", member_count=" + member_count + ", member_percentage=" + member_percentage
				+ ", paynumber=" + paynumber + "]";
	}
}
