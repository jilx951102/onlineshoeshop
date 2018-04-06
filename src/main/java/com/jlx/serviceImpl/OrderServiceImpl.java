package com.jlx.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jlx.dao.OrderDao;
import com.jlx.model.Chart;
import com.jlx.model.City;
import com.jlx.model.Comment;
import com.jlx.model.Order;
import com.jlx.model.Province;
import com.jlx.model.Rank;
import com.jlx.service.OrderService;
import com.jlx.util.IDgenerate;
@Service("orderService")
public class OrderServiceImpl implements OrderService{
    @Autowired
	private OrderDao orderDao;

	public List<Order> gotoOrder(String orderFlag) {
		return orderDao.gotoOrder(orderFlag);
	}

	public List<Order> gotoOrderDiv(Map<String, Object> map) {
		return orderDao.gotoOrderDiv(map);
	}

	public List<Order> searchOrder(Map<String, String> map) {
		return orderDao.searchOrder(map);
	}

	public List<Order> searchOrderDiv(Map<String, Object> map) {
		return orderDao.searchOrderDiv(map);
	}

	public Order getOrderById(String orderId) {
		return orderDao.getOrderById(orderId);
	}

	public int sendOrder(String orderId) {
		return orderDao.sendOrder(orderId);
	}
    @Transactional
	public int receiveOrder(String orderId) {
		Order order = orderDao.getOrderById(orderId);
		Chart chart = orderDao.getchartByid(order.getShoe().getTypeId());
		if(chart==null){
		   	chart = new Chart();
		   	chart.setChartId(IDgenerate.next());
		   	chart.setSellMoney(order.getOrderMoney());
			chart.setSellNum(order.getOrderBuynum());
			chart.setTypeId(order.getShoe().getTypeId());
			orderDao.addChart(chart);
		}else{
			chart.setSellMoney(order.getOrderMoney());
			chart.setSellNum(order.getOrderBuynum());
			orderDao.addtoChart(chart);
		}
		Rank rank = orderDao.getRankById(order.getShoeId());
		if(rank==null){
			rank = new Rank();
			rank.setShoeId(order.getShoeId());
			rank.setSellNum(order.getOrderBuynum());
			orderDao.addRank(rank);
		}else{
			rank.setSellNum(order.getOrderBuynum());
			orderDao.addtoRank(rank);
		}
		return orderDao.receiveOrder(orderId);
	}
    @Transactional
	public int sendOrderAll(String[] orderIds) {
        for (int i = 0; i < orderIds.length; i++) {
			orderDao.sendOrder(orderIds[i]);
		}
		return 1;
	}

	public City getCity(int cityId) {
		return orderDao.getCity(cityId);
	}

	public Province getProvince(int provinceId) {
		return orderDao.getProvince(provinceId);
	}

	public List<Order> personOrder(String userId) {
		return orderDao.personOrder(userId);
	}

	public List<Order> personOrderDiv(Map<String, Object> map) {
		return orderDao.personOrderDiv(map);
	}

	public List<Order> personBuy(String userId) {
		return orderDao.personBuy(userId);
	}

	public List<Order> personBuyDiv(Map<String, Object> map) {
		return orderDao.personBuyDiv(map);
	}
    @Transactional
	public int comment(Comment comment) {
		orderDao.addcommenttoremind();
		return orderDao.comment(comment);
	}

	public int initRemind(String userId) {
		return orderDao.initRemind(userId);
	}
	@Transactional
	public int updatePayFlag(String orderIds) {
		int i = orderIds.length()/12;
		String orderId = "";
        for (int j = 0; j < i; j++) {
        	if(j==(i-1)){
        		orderId = orderIds.substring(12*j);
        	}else{
        		orderId = orderIds.substring(12*j,12*(j+1));        		
        	}
        	orderDao.updatePayFlag(orderId);
        	
		}
        orderDao.addOrdertoremind(i);
		return 1;
	}

	public List<Order> personStayOrder(String userId) {
		return orderDao.personStayOrder(userId);
	}

	public List<Order> personStayOrderDiv(Map<String, Object> map) {
		return orderDao.personStayOrderDiv(map);
	}

	public int orderDel(String orderId) {	
		if(!orderDao.getOrderInfo(orderId).getPayFlag().equals("2")){
			orderDao.addShoeNum(orderId);
		};		
		return orderDao.orderDel(orderId);
	}
    @Transactional
	public int orderDelAll(String[] orderIds) {	
		for (int i = 0; i < orderIds.length; i++) {
			orderDel(orderIds[i]);
		}
		return 1;
	}

	public int outPay(String orderId) {
		return orderDao.outPay(orderId);
	}
}
