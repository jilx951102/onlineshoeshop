package com.jlx.util;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpSession;

import com.jlx.dao.OrderDao;
import com.jlx.model.Order;

public class Timmer{
	
	
	public static void timer(final HttpSession session){
		System.out.println("我进来了,过5分钟后清空code");
		Timer timer = new Timer();
		timer.schedule(new TimerTask() {
			public void run() {
				session.removeAttribute("code");				
			}
		},1000*60*5);
		
	}
	
	public static void outPayTimer(final String orderId,final OrderDao orderDao){
		final Timer timer = new Timer();
		System.out.println("我开始控制这件商品的生命了");
		timer.schedule(new TimerTask() {

			public void run() {
				
				Order o = orderDao.getOrderInfo(orderId);
				System.out.println(new Date().getTime() - o.getOrderTime().getTime());
				if(o.getPayFlag().equals("1")){
					System.out.println("我结束运行了1"+"商品"+o.getOrderId());
					timer.cancel();					
				}else if (o.getDelFlag() =='1'){
					System.out.println("我结束运行了3"+"商品"+o.getOrderId());
					timer.cancel();	
				}else if (new Date().getTime() - o.getOrderTime().getTime()>=10*60*1000){
					orderDao.outPay(orderId);
					orderDao.addShoeNum(orderId);
					System.out.println("我结束运行了2"+"商品"+o.getOrderId());
					timer.cancel();	
				}	
			}
		}, 1000*60*5, 1000*60*5);
	}
	
	
 public static void main(String[] args) {
	System.out.println(new Date().getTime()-new Date().getTime());
}


	
}
