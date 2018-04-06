package com.jlx.dao;

import java.util.List;
import java.util.Map;

import com.jlx.model.Cart;
import com.jlx.model.Order;
import com.jlx.model.Shoe;

public interface CartDao {
   
	/**
	 * 进入购物车的分页
	 * @param userId
	 * @return
	 */
	List<Cart> getShoeGoods(String userId);
	
	List<Cart> getShoeGoodsDiv(Map<String, Object> map);
	
	List<Order> getBuyCount(String userId);
	
	int addCount(Map<String,Object> map);
	 
	int cartDel(String cartId);
	
	Cart getCartGoods(String cartId);
	/**
	 * 减少鞋的库存
	 * @param shoe
	 * @return
	 */
	int cutShoe(Shoe shoe);
	/**
	 * 生成订单
	 * @param order
	 * @return
	 */
	int addOrder(Order order);
}
