package com.jlx.service;

import java.util.List;
import java.util.Map;

import com.jlx.model.Address;
import com.jlx.model.Cart;
import com.jlx.model.Order;
import com.jlx.model.User;

public interface CartService {
	/**
	 * 进入购物车的分页
	 * @param userId
	 * @return
	 */
	List<Cart> getShoeGoods(String userId);
	
	List<Cart> getShoeGoodsDiv(Map<String, Object> map);
	
	List<Order> getBuyCount(String userId);
	
	int addCount(Map<String,Object> map);
	
	int CartDel(String cartId);
	
	int cartDelAll(String[] cartIds);
	
	Cart getCartGoods(String cartId);
	 /**
     * 确认订单
     * @param shoeIds
     * @param cartIdses
     * @param buyNums
     * @param moneys
     * @param address
     * @return
     */
	String saveRaddress(String shoeIds,String cartIdses,String buyNums,String moneys,Address address,String save,User u);
	String saveRaddress1(String shoeIds, String cartIdses, String buyNums, String moneys, User u,String addressId);
}
