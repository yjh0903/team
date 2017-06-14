package com.monorella.srf.branch.dto;

public class StaffBoardReply {	
		private int staffboardreply_no;        			// 댓글 번호
	    private int staffboard_no;   					// 게시글 번호
	    private String staffboardreply_pw;				// 댓글 비밀번호
	    private String staffboardreply_content;    		// 댓글 내용
	    private String staffboard_name;       		 	// 댓글 작성자
	    private String staffboardreply_date;        	// 댓글 작성일자
		
	    public int getStaffboardreply_no() {
			return staffboardreply_no;
		}
		public void setStaffboardreply_no(int staffboardreply_no) {
			this.staffboardreply_no = staffboardreply_no;
		}
		public int getStaffboard_no() {
			return staffboard_no;
		}
		public void setStaffboard_no(int staffboard_no) {
			this.staffboard_no = staffboard_no;
		}
		public String getStaffboardreply_pw() {
			return staffboardreply_pw;
		}
		public void setStaffboardreply_pw(String staffboardreply_pw) {
			this.staffboardreply_pw = staffboardreply_pw;
		}
		public String getStaffboardreply_content() {
			return staffboardreply_content;
		}
		public void setStaffboardreply_content(String staffboardreply_content) {
			this.staffboardreply_content = staffboardreply_content;
		}
		public String getStaffboard_name() {
			return staffboard_name;
		}
		public void setStaffboard_name(String staffboard_name) {
			this.staffboard_name = staffboard_name;
		}
		public String getStaffboardreply_date() {
			return staffboardreply_date;
		}
		public void setStaffboardreply_date(String staffboardreply_date) {
			this.staffboardreply_date = staffboardreply_date;
		}
		@Override
		public String toString() {
			return "StaffBoardReply [staffboardreply_no=" + staffboardreply_no + ", staffboard_no=" + staffboard_no
					+ ", staffboardreply_pw=" + staffboardreply_pw + ", staffboardreply_content="
					+ staffboardreply_content + ", staffboard_name=" + staffboard_name + ", staffboardreply_date="
					+ staffboardreply_date + "]";
		}
		
}
