package com.jlx.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.jlx.model.User;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;



public class LoginInterceptor extends AbstractInterceptor{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation ain) throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		User u = (User)request.getSession().getAttribute("u");
		StringBuffer path = request.getRequestURL();
		int a = path.indexOf("/front");
		int b = path.indexOf("/admin");
		String s = path.substring(36);
		if("/user_getRemind".equals(path.substring(36))){
			if(u ==null ||(u!=null && u.getRoleId()==1)){
				return "backtoAdminlogin";
			}else{
				return ain.invoke();
			}
		}
		if(b!=-1){
			if(u==null){		
				if("/user_adminLogin".equals(path.substring(42))){
					return ain.invoke();
				}else{
					return "backtoAdminlogin";
				}
			}else {
				if(u.getRoleId()==0){
					return "backtoAdminlogin";
				}else{
					return ain.invoke();
				}
			}
		}else{
			if(u!=null){
				if(u.getRoleId() ==0){
					return ain.invoke();
				}else{
					return "backtologin";
				}
			}else{
				if(a!=-1){
					String p = path.substring(a+7);
				    if("shoe_searchByType".equals(p) || "user_login".equals(p) || "shoe_searchShoeFront".equals(p) || "shoe_getShowById".equals(p)
				    		|| "shoe_gointocart".equals(p) || "user_userNameCheck".equals(p) || "user_register".equals(p) 
				    		|| "user_checkTobuy".equals(p) || "user_addintoCart".equals(p) || "shoe_addIntoCart".equals(p)){
				    	return ain.invoke();
				    }else{
				    	return "backtologin";
				    }
				}else{
					String p= path.substring(a+38);
					if("user_addintoCart".equals(p) || "user_userNameCheck".equals(p) || "user_register".equals(p) || "user_getUserByName".equals(p)
							|| "user_getCode".equals(p) ||  "user_changePass".equals(p)){
						return ain.invoke();
					}
				}
			}
		}
		return ain.invoke();
	}
      
}
