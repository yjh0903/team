package com.monorella.srf.head.dto;

public class HeadManager {
	private int head_manager;
	private String head_id;
	private String head_pw;
	private String head_name;
	
	public int getHead_manager() {
		return head_manager;
	}
	public void setHead_manager(int head_manager) {
		this.head_manager = head_manager;
	}
	public String getHead_id() {
		return head_id;
	}
	public void setHead_id(String head_id) {
		this.head_id = head_id;
	}
	public String getHead_pw() {
		return head_pw;
	}
	public void setHead_pw(String head_pw) {
		this.head_pw = head_pw;
	}
	public String getHead_name() {
		return head_name;
	}
	public void setHead_name(String head_name) {
		this.head_name = head_name;
	}
	
	@Override
	public String toString() {
		return "LoginDao [head_manager=" + head_manager + ", head_id=" + head_id + ", head_pw=" + head_pw
				+ ", head_name=" + head_name + "]";
	}
}
