package com.jlx.model;

import java.util.Date;

public class Type {
 
	private String typeId;
	
	private String typeName;
	
	private Date typeTime;
	
	private int typeNum;
	
	private char typeFlag;

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}


	public int getTypeNum() {
		return typeNum;
	}

	public void setTypeNum(int typeNum) {
		this.typeNum = typeNum;
	}

	public char getTypeFlag() {
		return typeFlag;
	}

	public void setTypeFlag(char typeFlag) {
		this.typeFlag = typeFlag;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Date getTypeTime() {
		return typeTime;
	}

	public void setTypeTime(Date typeTime) {
		this.typeTime = typeTime;
	}
	
	
}
