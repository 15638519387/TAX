package com.soft.entity;

public class Reply {
	String reply_dept;
	String replyer;
	String reply_Content;
	String consult_id;
	public String getReply_dept() {
		return reply_dept;
	}
	public void setReply_dept(String reply_dept) {
		this.reply_dept = reply_dept;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public String getReply_Content() {
		return reply_Content;
	}
	public void setReply_Content(String reply_Content) {
		this.reply_Content = reply_Content;
	}
	public String getConsult_id() {
		return consult_id;
	}
	public void setConsult_id(String consult_id) {
		this.consult_id = consult_id;
	}
	@Override
	public String toString() {
		return "Reply [reply_dept=" + reply_dept + ", replyer=" + replyer + ", reply_Content=" + reply_Content
				+ ", consult_id=" + consult_id + "]";
	}
	
	
}
