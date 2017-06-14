package com.monorella.srf.branch.dto;

public class StaffBoard {
	private int staffboard_no;				//게시판 번호
	private String branch_owner_cd;			//지점 대표코드 
	private String staffboard_pw;			//게시판 비번
	private String staffboard_title;		//게시판 제목
	private String staffboard_content;		//게시판 내용
	private String staff_name;				//직원 이름
	private String staffboard_date;			//게시판 날짜 
	public int getStaffboard_no() {
		return staffboard_no;
	}
	public void setStaffboard_no(int staffboard_no) {
		this.staffboard_no = staffboard_no;
	}
	public String getBranch_owner_cd() {
		return branch_owner_cd;
	}
	public void setBranch_owner_cd(String branch_owner_cd) {
		this.branch_owner_cd = branch_owner_cd;
	}
	public String getStaffboard_pw() {
		return staffboard_pw;
	}
	public void setStaffboard_pw(String staffboard_pw) {
		this.staffboard_pw = staffboard_pw;
	}
	public String getStaffboard_title() {
		return staffboard_title;
	}
	public void setStaffboard_title(String staffboard_title) {
		this.staffboard_title = staffboard_title;
	}
	public String getStaffboard_content() {
		return staffboard_content;
	}
	public void setStaffboard_content(String staffboard_content) {
		this.staffboard_content = staffboard_content;
	}
	public String getStaff_name() {
		return staff_name;
	}
	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}
	public String getStaffboard_date() {
		return staffboard_date;
	}
	public void setStaffboard_date(String staffboard_date) {
		this.staffboard_date = staffboard_date;
	}
	@Override
	public String toString() {
		return "StaffBoard [staffboard_no=" + staffboard_no + ", branch_owner_cd=" + branch_owner_cd
				+ ", staffboard_pw=" + staffboard_pw + ", staffboard_title=" + staffboard_title
				+ ", staffboard_content=" + staffboard_content + ", staff_name=" + staff_name + ", staffboard_date="
				+ staffboard_date + "]";
	}
	
	
	
	
}
