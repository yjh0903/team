package com.monorella.srf.head.dto;

public class HeadBranchOwner {

	private String branch_owner_cd; //지점대표코드
	private String owner_num;       //사업자 번호
	private String branch_owner_id; //사업자 아이디
	private String branch_owner_pw; //비밀번호
	private String branch_owner_addr; //사업자 주소
	private String branch_owner_postcode; //사업자 우편번호
	private String branch_owner_detail_addr; //사업자 상세주소
	private String owner_nm; //이름
	private String branch_owner_tel; //연락처
	private String branch_owner_in_date; //가입일
	private String branch_nm; //지점명
	private String branch_tel; //지점 연락처
	private String branch_addr; //지점 주소
	private String branch_postcode;//지점 우편번호 
	private String branch_detail_addr;//지점 상세주소
	private String branch_contract_file_path; // 계약 정보 파일 경로
	
	public String getBranch_owner_cd() {
		return branch_owner_cd;
	}
	public void setBranch_owner_cd(String branch_owner_cd) {
		this.branch_owner_cd = branch_owner_cd;
	}
	public String getOwner_num() {
		return owner_num;
	}
	public void setOwner_num(String owner_num) {
		this.owner_num = owner_num;
	}
	public String getBranch_nm() {
		return branch_nm;
	}
	public void setBranch_nm(String branch_nm) {
		this.branch_nm = branch_nm;
	}
	public String getBranch_owner_id() {
		return branch_owner_id;
	}
	public void setBranch_owner_id(String branch_owner_id) {
		this.branch_owner_id = branch_owner_id;
	}
	public String getBranch_owner_pw() {
		return branch_owner_pw;
	}
	public void setBranch_owner_pw(String branch_owner_pw) {
		this.branch_owner_pw = branch_owner_pw;
	}
	public String getBranch_owner_addr() {
		return branch_owner_addr;
	}
	public void setBranch_owner_addr(String branch_owner_addr) {
		this.branch_owner_addr = branch_owner_addr;
	}
	public String getOwner_nm() {
		return owner_nm;
	}
	public void setOwner_nm(String owner_nm) {
		this.owner_nm = owner_nm;
	}
	public String getBranch_owner_tel() {
		return branch_owner_tel;
	}
	public void setBranch_owner_tel(String branch_owner_tel) {
		this.branch_owner_tel = branch_owner_tel;
	}
	public String getBranch_owner_in_date() {
		return branch_owner_in_date;
	}
	public void setBranch_owner_in_date(String branch_owner_in_date) {
		this.branch_owner_in_date = branch_owner_in_date;
	}
	public String getBranch_tel() {
		return branch_tel;
	}
	public void setBranch_tel(String branch_tel) {
		this.branch_tel = branch_tel;
	}
	public String getBranch_addr() {
		return branch_addr;
	}
	public void setBranch_addr(String branch_addr) {
		this.branch_addr = branch_addr;
	}
	public String getBranch_contract_file_path() {
		return branch_contract_file_path;
	}
	public void setBranch_contract_file_path(String branch_contract_file_path) {
		this.branch_contract_file_path = branch_contract_file_path;
	}
	public String getBranch_owner_postcode() {
		return branch_owner_postcode;
	}
	public void setBranch_owner_postcode(String branch_owner_postcode) {
		this.branch_owner_postcode = branch_owner_postcode;
	}
	public String getBranch_owner_detail_addr() {
		return branch_owner_detail_addr;
	}
	public void setBranch_owner_detail_addr(String branch_owner_detail_addr) {
		this.branch_owner_detail_addr = branch_owner_detail_addr;
	}
	public String getBranch_postcode() {
		return branch_postcode;
	}
	public void setBranch_postcode(String branch_postcode) {
		this.branch_postcode = branch_postcode;
	}
	public String getBranch_detail_addr() {
		return branch_detail_addr;
	}
	public void setBranch_detail_addr(String branch_detail_addr) {
		this.branch_detail_addr = branch_detail_addr;
	}
	@Override
	public String toString() {
		return "BranchOwner [branch_owner_cd=" + branch_owner_cd + ", owner_num=" + owner_num + ", branch_owner_id="
				+ branch_owner_id + ", branch_owner_pw=" + branch_owner_pw + ", branch_owner_addr=" + branch_owner_addr
				+ ", branch_owner_postcode=" + branch_owner_postcode + ", branch_owner_detail_addr="
				+ branch_owner_detail_addr + ", owner_nm=" + owner_nm + ", branch_owner_tel=" + branch_owner_tel
				+ ", branch_owner_in_date=" + branch_owner_in_date + ", branch_nm=" + branch_nm + ", branch_tel="
				+ branch_tel + ", branch_addr=" + branch_addr + ", branch_postcode=" + branch_postcode
				+ ", branch_detail_addr=" + branch_detail_addr + ", branch_contract_file_path="
				+ branch_contract_file_path + "]";
	}
	
}
