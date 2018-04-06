package com.jlx.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 生成ID
 * @author Administrator
 *
 */
public class IDgenerate {

   public static String next(){
	   SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
	   String a1 =simpleDateFormat.format(new Date())+"";
	   String a = "0123456789";
	   char[] c1 = a.toCharArray();
	   for(int c =0; c<4; c++){
		   int b = new Random().nextInt(10);
		   a1+=c1[b];
		}
	   return a1;
   }
   
   public static String order(){
	   SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyMMdd");
	   String a1 =simpleDateFormat.format(new Date())+"";
	   String a = "0123456789";
	   char[] c1 = a.toCharArray();
	   for(int c =0; c<6; c++){
		   int b = new Random().nextInt(10);
		   a1+=c1[b];
		}
	   return a1;
   }
   
   public static void main(String[] args) {
	System.out.println(next());
}
}
