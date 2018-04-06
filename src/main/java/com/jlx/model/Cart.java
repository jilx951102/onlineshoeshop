package com.jlx.model;

import java.util.Date;

/**
 * 购物车实体类
 * @author Administrator
 *
 */
public class Cart {

	private String cartId;
	
	private String shoeId;
	
	private String userId;
	
	private char cartFlag;
	
	private int cartBuynum;
	
	private Date cartTime;
	
	private Shoe shoe;

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
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

	public char getCartFlag() {
		return cartFlag;
	}

	public void setCartFlag(char cartFlag) {
		this.cartFlag = cartFlag;
	}

	public int getCartBuynum() {
		return cartBuynum;
	}

	public void setCartBuynum(int cartBuynum) {
		this.cartBuynum = cartBuynum;
	}

	public Date getCartTime() {
		return cartTime;
	}

	public void setCartTime(Date cartTime) {
		this.cartTime = cartTime;
	}

	public Shoe getShoe() {
		return shoe;
	}

	public void setShoe(Shoe shoe) {
		this.shoe = shoe;
	}
	
}
