package com.jlx.util;

import java.util.List;

import com.jlx.model.Level;
import com.jlx.model.Order;
import com.jlx.model.User;

public class PeopleUtil {
	public static List<User> getLevel(List<User> user, List<Level> level) {
		int a, b, c, d, e;
		a = level.get(0).getLevelCount();
		b = level.get(1).getLevelCount();
		c = level.get(2).getLevelCount();
		d = level.get(3).getLevelCount();
		e = level.get(4).getLevelCount();
		for (int i = 0; i < user.size(); i++) {
			int n = user.get(i).getLevelCount();
			if (n >= e) {
				user.get(i).setLevelName(level.get(4).getLevelName());
			} else if (n >= d) {
				user.get(i).setLevelName(level.get(3).getLevelName());
			} else if (n >= c) {
				user.get(i).setLevelName(level.get(2).getLevelName());
			} else if (n >= b) {
				user.get(i).setLevelName(level.get(1).getLevelName());
			} else if (n >= a) {
				user.get(i).setLevelName(level.get(0).getLevelName());
			} else {
				user.get(i).setLevelName("无等级");
			}
		}
		return user;
	}

	public static float getLevelCount(List<Level> level, List<Order> l) {
		float cut = 0;
		if(l.size()==0){
			cut = 1;
		}else{
			int count = 0;
			for (int i = 0; i < l.size(); i++) {
				count+= l.get(i).getOrderBuynum();
			}
			
			int a, b, c, d, e;
			a = level.get(0).getLevelCount();
			b = level.get(1).getLevelCount();
			c = level.get(2).getLevelCount();
			d = level.get(3).getLevelCount();
			e = level.get(4).getLevelCount();
			
			if (count >= e) {
				cut = level.get(4).getLevelCut();
			} else if (count >= d) {
				cut = level.get(3).getLevelCut();
			} else if (count >= c) {
				cut = level.get(2).getLevelCut();
			} else if (count >= b) {
				cut = level.get(1).getLevelCut();
			} else if (count >= a) {
				cut = level.get(0).getLevelCut();
			} else {
				cut = 1;
			}
		}

		return cut;

	}
	
	public static String getOneLevel(List<Level> level, List<Order> l) {
	    String levels = "";
		if(l.size()==0){
			levels = "无等级";
		}else{
			int count = 0;
			for (int i = 0; i < l.size(); i++) {
				count+= l.get(i).getOrderBuynum();
			}
			
			int a, b, c, d, e;
			a = level.get(0).getLevelCount();
			b = level.get(1).getLevelCount();
			c = level.get(2).getLevelCount();
			d = level.get(3).getLevelCount();
			e = level.get(4).getLevelCount();
			
			if (count >= e) {
				levels = level.get(4).getLevelName();
			} else if (count >= d) {
				levels = level.get(3).getLevelName();
			} else if (count >= c) {
				levels = level.get(2).getLevelName();
			} else if (count >= b) {
				levels = level.get(1).getLevelName();
			} else if (count >= a) {
				levels = level.get(0).getLevelName();
			} else {
				levels = "无等级";
			}
		}

		return levels;

	}
}
