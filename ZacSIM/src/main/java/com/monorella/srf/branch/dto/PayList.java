package com.monorella.srf.branch.dto;

public class PayList {
	private String room_nm;
	private int payment_percentage;
	private int paynumber;
	
	public int getPaynumber() {
		return paynumber;
	}
	public void setPaynumber(int paynumber) {
		this.paynumber = paynumber;
	}
	public String getRoom_nm() {
		return room_nm;
	}
	public void setRoom_nm(String room_nm) {
		this.room_nm = room_nm;
	}
	public int getPayment_percentage() {
		return payment_percentage;
	}
	public void setPayment_percentage(int payment_percentage) {
		this.payment_percentage = payment_percentage;
	}
	@Override
	public String toString() {
		return "PayList [room_nm=" + room_nm + ", payment_percentage=" + payment_percentage + ", paynumber=" + paynumber
				+ "]";
	}
	
}
