package com.neuedu.mvcdemo.model;

import java.util.Date;

public class UserInfo {
	private int uid;
	private String userName;
	private String[] hobby;//爱好
	private Date birthDay;//出生日期，spring默认提供了时间转换器：yyyy/MM/dd  ,yyyy/MM/dd HH:mm:ss ,Nov 01 04:12:12 CST 2017
	
	public Date getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public String[] getHobby() {
		return hobby;
	}

	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}

	public UserInfo() {
		super();
	}
	
	public UserInfo(int uid, String userName) {
		super();
		this.uid = uid;
		this.userName = userName;
	}
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	

}
