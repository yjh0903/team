package com.monorella.srf.branch.dto;

public class Expense {

	private int expense_cd; 				//지출 코드
	private String branch_owner_cd; 		//지점대표코드
	private int expense_price;				//지출 금액
	private String expense_breakdown;		//지출 내역
	private int expense_amount;				//지출 수량 
	private String branch_name;				//지출 담당자
	private String expense_date;			//지출 날짜
	private String expense_month;			//지출월
	private int expense_total; 				//지출합계
	
	public int getExpense_cd() {
		return expense_cd;
	}
	public void setExpense_cd(int expense_cd) {
		this.expense_cd = expense_cd;
	}
	public String getBranch_owner_cd() {
		return branch_owner_cd;
	}
	public void setBranch_owner_cd(String branch_owner_cd) {
		this.branch_owner_cd = branch_owner_cd;
	}
	public int getExpense_price() {
		return expense_price;
	}
	public void setExpense_price(int expense_price) {
		this.expense_price = expense_price;
	}
	public String getExpense_breakdown() {
		return expense_breakdown;
	}
	public void setExpense_breakdown(String expense_breakdown) {
		this.expense_breakdown = expense_breakdown;
	}
	public int getExpense_amount() {
		return expense_amount;
	}
	public void setExpense_amount(int expense_amount) {
		this.expense_amount = expense_amount;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getExpense_date() {
		return expense_date;
	}
	public void setExpense_date(String expense_date) {
		this.expense_date = expense_date;
	}
	public String getExpense_month() {
		return expense_month;
	}
	public void setExpense_month(String expense_month) {
		this.expense_month = expense_month;
	}
	public int getExpense_total() {
		return expense_total;
	}
	public void setExpense_total(int expense_total) {
		this.expense_total = expense_total;
	}
	@Override
	public String toString() {
		return "Expense [expense_cd=" + expense_cd + ", branch_owner_cd=" + branch_owner_cd + ", expense_price="
				+ expense_price + ", expense_breakdown=" + expense_breakdown + ", expense_amount=" + expense_amount
				+ ", branch_name=" + branch_name + ", expense_date=" + expense_date + ", expense_month=" + expense_month
				+ ", expense_total=" + expense_total + "]";
	}
}
