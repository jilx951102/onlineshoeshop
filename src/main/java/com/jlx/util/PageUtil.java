package com.jlx.util;

import java.util.Hashtable;
import java.util.Map;

public class PageUtil {
   public static final int COUNT =5;
   public static final int COUNT2 =16;
	public static Map<String,Object> page(int currentPage,int size){
		int totalPage = 0;
		if(size%COUNT==0){
			totalPage = size/COUNT;
		}else{
			totalPage = size/COUNT+1;
		}
		Map<String, Object> page = new Hashtable<String, Object>();
		if(currentPage == 0){
			currentPage = 1;
		}
	    if( currentPage> totalPage){
	    	currentPage = totalPage-1==0?1:totalPage-1;
	    }
		int begin = (currentPage-1)*COUNT+1;
		int end = currentPage*COUNT;
		page.put("begin", begin);
		page.put("currentPage",currentPage);
		page.put("end", end);
		page.put("count", COUNT);
		page.put("totalPage", totalPage);
		page.put("totalSize", size);
		return page;
	}
	
	public static Map<String,Object> page2(int currentPage,int size){
		int totalPage = 0;
		if(size%COUNT2==0){
			totalPage = size/COUNT2;
		}else{
			totalPage = size/COUNT2+1;
		}
		Map<String, Object> page = new Hashtable<String, Object>();
		if(currentPage == 0){
			currentPage = 1;
		}
	    if( currentPage> totalPage){
	    	currentPage = totalPage-1==0?1:totalPage-1;
	    }
		int begin = (currentPage-1)*COUNT2+1;
		int end = currentPage*COUNT2;
		page.put("begin", begin);
		page.put("currentPage",currentPage);
		page.put("end", end);
		page.put("count", COUNT2);
		page.put("totalPage", totalPage);
		page.put("totalSize", size);
		return page;
	}
	
	

}
