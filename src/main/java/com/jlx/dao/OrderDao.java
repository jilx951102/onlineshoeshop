package com.jlx.dao;

import java.util.List;
import java.util.Map;

import com.jlx.model.Chart;
import com.jlx.model.City;
import com.jlx.model.Comment;
import com.jlx.model.Order;
import com.jlx.model.Province;
import com.jlx.model.Rank;

public interface OrderDao {
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
	Chart getchartByid(String typeId);
	int addChart(Chart chart);
	int addtoChart(Chart chart);
	Rank getRankById(String shoeId);
	int addRank(Rank rank);
	int addtoRank(Rank rank);
	City getCity(int cityId);
	/**
	 * 查找省份
	 * @param provinceId
	 * @return
	 */
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
	//添加订单提醒
	int addOrdertoremind(int addOrder);
	//新增评论提醒
	int addcommenttoremind();
	
	int initRemind(String userId);
	
	int updatePayFlag(String orderId);
	
	//待付款
	List<Order> personStayOrder(String userId);
	
	List<Order> personStayOrderDiv(Map<String, Object> map);
	
	int orderDel(String orderId);
	
	int addShoeNum(String orderId);
	
	int outPay(String orderId);
	
	Order getOrderInfo(String orderId);
	
}
