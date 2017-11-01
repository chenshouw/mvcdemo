package com.neuedu.mvcdemo.model;

public class Order {
	private int oid;
	private String name;
	private int goodsId;
	private double price;
	private int count;

	public Order() {
		super();
	}

	public Order(int oid, String name, int goodsId, double price, int count) {
		super();
		this.oid = oid;
		this.name = name;
		this.goodsId = goodsId;
		this.price = price;
		this.count = count;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}
