package com.monorella.srf.branch.dto;

public class Payment {
	private int pay_cd; //결제 코드
	private String branch_owner_cd; //지점대표코드
	private String room_cd; //열람실 코드
	private String seat_cd; //열람석 코드
	private String member_cd; //회원 코드
	private int total_amount; //결제금액
	private String pay_date; //결제일
	private int pay_month; //결제월
	private String member_regi_date; //회원 기간 시작일
	private String member_end_date; //회원 기간 만료일
	private String pay_option; //결제 종류
	private String member_nm; //회원 이름
	private String pay_extension; //연장 결제 여부

	public String getPay_extension() {
		return pay_extension;
	}
	public void setPay_extension(String pay_extension) {
		this.pay_extension = pay_extension;
	}
	public int getPay_cd() {
		return pay_cd;
	}
	public void setPay_cd(int pay_cd) {
		this.pay_cd = pay_cd;
	}
	public String getBranch_owner_cd() {
		return branch_owner_cd;
	}
	public void setBranch_owner_cd(String branch_owner_cd) {
		this.branch_owner_cd = branch_owner_cd;
	}
	public String getRoom_cd() {
		return room_cd;
	}
	public void setRoom_cd(String room_cd) {
		this.room_cd = room_cd;
	}
	public String getSeat_cd() {
		return seat_cd;
	}
	public void setSeat_cd(String seat_cd) {
		this.seat_cd = seat_cd;
	}
	public String getMember_cd() {
		return member_cd;
	}
	public void setMember_cd(String member_cd) {
		this.member_cd = member_cd;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public int getPay_month() {
		return pay_month;
	}
	public void setPay_month(int pay_month) {
		this.pay_month = pay_month;
	}
	public String getMember_regi_date() {
		return member_regi_date;
	}
	public void setMember_regi_date(String member_regi_date) {
		this.member_regi_date = member_regi_date;
	}
	public String getMember_end_date() {
		return member_end_date;
	}
	public void setMember_end_date(String member_end_date) {
		this.member_end_date = member_end_date;
	}
	public String getPay_option() {
		return pay_option;
	}
	public void setPay_option(String pay_option) {
		this.pay_option = pay_option;
	}
	public String getMember_nm() {
		return member_nm;
	}
	public void setMember_nm(String member_nm) {
		this.member_nm = member_nm;
	}
	@Override
	public String toString() {
		return "Payment [pay_cd=" + pay_cd + ", branch_owner_cd=" + branch_owner_cd + ", room_cd=" + room_cd
				+ ", seat_cd=" + seat_cd + ", member_cd=" + member_cd + ", total_amount=" + total_amount + ", pay_date="
				+ pay_date + ", pay_month=" + pay_month + ", member_regi_date=" + member_regi_date
				+ ", member_end_date=" + member_end_date + ", pay_option=" + pay_option + ", member_nm=" + member_nm
				+ ", pay_extension=" + pay_extension + "]";
	}
}
