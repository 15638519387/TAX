package com.soft.entity;

public class ConSy {
	String consult_id;
	String con_title;
	String state;
	String con_time;
	public String getCon_title() {
		return con_title;
	}
	public void setCon_title(String con_title) {
		this.con_title = con_title;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCon_time() {
		return con_time;
	}
	public void setCon_time(String con_time) {
		this.con_time = con_time;
	}
	
	public String getConsult_id() {
		return consult_id;
	}
	public void setConsult_id(String consult_id) {
		this.consult_id = consult_id;
	}
	@Override
	public String toString() {
		return "ConSy [consult_id=" + consult_id + ", con_title=" + con_title + ", state=" + state + ", con_time="
				+ con_time + "]";
	}

	
}
