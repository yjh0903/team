package com.monorella.srf.branch.dto;

//요금제
public class Charges {
	private String seat_charges_code; //요금제 코드
	private String branch_owner_cd; //지점대표 코드
	private String seat_member_type; // 회원 구분
	private String seat_charges_date; // 기간별 
	private int seat_charges_price; // 요금 금액
	
	public String getSeat_charges_code() {
		return seat_charges_code;
	}
	public void setSeat_charges_code(String seat_charges_code) {
		this.seat_charges_code = seat_charges_code;
	}
	public String getBranch_owner_cd() {
		return branch_owner_cd;
	}
	public void setBranch_owner_cd(String branch_owner_cd) {
		this.branch_owner_cd = branch_owner_cd;
	}
	public String getSeat_member_type() {
		return seat_member_type;
	}
	public void setSeat_member_type(String seat_member_type) {
		this.seat_member_type = seat_member_type;
	}
	public String getSeat_charges_date() {
		return seat_charges_date;
	}
	public void setSeat_charges_date(String seat_charges_date) {
		this.seat_charges_date = seat_charges_date;
	}
	public int getSeat_charges_price() {
		return seat_charges_price;
	}
	public void setSeat_charges_price(int seat_charges_price) {
		this.seat_charges_price = seat_charges_price;
	}
	
	@Override
	public String toString() {
		return "Charges [seat_charges_code=" + seat_charges_code + ", branch_owner_cd=" + branch_owner_cd
				+ ", seat_member_type=" + seat_member_type + ", seat_charges_date=" + seat_charges_date
				+ ", seat_charges_price=" + seat_charges_price + "]";
	}
	
	
}
