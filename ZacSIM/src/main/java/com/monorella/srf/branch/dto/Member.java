package com.monorella.srf.branch.dto;

public class Member {
	private String member_cd; //회원코드
	private String branch_owner_cd; //지점대표코드
	private String staff_id; //직원 아이디
	private int seat_cd; //열람석 코드
	private int inout_num; // 출결번호
	private String member_nm; //회원이름
	private String member_sex; //회원성별
	private String member_tel; //회원 연락처
	private String member_addr; //회원 주소
	private int member_age; //회원 나이
	private String member_date; //회원 가입일 
	private int member_month; // 가입된 월
	private String member_regi_date; //회원 시작일 
	private String member_end_date; //회원 마감일
	private String member_seat_state; //회원 결제 여부
	private String member_regi_path; //회원가입 경로
	private String member_use_pur; //독서실 이용 이유
	private String room_cd; //열람실 코드

	public String getRoom_cd() {
		return room_cd;
	}
	public void setRoom_cd(String room_cd) {
		this.room_cd = room_cd;
	}
	public String getMember_cd() {
		return member_cd;
	}
	public void setMember_cd(String member_cd) {
		this.member_cd = member_cd;
	}
	public String getBranch_owner_cd() {
		return branch_owner_cd;
	}
	public void setBranch_owner_cd(String branch_owner_cd) {
		this.branch_owner_cd = branch_owner_cd;
	}
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
	public int getSeat_cd() {
		return seat_cd;
	}
	public void setSeat_cd(int seat_cd) {
		this.seat_cd = seat_cd;
	}
	public int getInout_num() {
		return inout_num;
	}
	public void setInout_num(int inout_num) {
		this.inout_num = inout_num;
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
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public int getMember_age() {
		return member_age;
	}
	public void setMember_age(int member_age) {
		this.member_age = member_age;
	}
	public String getMember_date() {
		return member_date;
	}
	public void setMember_date(String member_date) {
		this.member_date = member_date;
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
	public String getMember_seat_state() {
		return member_seat_state;
	}
	public void setMember_seat_state(String member_seat_state) {
		this.member_seat_state = member_seat_state;
	}
	public String getMember_regi_path() {
		return member_regi_path;
	}
	public void setMember_regi_path(String member_regi_path) {
		this.member_regi_path = member_regi_path;
	}
	public String getMember_use_pur() {
		return member_use_pur;
	}
	public void setMember_use_pur(String member_use_pur) {
		this.member_use_pur = member_use_pur;
	}
	public int getMember_month() {
		return member_month;
	}
	public void setMember_month(int member_month) {
		this.member_month = member_month;
	}
	@Override
	public String toString() {
		return "Member [member_cd=" + member_cd + ", branch_owner_cd=" + branch_owner_cd + ", staff_id=" + staff_id
				+ ", seat_cd=" + seat_cd + ", inout_num=" + inout_num + ", member_nm=" + member_nm + ", member_sex="
				+ member_sex + ", member_tel=" + member_tel + ", member_addr=" + member_addr + ", member_age="
				+ member_age + ", member_date=" + member_date + ", member_month=" + member_month + ", member_regi_date="
				+ member_regi_date + ", member_end_date=" + member_end_date + ", member_seat_state=" + member_seat_state
				+ ", member_regi_path=" + member_regi_path + ", member_use_pur=" + member_use_pur + ", room_cd="
				+ room_cd + "]";
	}


}	
	