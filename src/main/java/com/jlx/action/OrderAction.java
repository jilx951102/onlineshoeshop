package com.jlx.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradeQueryRequest;
import com.jlx.model.Comment;
import com.jlx.model.Order;
import com.jlx.model.User;
import com.jlx.service.OrderService;
import com.jlx.util.AlipayConfig;
import com.jlx.util.IDgenerate;
import com.jlx.util.PageUtil;

@Controller("orderAction")
@Scope("request")
public class OrderAction {
   
	private int currentPage;
	
	private String sFlag;
	
	private List<Order> olist;
	
	private Map<String, Object> page;
	
	private String searchName;
	
	private String orderId;
	
	private String[] orderIds;
	
	private int addFlag;
	
	private Order order;
	
    private String city;
	
	private String province;
	
	private String active;
	
	private Comment comment;
	
	@Autowired
	private OrderService orderService;
	//未发货订单
	public String stayOrder(){
		olist = orderService.gotoOrder("0");
		page =  PageUtil.page(currentPage, olist.size());
		if(olist.size()>PageUtil.COUNT){	
			page.put("orderFlag", "0");
			olist = orderService.gotoOrderDiv(page);
			page.put("olist", olist);
		}else{
			page.put("olist", olist);
		}	
		return "stayOrder";
	}
	//已发货订单
	public String alReadyOrder(){
		olist = orderService.gotoOrder("1");
		page =  PageUtil.page(currentPage, olist.size());
		if(olist.size()>PageUtil.COUNT){	
			page.put("orderFlag", "1");
			olist = orderService.gotoOrderDiv(page);
			page.put("olist", olist);
		}else{
			page.put("olist", olist);
		}	
		return "alReadyOrder";
	}
	//未收货订单
	public String collectOrder(){
		olist = orderService.gotoOrder("2");
		page =  PageUtil.page(currentPage, olist.size());
		if(olist.size()>PageUtil.COUNT){	
			page.put("orderFlag", "2");
			olist = orderService.gotoOrderDiv(page);
			page.put("olist", olist);
		}else{
			page.put("olist", olist);
		}	
		return "collectOrder";
	}
	
	public String searchStayOrder(){
		Map<String, String> map = new HashMap<String, String>();
		map.put("orderFlag", "0");
		map.put("searchName", searchName);
		olist = orderService.searchOrder(map);
		page =  PageUtil.page(currentPage, olist.size());
		if(olist.size()>PageUtil.COUNT){	
			page.put("orderFlag", "0");
			page.put("searchName", searchName);
			olist = orderService.gotoOrderDiv(page);
			page.put("olist", olist);
		}else{
			page.put("olist", olist);
		}	
		return "searchStayOrder";
	}
	
	public String searchalReadyOrder(){
		Map<String, String> map = new HashMap<String, String>();
		map.put("orderFlag", "1");
		map.put("searchName", searchName);
		olist = orderService.searchOrder(map);
		page =  PageUtil.page(currentPage, olist.size());
		if(olist.size()>PageUtil.COUNT){	
			page.put("orderFlag", "1");
			page.put("searchName", searchName);
			olist = orderService.gotoOrderDiv(page);
			page.put("olist", olist);
		}else{
			page.put("olist", olist);
		}	
		return "searchalReadyOrder";
	}
	
	public String searchCollectOrder(){
		Map<String, String> map = new HashMap<String, String>();
		map.put("orderFlag", "2");
		map.put("searchName", searchName);
		olist = orderService.searchOrder(map);
		page =  PageUtil.page(currentPage, olist.size());
		if(olist.size()>PageUtil.COUNT){	
			page.put("orderFlag", "2");
			page.put("searchName", searchName);
			olist = orderService.gotoOrderDiv(page);
			page.put("olist", olist);
		}else{
			page.put("olist", olist);
		}	
		return "searchCollectOrder";
	}
	//查看订单详情
	public String seeOrder(){
		order = orderService.getOrderById(orderId);
		city = orderService.getCity(order.getRaddress().getCityId()).getCityName();
		province = orderService.getProvince(order.getRaddress().getProvinceId()).getProvinceName();
		return "seeOrder";
		
	}
	//发货
	public String sendOrder(){
		addFlag = orderService.sendOrder(orderId);
		return "sendOrder";
	}
	
