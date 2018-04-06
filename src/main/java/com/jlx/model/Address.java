package com.jlx.model;
/**
 * 地址的实体类
 * @author Administrator
 *
 */
public class Address {
	
	private String addressId;
	
	private String userId;
	
	private int cityId;
	
	private int provinceId;
	
	private String receiveName;
	
	private String receicePhone;
	
	private String addressDetail;
	
	private char addressFlag;
	
	private String addressCode;
	
	private String cityName;
	
	private String provinceName;

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


	public String getReceiveName() {
		return receiveName;
	}

	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}


	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public char getAddressFlag() {
		return addressFlag;
	}

	public void setAddressFlag(char addressFlag) {
		this.addressFlag = addressFlag;
	}

	public String getAddressCode() {
		return addressCode;
	}

	public void setAddressCode(String addressCode) {
		this.addressCode = addressCode;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
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

    
}
