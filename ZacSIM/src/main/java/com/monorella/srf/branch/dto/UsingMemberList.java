package com.monorella.srf.branch.dto;

public class UsingMemberList {
	private int seat_cd;
	private String member_nm;
	private String member_sex;
	private String room_nm;
	private String in_time;
	public int getSeat_cd() {
		return seat_cd;
	}
	public void setSeat_cd(int seat_cd) {
		this.seat_cd = seat_cd;
	}
	public String getMember_nm() {
		return member_nm;
	}
	public void setMember_nm(String member_nm) {
		this.member_nm = member_nm;
	}
	public String getMember_sex() {
		return member_sex;
	}
	public void setMember_sex(String member_sex) {
		this.member_sex = member_sex;
	}
	public String getRoom_nm() {
		return room_nm;
	}
	public void setRoom_nm(String room_nm) {
		this.room_nm = room_nm;
	}
	public String getIn_time() {
		return in_time;
	}
	public void setIn_time(String in_time) {
		this.in_time = in_time;
	}
	@Override
	public String toString() {
		return "UsingMemberList [seat_cd=" + seat_cd + ", member_nm=" + member_nm + ", member_sex=" + member_sex
				+ ", room_nm=" + room_nm + ", in_time=" + in_time + "]";
	}
}
