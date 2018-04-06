package com.jlx.model;
/**
 * 等级实体类
 * @author Administrator
 *
 */
public class Level {
	private int levelId;
	
	private String levelName;
	
	private int levelCount;
	
	private float levelCut;

	public String getLevelName() {
		return levelName;
	}

	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}

	public int getLevelCount() {
		return levelCount;
	}

	public void setLevelCount(int levelCount) {
		this.levelCount = levelCount;
	}

	public float getLevelCut() {
		return levelCut;
	}

	public void setLevelCut(float levelCut) {
		this.levelCut = levelCut;
	}

	public int getLevelId() {
		return levelId;
	}

	public void setLevelId(int levelId) {
		this.levelId = levelId;
	}
 

}
