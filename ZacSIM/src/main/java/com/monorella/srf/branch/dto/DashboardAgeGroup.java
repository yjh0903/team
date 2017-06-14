package com.monorella.srf.branch.dto;
public class DashboardAgeGroup {
	private String branch_owner_cd;
	private int teens;
	private int twenty;
	private int thirty;
	private int forty;
	private int etc;
	private String member_sex;
	public String getBranch_owner_cd() {
		return branch_owner_cd;
	}
	public void setBranch_owner_cd(String branch_owner_cd) {
		this.branch_owner_cd = branch_owner_cd;
	}
	public int getTeens() {
		return teens;
	}
	public void setTeens(int teens) {
		this.teens = teens;
	}
	public int getTwenty() {
		return twenty;
	}
	public void setTwenty(int twenty) {
		this.twenty = twenty;
	}
	public int getThirty() {
		return thirty;
	}
	public void setThirty(int thirty) {
		this.thirty = thirty;
	}
	public int getForty() {
		return forty;
	}
	public void setForty(int forty) {
		this.forty = forty;
	}
	public int getEtc() {
		return etc;
	}
	public void setEtc(int etc) {
		this.etc = etc;
	}
	public String getMember_sex() {
		return member_sex;
	}
	public void setMember_sex(String member_sex) {
		this.member_sex = member_sex;
	}
	@Override
	public String toString() {
		return "DashboardAgeGroup [branch_owner_cd=" + branch_owner_cd + ", teens=" + teens + ", twenty=" + twenty
				+ ", thirty=" + thirty + ", forty=" + forty + ", etc=" + etc + ", member_sex=" + member_sex + "]";
	}
}
