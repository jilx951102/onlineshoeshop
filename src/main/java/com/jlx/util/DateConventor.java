package com.jlx.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 日期转换类
 * @author Administrator
 *
 */
public class DateConventor {
   
	public static Date parseString(String arg){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		if(arg!=null && !"".equals(arg)){
			try {
				date = sdf.parse(arg);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return date;
	}
	
	public static String format(Date date){
		String s ="";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		s = sdf.format(date);
		return s;
	}
}
