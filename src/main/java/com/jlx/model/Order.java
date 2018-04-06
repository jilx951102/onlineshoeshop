package com.jlx.model;

import java.util.Date;

/**
 * 订单实体类
 * @author Administrator
 *
 */
public class Order {

	private String orderId;
	
	private String shoeId;
	
	private String userId;
	
	private Date orderTime;
	
	private String addressId;
	
	private char orderFlag;
	
	private int orderBuynum;
	
	private float orderMoney;
	
	private char delFlag;
	
	private User user;
	
	private Shoe shoe;
	
	private Raddress raddress;
	
	private Comment comment;
	
	private String payFlag;

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getShoeId() {
		return shoeId;
	}

	public void setShoeId(String shoeId) {
		this.shoeId = shoeId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}

	public char getOrderFlag() {
		return orderFlag;
	}

	public void setOrderFlag(char orderFlag) {
		this.orderFlag = orderFlag;
	}

	public int getOrderBuynum() {
		return orderBuynum;
	}

	public void setOrderBuynum(int orderBuynum) {
		this.orderBuynum = orderBuynum;
	}

	public char getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(char delFlag) {
		this.delFlag = delFlag;
	}

	public float getOrderMoney() {
		return orderMoney;
	}

	public void setOrderMoney(float orderMoney) {
		this.orderMoney = orderMoney;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Shoe getShoe() {
		return shoe;
	}

	public void setShoe(Shoe shoe) {
		this.shoe = shoe;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public Raddress getRaddress() {
		return raddress;
	}

	public void setRaddress(Raddress raddress) {
		this.raddress = raddress;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public String getPayFlag() {
		return payFlag;
	}

	public void setPayFlag(String payFlag) {
		this.payFlag = payFlag;
	}


    
	
	
}
