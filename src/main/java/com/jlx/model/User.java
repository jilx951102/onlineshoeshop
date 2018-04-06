package com.jlx.model;

import java.util.Date;
/**
 * 用户实体类
 * @author Administrator
 *
 */
public class User implements Cloneable{
    private String userId;
    
    private String userName;
    
    private String userRealname;
    
    private String userPassword;
    
    private String userPhone;
    
    private Date userBirthday;
    
    private int roleId;
    
    private String userEmail;
    
    private int levelCount;
    
    private char userFlag;
    
    private String LevelName;
    
    private Date userTime;

    private String userPicture;
    
    private String adminFlag;
    

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserRealname() {
		return userRealname;
	}

	public void setUserRealname(String userRealname) {
		this.userRealname = userRealname;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public Date getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}



	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public char getUserFlag() {
		return userFlag;
	}

	public void setUserFlag(char userFlag) {
		this.userFlag = userFlag;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	
	@Override
	public User clone() throws CloneNotSupportedException{
		return (User)super.clone();
	}

	public int getLevelCount() {
		return levelCount;
	}

	public void setLevelCount(int levelCount) {
		this.levelCount = levelCount;
	}

	public String getLevelName() {
		return LevelName;
	}

	public void setLevelName(String levelName) {
		LevelName = levelName;
	}

	public Date getUserTime() {
		return userTime;
	}

	public void setUserTime(Date userTime) {
		this.userTime = userTime;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getUserPicture() {
		return userPicture;
	}

	public void setUserPicture(String userPicture) {
		this.userPicture = userPicture;
	}

	public String getAdminFlag() {
		return adminFlag;
	}

	public void setAdminFlag(String adminFlag) {
		this.adminFlag = adminFlag;
	}
    
    
}
