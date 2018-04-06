package com.jlx.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jlx.dao.CartDao;
import com.jlx.dao.OrderDao;
import com.jlx.dao.UserDao;
import com.jlx.model.Address;
import com.jlx.model.Cart;
import com.jlx.model.Order;
import com.jlx.model.Shoe;
import com.jlx.model.User;
import com.jlx.service.CartService;
import com.jlx.util.IDgenerate;
import com.jlx.util.Timmer;
@Service("cartService")
public class CartServiceImpl implements CartService {
    @Autowired
	private CartDao cartDao;
    @Autowired
	private UserDao userDao;
    @Autowired
  	private OrderDao orderDao;
	public List<Cart> getShoeGoods(String userId) {
		return cartDao.getShoeGoods(userId);
	}

	public List<Cart> getShoeGoodsDiv(Map<String, Object> map) {
		return cartDao.getShoeGoodsDiv(map);
	}

	public List<Order> getBuyCount(String userId) {		
		return cartDao.getBuyCount(userId);
	}

	public int addCount(Map<String, Object> map) {		
		return cartDao.addCount(map);
	}

	public int CartDel(String cartId) {
		return cartDao.cartDel(cartId);
	}
    @Transactional
	public int cartDelAll(String[] cartIds) {
		for (int i = 0; i < cartIds.length; i++) {
			cartDao.cartDel(cartIds[i]);
		}
		return 1;
	}

	public Cart getCartGoods(String cartId) {
		return cartDao.getCartGoods(cartId);
	}
    @Transactional
	public String saveRaddress(String shoeIds, String cartIdses, String buyNums, String moneys, Address address,String save,User u) {
		String addressId = IDgenerate.next();
    	address.setAddressId(addressId);
		address.setUserId(u.getUserId());
    	if ("1".equals(save)) {
			userDao.addAddress(address);
		}    	
		userDao.addAddress2(address);
		
		return addOrder(shoeIds, cartIdses, buyNums, moneys, u, addressId);
	}
    @Transactional
    public String saveRaddress1(String shoeIds, String cartIdses, String buyNums, String moneys, User u,String addressId){
    	Address address = userDao.getAddressById(addressId);
    	address.setAddressId(IDgenerate.next());
    	userDao.addAddress2(address);
    	return addOrder(shoeIds, cartIdses, buyNums, moneys, u, address.getAddressId());
    }
    
    @Transactional
    public String addOrder(String shoeIds, String cartIdses, String buyNums, String moneys, User u,String addressId){
    	String payId = "";
    	String[] shoeId = shoeIds.split(",");
		String[] cartId = cartIdses.split(",");
		String[] buyNum = buyNums.split(",");
		String[] orderMoney = moneys.split(",");
		Shoe shoe = new Shoe();
		for (int i = 0; i < cartId.length; i++) {
			cartDao.cartDel(cartId[i]);
		}
		for (int i = 0; i < shoeId.length; i++) {
			shoe.setShoeId(shoeId[i]);
			shoe.setShoeStock(Integer.parseInt(buyNum[i]));	
			cartDao.cutShoe(shoe);
		}
		Order order = new Order();
		for (int i = 0; i < orderMoney.length; i++) {
			String  id =IDgenerate.order();
			payId+= id;
			order.setOrderId(id);
			order.setOrderBuynum(Integer.parseInt(buyNum[i]));
			order.setShoeId(shoeId[i]);
			order.setUserId(u.getUserId());
			order.setOrderMoney(Float.parseFloat(orderMoney[i]));
			order.setAddressId(addressId);
			cartDao.addOrder(order);
			//设置订单的付款期限
			Timmer.outPayTimer(id, orderDao);
		}
		//orderDao.addOrdertoremind(orderMoney.length);
    	return payId;
    }

}
