package com.soft.entity;

public class Sub_matter {

	private String matter_id;
	private String matter_no;
	private String matter_name;
	private String matter_dept;
	private String matter_user;
	private String matter_time;
	private String matter_state;
	public String getMatter_id() {
		return matter_id;
	}
	public void setMatter_id(String matter_id) {
		this.matter_id = matter_id;
	}
	public String getMatter_no() {
		return matter_no;
	}
	public void setMatter_no(String matter_no) {
		this.matter_no = matter_no;
	}
	public String getMatter_name() {
		return matter_name;
	}
	public void setMatter_name(String matter_name) {
		this.matter_name = matter_name;
	}
	public String getMatter_dept() {
		return matter_dept;
	}
	public void setMatter_dept(String matter_dept) {
		this.matter_dept = matter_dept;
	}
	public String getMatter_user() {
		return matter_user;
	}
	public void setMatter_user(String matter_user) {
		this.matter_user = matter_user;
	}
	public String getMatter_time() {
		return matter_time;
	}
	public void setMatter_time(String matter_time) {
		this.matter_time = matter_time;
	}
	public String getMatter_state() {
		return matter_state;
	}
	public void setMatter_state(String matter_state) {
		this.matter_state = matter_state;
	}
	@Override
	public String toString() {
		return "Sub_matter [matter_id=" + matter_id + ", matter_no=" + matter_no + ", matter_name=" + matter_name
				+ ", matter_dept=" + matter_dept + ", matter_user=" + matter_user + ", matter_time=" + matter_time
				+ ", matter_state=" + matter_state + "]";
	}
	
	
	
}
