package com.monorella.srf.branch.dto;

public class Staff {
	private String staff_id;			//직원아이디
	private String branch_owner_cd;		//지점대표코드
	private String staff_pw;			//직원비밀번호
	private String staff_name;			//이름
	private String staff_tel;			//연락처
	private String staff_postcode;		//우편번호
	private String staff_addr;			//기본주소
	private String staff_detail_addr;	//상세주소
	private String staff_in_date;		//가입일
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
	public String getBranch_owner_cd() {
		return branch_owner_cd;
	}
	public void setBranch_owner_cd(String branch_owner_cd) {
		this.branch_owner_cd = branch_owner_cd;
	}
	public String getStaff_pw() {
		return staff_pw;
	}
	public void setStaff_pw(String staff_pw) {
		this.staff_pw = staff_pw;
	}
	public String getStaff_name() {
		return staff_name;
	}
	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}
	public String getStaff_tel() {
		return staff_tel;
	}
	public void setStaff_tel(String staff_tel) {
		this.staff_tel = staff_tel;
	}
	public String getStaff_postcode() {
		return staff_postcode;
	}
	public void setStaff_postcode(String staff_postcode) {
		this.staff_postcode = staff_postcode;
	}
	public String getStaff_addr() {
		return staff_addr;
	}
	public void setStaff_addr(String staff_addr) {
		this.staff_addr = staff_addr;
	}
	public String getStaff_detail_addr() {
		return staff_detail_addr;
	}
	public void setStaff_detail_addr(String staff_detail_addr) {
		this.staff_detail_addr = staff_detail_addr;
	}
	public String getStaff_in_date() {
		return staff_in_date;
	}
	public void setStaff_in_date(String staff_in_date) {
		this.staff_in_date = staff_in_date;
	}
	@Override
	public String toString() {
		return "Staff [staff_id=" + staff_id + ", branch_owner_cd=" + branch_owner_cd + ", staff_pw=" + staff_pw
				+ ", staff_name=" + staff_name + ", staff_tel=" + staff_tel + ", staff_postcode=" + staff_postcode
				+ ", staff_addr=" + staff_addr + ", staff_detail_addr=" + staff_detail_addr + ", staff_in_date="
				+ staff_in_date + "]";
	}
	
	
	
}
