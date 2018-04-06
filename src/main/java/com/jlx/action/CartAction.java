package com.jlx.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jlx.model.Address;
import com.jlx.model.Cart;
import com.jlx.model.City;
import com.jlx.model.Level;
import com.jlx.model.Order;
import com.jlx.model.Province;
import com.jlx.model.User;
import com.jlx.service.CartService;
import com.jlx.service.UserService;
import com.jlx.util.IDgenerate;
import com.jlx.util.PageUtil;
import com.jlx.util.PeopleUtil;
import com.jlx.util.PlaceUtil;
@Controller("cartAction")
@Scope("request")
public class CartAction {
    
	private List<Cart> cartList;
	
	private int currentPage;
	
	private Map<String,Object> page ;
	
	private float levelCut;
	
	private int cartBuynum;
	
	private String cartId;
	
	private String cartIdses;
	
	private int addflag;
	
	private String[] cartIds;
	
	private List<Address> aList;
	
	private List<Province> plist;
	
	private List<City> clist;
	
	private String city;
	
	private String province;
	
	private String save;
	
	private String shoeIds;
	
	private String buyNums;
	
	private String moneys;
	
	private String addressId;
	
	private Address address;
	
	private String payId;
	
	@Autowired
	private CartService cartService;
    @Autowired
    private UserService userService;
	public String gotoCart(){
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("u");
		List<Order> l = cartService.getBuyCount(u.getUserId());
		List<Level> ll = userService.initLevel();
		levelCut = PeopleUtil.getLevelCount(ll, l);
		getCommon();		
		cartList = cartService.getShoeGoods(u.getUserId());
		page =  PageUtil.page(currentPage, cartList.size());
		if(cartList.size()>PageUtil.COUNT){	
			page.put("userId", u.getUserId());
			cartList = cartService.getShoeGoodsDiv(page);
			page.put("cartList", cartList);
		}else{
			page.put("cartList", cartList);
		}
		return "gotoCart";		
	}
    
	public void addCount(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cartId", cartId);
		map.put("cartBuynum", cartBuynum);
		cartService.addCount(map);
	}
    
	public String cartDel(){		
		addflag = cartService.CartDel(cartId);
		return "cartDel";
		
	}
	
	public String cartDelAll(){
		addflag = cartService.cartDelAll(cartIds);
		return "cartDelAll";
		
	}
	
	public String gotoPay() throws JSONException, IOException{
		String[] cartIds = cartIdses.split(",");
		cartList = new ArrayList<Cart>();
		for (int i = 0; i < cartIds.length; i++) {
			cartList.add(cartService.getCartGoods(cartIds[i]));
		}
		getCommon();
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("u");
		List<Order> l = cartService.getBuyCount(u.getUserId());
		List<Level> ll = userService.initLevel();
		levelCut = PeopleUtil.getLevelCount(ll, l);
		setaList(userService.getAllAddress(u.getUserId()));
		plist = userService.getAllProvince();
		org.json.JSONObject json = PlaceUtil.getPath();
		for (int i = 0; i < plist.size(); i++) {
			if(json.get("province").equals(plist.get(i).getProvinceName())){
				setClist(userService.getCityByProvince(plist.get(i).getProvinceId()));
			}
		}
		setCity(json.getString("city"));
		setProvince(json.getString("province"));
		return "gotoPay";
	}
	
	//提交订单
	public String saveRaddress1(){
		User u = (User)ServletActionContext.getRequest().getSession().getAttribute("u");
		payId = cartService.saveRaddress1(shoeIds, cartIdses, buyNums, moneys, u, addressId);
		getCommon();
		return "saveRaddress";
	}
	
	public String saveRaddress(){
		User u = (User)ServletActionContext.getRequest().getSession().getAttribute("u");
		payId = cartService.saveRaddress(shoeIds, cartIdses, buyNums, moneys, address, save, u);
        getCommon();
        return "saveRaddress";
	}
	
	//获得header里面的购物车件数
	public void getCommon(){
		User u = (User)ServletActionContext.getRequest().getSession().getAttribute("u");
		if(u!=null){
			int cartCount =userService.getCartCount(u.getUserId());
			ServletActionContext.getRequest().getSession().setAttribute("cartCount",cartCount);
		}
	}
	
	
	
	public List<Cart> getCartList() {		
		return cartList;
	}

	public void setCartList(List<Cart> cartList) {
		this.cartList = cartList;
	}



	public int getCurrentPage() {
		return currentPage;
	}



	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}



	public Map<String,Object> getPage() {
		return page;
	}



	public void setPage(Map<String,Object> page) {
		this.page = page;
	}


	public float getLevelCut() {
		return levelCut;
	}


	public void setLevelCut(float levelCut) {
		this.levelCut = levelCut;
	}

	public int getCartBuynum() {
		return cartBuynum;
	}

	public void setCartBuynum(int cartBuynum) {
		this.cartBuynum = cartBuynum;
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public int getAddflag() {
		return addflag;
	}

	public void setAddflag(int addflag) {
		this.addflag = addflag;
	}

	public String[] getCartIds() {
		return cartIds;
	}

	public void setCartIds(String[] cartIds) {
		this.cartIds = cartIds;
	}

	public String getCartIdses() {
		return cartIdses;
	}

	public void setCartIdses(String cartIdses) {
		this.cartIdses = cartIdses;
	}

	public List<Address> getaList() {
		return aList;
	}

	public void setaList(List<Address> aList) {
		this.aList = aList;
	}

	public List<City> getClist() {
		return clist;
	}

	public void setClist(List<City> clist) {
		this.clist = clist;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public List<Province> getPlist() {
		return plist;
	}

	public void setPlist(List<Province> plist) {
		this.plist = plist;
	}

	public String getSave() {
		return save;
	}

	public void setSave(String save) {
		this.save = save;
	}

	public String getShoeIds() {
		return shoeIds;
	}

	public void setShoeIds(String shoeIds) {
		this.shoeIds = shoeIds;
	}

	public String getBuyNums() {
		return buyNums;
	}

	public void setBuyNums(String buyNums) {
		this.buyNums = buyNums;
	}

	public String getMoneys() {
		return moneys;
	}

	public void setMoneys(String moneys) {
		this.moneys = moneys;
	}

	public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getPayId() {
		return payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}
	
}
