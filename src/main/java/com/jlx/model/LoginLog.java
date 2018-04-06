package com.jlx.model;

import java.util.Date;

/**
 * 管理员登录日志
 * @author Administrator
 *
 */
public class LoginLog {
   private String logId;
   
   private String userId;
   
   private Date loginTime;
   
   private String userRealname;

public Date getLoginTime() {
	return loginTime;
}

public void setLoginTime(Date loginTime) {
	this.loginTime = loginTime;
}

public String getUserId() {
	return userId;
}

public void setUserId(String userId) {
	this.userId = userId;
}

public String getLogId() {
	return logId;
}

public void setLogId(String logId) {
	this.logId = logId;
}

public String getUserRealname() {
	return userRealname;
}

public void setUserRealname(String userRealname) {
	this.userRealname = userRealname;
}
}
