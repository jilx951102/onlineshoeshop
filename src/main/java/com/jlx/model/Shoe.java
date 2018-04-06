package com.jlx.model;

import java.util.Date;

/**
 * 鞋的实体类
 * @author Administrator
 *
 */
public class Shoe {
	private String shoeId;
	
	private String typeId;
	
	private String shoeName;
	
	private int shoePrice;
	
	private String shoeDesc;
	
	private int shoeStock;
	
	private String shoePlace;
	
	private String shoePicture;
	
	private String shoeFlag;
	
	private Date shoeTime;
	
	private String typeName;


	public String getShoeName() {
		return shoeName;
	}

	public void setShoeName(String shoeName) {
		this.shoeName = shoeName;
	}

	public int getShoePrice() {
		return shoePrice;
	}

	public void setShoePrice(int shoePrice) {
		this.shoePrice = shoePrice;
	}

	public String getShoeDesc() {
		return shoeDesc;
	}

	public void setShoeDesc(String shoeDesc) {
		this.shoeDesc = shoeDesc;
	}

	public int getShoeStock() {
		return shoeStock;
	}

	public void setShoeStock(int shoeStock) {
		this.shoeStock = shoeStock;
	}

	public String getShoePicture() {
		return shoePicture;
	}

	public void setShoePicture(String shoePicture) {
		this.shoePicture = shoePicture;
	}


	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getShoeId() {
		return shoeId;
	}

	public void setShoeId(String shoeId) {
		this.shoeId = shoeId;
	}

	public String getShoePlace() {
		return shoePlace;
	}

	public void setShoePlace(String shoePlace) {
		this.shoePlace = shoePlace;
	}

	public Date getShoeTime() {
		return shoeTime;
	}

	public void setShoeTime(Date shoeTime) {
		this.shoeTime = shoeTime;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getShoeFlag() {
		return shoeFlag;
	}

	public void setShoeFlag(String shoeFlag) {
		this.shoeFlag = shoeFlag;
	}
	

}
