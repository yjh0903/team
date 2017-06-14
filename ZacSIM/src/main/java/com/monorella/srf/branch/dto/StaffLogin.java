package com.monorella.srf.branch.dto;

public class StaffLogin {
	private String branch_owner_cd;
	private String branch_nm;
	private String staff_name;
	
	public String getBranch_owner_cd() {
		return branch_owner_cd;
	}
	public void setBranch_owner_cd(String branch_owner_cd) {
		this.branch_owner_cd = branch_owner_cd;
	}
	public String getRanch_nm() {
		return branch_nm;
	}
	public void setRanch_nm(String branch_nm) {
		this.branch_nm = branch_nm;
	}
	public String getStaff_name() {
		return staff_name;
	}
	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}
	@Override
	public String toString() {
		return "StaffLogin [branch_owner_cd=" + branch_owner_cd + ", branch_nm=" + branch_nm + ", staff_name="
				+ staff_name + "]";
	}
}
