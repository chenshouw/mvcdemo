package com.neuedu.mvcdemo.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotBlank;

public class UserInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8461618202676089632L;
   
	//使用框架编程后，由于有很多编码由框架完成，
	//建议： 在定义实体类时所有的原始数据类型都使用包装类进行定义,程序的兼容性更好
	private Integer uid;

	@NotBlank(message = "用户帐号不能为空")
	private String userName;
	private String[] hobby;// 爱好
	private Date birthDay;// 出生日期，spring默认提供了时间转换器：yyyy/MM/dd ,yyyy/MM/dd
							// HH:mm:ss ,Nov 01 04:12:12 CST 2017
	private List<Order> orderList;// 一个用户有多个订单
	private Order order;// 一个用户只有一个订单
	private String headURL;// 用户头像

	public void setHobbies(String hobbies) {
		if (hobbies != null) {
			hobby = hobbies.split(",");
		}
	}
	public String getHobbies() {
		if (hobby != null) {
			return String.join(",", hobby);
		}
		return null;
	}

	public String getHeadURL() {
		return headURL;
	}

	public void setHeadURL(String headURL) {
		this.headURL = headURL;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public List<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}

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

	public UserInfo(Integer uid, String userName) {
		super();
		this.uid = uid;
		this.userName = userName;
	}

	public UserInfo(String userName, String[] hobby, Date birthDay, String headURL) {
		super();
		this.userName = userName;
		this.hobby = hobby;
		this.birthDay = birthDay;
		this.headURL = headURL;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
