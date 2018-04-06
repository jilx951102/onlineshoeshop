package com.jlx.service;

import java.util.List;
import java.util.Map;

import com.jlx.model.City;
import com.jlx.model.Comment;
import com.jlx.model.Order;
import com.jlx.model.Province;

public interface OrderService {

	  /**
     * 进入订单界面
     * @param orderFlag
     * @return
     */
	List<Order> gotoOrder(String orderFlag);
	/**
	 * 进入订单界面的分页
	 * @param map
	 * @return
	 */
	List<Order> gotoOrderDiv(Map<String, Object> map);
	/**
	 * 订单界面的查询
	 * @param map
	 * @return
	 */
	List<Order> searchOrder(Map<String, String> map);
	/**
	 * 查询的分页
	 * @param map
	 * @return
	 */
	List<Order> searchOrderDiv(Map<String, Object> map);
	/**
	 * 查看订单详情
	 * @param orderId
	 * @return
	 */
	Order getOrderById(String orderId);
	/**
	 * 发货
	 * @param orderId
	 * @return
	 */
	int sendOrder(String orderId);
	/**
	 * 收货
	 * @param orderId
	 * @return
	 */
	int receiveOrder(String orderId);
	/**
	 * 批量发货
	 * @param orderIds
	 * @return
	 */
	int sendOrderAll(String[] orderIds);
	City getCity(int cityId);
	Province getProvince(int provinceId);
	/**
	 * 个人订单
	 * @param userId
	 * @return
	 */
	List<Order> personOrder(String userId);
	List<Order> personOrderDiv(Map<String, Object> map);
	/**
	 * 个人购买记录
	 * @param userId
	 * @return
	 */
	List<Order> personBuy(String userId);
	List<Order> personBuyDiv(Map<String, Object> map);
	/**
	 * 评论
	 * @param comment
	 * @return
	 */
	int comment(Comment comment);
	
	int initRemind(String userId);
	
	int updatePayFlag(String orderIds);
	//待付款
	List<Order> personStayOrder(String userId);
	
	List<Order> personStayOrderDiv(Map<String, Object> map);
	
	int orderDel(String orderId);
	
	int orderDelAll(String[] orderIds);
	//超过付款时间
	int outPay(String orderId);
}
