package com.jlx.model;
/**
 * 收获地址
 * @author Administrator
 *
 */
public class Raddress {
   private String addressId;
   
   private String userId;
   
   private String addressCode;
   
   private String receiveName;
   
   private String receicePhone;
   
   private int cityId;
   
   private int provinceId;
   
   private String addressDetail;

public String getAddressId() {
	return addressId;
}

public void setAddressId(String addressId) {
	this.addressId = addressId;
}

public String getUserId() {
	return userId;
}

public void setUserId(String userId) {
	this.userId = userId;
}

public String getAddressCode() {
	return addressCode;
}

public void setAddressCode(String addressCode) {
	this.addressCode = addressCode;
}

public String getReceiveName() {
	return receiveName;
}

public void setReceiveName(String receiveName) {
	this.receiveName = receiveName;
}

public String getReceicePhone() {
	return receicePhone;
}

public void setReceicePhone(String receicePhone) {
	this.receicePhone = receicePhone;
}

public int getCityId() {
	return cityId;
}

public void setCityId(int cityId) {
	this.cityId = cityId;
}

public int getProvinceId() {
	return provinceId;
}

public void setProvinceId(int provinceId) {
	this.provinceId = provinceId;
}

public String getAddressDetail() {
	return addressDetail;
}

public void setAddressDetail(String addressDetail) {
	this.addressDetail = addressDetail;
}
   
   
}
