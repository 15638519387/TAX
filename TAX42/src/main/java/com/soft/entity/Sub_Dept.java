package com.soft.entity;

public class Sub_Dept {
private String name;
private String dept;
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getDept() {
	return dept;
}
public void setDept(String dept) {
	this.dept = dept;
}
@Override
public String toString() {
	return "Sub_Dept [name=" + name + ", dept=" + dept + "]";
}



}