	//批量发货
	public String sendOrderAll(){
		addFlag = orderService.sendOrderAll(orderIds);
		return "sendOrder";
	}
	
	//待付款订单
	public String personStayOrder(){
		User u = (User)ServletActionContext.getRequest().getSession().getAttribute("u");
		olist = orderService.personStayOrder(u.getUserId());
		page =  PageUtil.page(currentPage, olist.size());
		if(olist.size()>PageUtil.COUNT){	
			page.put("userId", u.getUserId());
			olist = orderService.personStayOrderDiv(page);
			page.put("olist", olist);
		}else{
			page.put("olist", olist);
		}
		return "personStayOrder";
	}
	
	//个人订单信息
	public String personOrder(){
		User u = (User)ServletActionContext.getRequest().getSession().getAttribute("u");
		olist = orderService.personOrder(u.getUserId());
		page =  PageUtil.page(currentPage, olist.size());
		if(olist.size()>PageUtil.COUNT){	
			page.put("userId", u.getUserId());
			olist = orderService.personOrderDiv(page);
			page.put("olist", olist);
		}else{
			page.put("olist", olist);
		}
		return "personOrder";	
	}
	public String personBuy(){
		User u = (User)ServletActionContext.getRequest().getSession().getAttribute("u");
		olist = orderService.personBuy(u.getUserId());
		page =  PageUtil.page(currentPage, olist.size());
		if(olist.size()>PageUtil.COUNT){	
			page.put("userId", u.getUserId());
			olist = orderService.personBuyDiv(page);
			page.put("olist", olist);
		}else{
			page.put("olist", olist);
		}
		return "personBuy";
	}
	
	//收货
	public String receiveOrder(){
		addFlag = orderService.receiveOrder(orderId);
		return "receiveOrder";
	}
	//去品论
	public String gotoComment(){		
		return "gotoComment";
	}
	//评论
	public String comment(){
		User u = (User)ServletActionContext.getRequest().getSession().getAttribute("u");
		comment.setOrderId(orderId);
		comment.setCommentId(IDgenerate.next());
		comment.setUserId(u.getUserId());
		addFlag = orderService.comment(comment);
		return "comment";
	}
	
	
	public String gotoOrder(){
		User u = (User)ServletActionContext.getRequest().getSession().getAttribute("u");
		orderService.initRemind(u.getUserId());
		return stayOrder();
	}
	
	
	
	//notify_url
	public void changeBuyStatus() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用
			//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		boolean signVerified = false;
		try {
			 signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key,AlipayConfig.charset,AlipayConfig.sign_type);;
		} catch (AlipayApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //调用SDK验证签名
     
		if(signVerified) {//验证成功
			//商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		
			//支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
		
			//交易状态
			String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
			
			if(trade_status.equals("TRADE_FINISHED")){
				
			}else if (trade_status.equals("TRADE_SUCCESS")){
				orderService.updatePayFlag(out_trade_no);
			}			
			response.getWriter().print("success");
			
		}else {//验证失败
			response.getWriter().print("fail");

		}
	}
	
	public String orderDel(){
		addFlag = orderService.orderDel(orderId);
		return "orderDel";
	}
	
    public String orderDelAll(){
    	addFlag = orderService.orderDelAll(orderIds);
		return "orderDel";
	} 
	
   /*************get set**********************/
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getsFlag() {
		return sFlag;
	}

	public void setsFlag(String sFlag) {
		this.sFlag = sFlag;
	}

	public List<Order> getOlist() {
		return olist;
	}

	public void setOlist(List<Order> olist) {
		this.olist = olist;
	}

	public Map<String, Object> getPage() {
		return page;
	}

	public void setPage(Map<String, Object> page) {
		this.page = page;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String[] getOrderIds() {
		return orderIds;
	}
	public void setOrderIds(String[] orderIds) {
		this.orderIds = orderIds;
	}
	public int getAddFlag() {
		return addFlag;
	}
	public void setAddFlag(int addFlag) {
		this.addFlag = addFlag;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
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
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	
}
