package com.jlx.model;
/**
 * 报表的实体类
 * @author Administrator
 *
 */
public class Chart {
    
	private String chartId;
	
	private String typeId;
	
	private int sellNum;
	
	private float sellMoney;
	
	private String typeName;

	public String getChartId() {
		return chartId;
	}

	public void setChartId(String chartId) {
		this.chartId = chartId;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public int getSellNum() {
		return sellNum;
	}

	public void setSellNum(int sellNum) {
		this.sellNum = sellNum;
	}

	public float getSellMoney() {
		return sellMoney;
	}

	public void setSellMoney(float sellMoney) {
		this.sellMoney = sellMoney;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	
}
