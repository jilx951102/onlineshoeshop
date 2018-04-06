package com.jlx.model;
/**
 * 城市的实体类
 * @author Administrator
 *
 */
public class City {
   
	private int cityId;
	
	private String cityName;
	
	private int provinceId;

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

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
}
