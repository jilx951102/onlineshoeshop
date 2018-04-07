package com.jlx.action;

import java.io.File;
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
import com.jlx.model.Chart;
import com.jlx.model.City;
import com.jlx.model.Level;
import com.jlx.model.LoginLog;
import com.jlx.model.Order;
import com.jlx.model.Province;
import com.jlx.model.Rank;
import com.jlx.model.Remind;
import com.jlx.model.User;
import com.jlx.service.CartService;
import com.jlx.service.UserService;
import com.jlx.util.DateConventor;
import com.jlx.util.IDgenerate;
import com.jlx.util.MD5util;
import com.jlx.util.Message;
import com.jlx.util.PageUtil;
import com.jlx.util.PeopleUtil;
import com.jlx.util.PlaceUtil;
import com.jlx.util.Timmer;
import com.jlx.util.uploadUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller("userAction")
@Scope("request")
public class UserAction {
	// file代表前台input域的name
	private File userPicture;

	private String userPictureFileName; // 文件的文件名

	private String userPictureContentType; // 文件的类型

	private User user;

	private String userName;

	private int levelCount;

	private int levelCount2;

	private List<Level> levelList;

	private String levels;

	private List<User> userList;

	private int currentPage;

	private String userPhone;

	private String userPassword;

	private int cartCount;

	private String liActive;

	private String shoeId;

	private int tocart;

	private int buyNum;

	private String active;

	private String userBirthday;

	@Autowired
	private UserService userService;
	@Autowired
	private CartService cartService;

	private boolean flag;

	private int addflag;

	private String codes;

	private Map<String, Object> page;
	
	private List<Province> plist;
	
	private List<City> clist;
	
	private String city;
	
	private String province;
	
	private int provinceId;
	
	private Address address;
	
	private List<Address> aList;
	
	private String addressId;
	
	private String asFlag;
	
	private String searchName;
	
	private String userId;
	
	private String userIds[];
	
	private List<Chart> chartList;
    
	private List<Chart> chartList2;
	
	private Remind remindList;
	
	private List<LoginLog> LoginLogList;
	
	private List<Rank> rankList;
	
	private String href;
	
	// 注册
	public String register() {
		user.setUserId(IDgenerate.next());
		user.setUserPassword(MD5util.MD5(user.getUserPassword().trim()));
		userService.userRegister(user);
		flag = true;
		return "register";
	}

	// 验证用户名
	public String userNameCheck() {
		flag = userService.findUserByName(user.getUserName()) > 0;
		return "userNameCheck";
	}

	// 登录
	public String login() {
		user.setUserPassword(MD5util.MD5(user.getUserPassword()));
		if (userService.login(user) != null) {			
			ServletActionContext.getRequest().getSession().setAttribute("u", userService.login(user));
				cartCount = userService.getCartCount(userService.login(user).getUserId());
				ServletActionContext.getRequest().getSession().setAttribute("cartCount", cartCount);
				if (tocart == 1) {
					href="front/cart_gotoCart";
					return "loginHref";
				}
				if (shoeId != null && buyNum != 0) {
					href = "front/shoe_getShowById?shoeId="+shoeId+"&buyNum="+buyNum;
					return "loginHref";
				}
				addflag= 1;
		}else{
			addflag =0;
		}
		return "userlogin";
	}

	// 初期进入等级画面
	public String initLevel() {
		levelList = userService.initLevel();
		return "initLevel";
	}

	// 编辑会员等级
	public String editLevel() {
		levelList = new ArrayList<Level>();
		JSONArray array = JSONArray.fromObject(levels);
		for (Object obj : array) {
			JSONObject jsonObject = (JSONObject) obj;
			// 转成Object对象
			Level level = (Level) JSONObject.toBean(jsonObject, Level.class);
			levelList.add(level);
		}
		addflag = userService.editLevel(levelList);
		return "editLevel";
	}

	// 初期进入会员一览画面
	public String initPeople() {
		levelList = userService.initLevel();
		userList = userService.initPeople();
		page = PageUtil.page(currentPage, userList.size());
		if (userList.size() < PageUtil.COUNT) {
			userList = PeopleUtil.getLevel(userList, levelList);
			page.put("userList", userList);
		} else {
			userList = userService.initPeopleDiv(page);
			userList = PeopleUtil.getLevel(userList, levelList);
			page.put("userList", userList);
		}
		return "initPeople";
	}

	// 查询会员一览画面
	public String searchPeople() {
		levelList = userService.initLevel();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("first", levelCount);
		map.put("next", levelCount2);
		userList = userService.searchPeople(map);
		page = PageUtil.page(currentPage, userList.size());
		if (userList.size() < PageUtil.COUNT) {
			userList = PeopleUtil.getLevel(userList, levelList);
			page.put("userList", userList);
		} else {
			page.put("userName", userName);
			page.put("first", levelCount);
			page.put("next", levelCount2);
			userList = userService.searchPeopleDiv(page);
			userList = PeopleUtil.getLevel(userList, levelList);
			page.put("userList", userList);
		}
		return "searchPeople";
	}

	public String getUserByName() {
		user = userService.getUserByName(userName);		
		return "getUserByName";
	}

	public String getCode() {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userid", userId);
		map.put("time", 0);
		userService.getTime(map);
		if((Integer) map.get("time")==3){
			addflag = 2;
		}else{
			String sendCode = Message.getCode();
			String jsonstr = "{\"code\":\"" + sendCode + "\"}";
			codes = Message.send(userPhone, jsonstr, Message.code, Message.signName);
			if (!"1".equals(codes)) {
				addflag = 1;
				ServletActionContext.getRequest().getSession().setAttribute("code", sendCode);
			}else{
				userService.cutTime(userId);
				addflag = 0;
			}
			Timmer.timer(ServletActionContext.getRequest().getSession());
		}
		return "getCode";
	}
	
	public String checkCode(){
		String code = (String) ServletActionContext.getRequest().getSession().getAttribute("code");
		if(codes.equals(code)){
			addflag = 1;
		}else{
			addflag=0;
		}
		return "checkCode";
	}

	public String changePass() {
		user = new User();
		user.setUserName(userName);
		user.setUserPassword(MD5util.MD5(userPassword));
		addflag = userService.changePass(user);
		return "changePass";
	}

	public String addintoCart() {
		return "addintoCart";
	}
	public String checkTobuy(){
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("u");
		if(u==null){
			addflag = 2;
		}else{
			addflag = 1;
		}
		return "checkTobuy";
	}

	public String gotoInfo() {
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("u");
		List<Order> l = cartService.getBuyCount(u.getUserId());
		List<Level> ll = userService.initLevel();
		user = userService.getUserById(u.getUserId());
		user.setLevelName(PeopleUtil.getOneLevel(ll, l));
		return "gotoInfo";
	}

	public String gotoinfoedit() {
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("u");
		user = userService.getUserById(u.getUserId());
		return "gotoinfoedit";
	}

	// 修改用户信息
	public String editInfo() throws IOException {
		if (userPicture != null && "".equals(user.getUserPicture())) {
			user.setUserPicture(uploadUtil.touxiang.upload(userPicture, userPictureFileName));
		}
		if (!"".equals(user.getUserPicture()) && userPicture != null) {
			uploadUtil.touxiang.upload2(userPicture, user.getUserPicture());
		}
		if (userBirthday != null && userBirthday != "") {
			user.setUserBirthday(DateConventor.parseString(userBirthday));
		}
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("u");
		user.setUserId(u.getUserId());
		addflag = userService.editInfo(user);
		ServletActionContext.getRequest().getSession().setAttribute("u", userService.getUserById(u.getUserId()));
		return "editInfo";
	}

	public String getOldPass() {
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("u");
		u.setUserPassword(MD5util.MD5(userPassword));
		addflag = userService.getOldPass(u);
		return "getOldPass";
	}

	public String changeonePass() {
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("u");
		u.setUserPassword(MD5util.MD5(userPassword));
		addflag = userService.changePassById(u);
		if(addflag==1){
			ServletActionContext.getRequest().getSession().removeAttribute("u");
			ServletActionContext.getRequest().getSession().invalidate();
		}
		return "changeonePass";
	}
    
	public String gotoaddress(){
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("u");
		aList = userService.getAllAddress(u.getUserId());
		page = PageUtil.page(currentPage, aList.size());
		if (aList.size() < PageUtil.COUNT) {
			page.put("aList", aList);
		} else {
			page.put("userId",u.getUserId());
			aList = userService.getAllAddressDiv(page);
			page.put("aList", aList);
		}
		
		return "gotoaddress";
	}
	public String gotoaddressedit() throws JSONException, IOException{
		plist = userService.getAllProvince();
		org.json.JSONObject json = PlaceUtil.getPath();
		for (int i = 0; i < plist.size(); i++) {
			if(json.get("province").equals(plist.get(i).getProvinceName())){
				clist = userService.getCityByProvince(plist.get(i).getProvinceId());
			}
		}
		city =  json.getString("city");
		province = json.getString("province");
		return "gotoaddressedit";
	}
	
	public String getCitybyId(){
		clist = userService.getCityByProvince(provinceId);
		return "getCitybyId";
	}
	
	public String addAddress(){
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("u");
		address.setUserId(u.getUserId());
		address.setAddressId(IDgenerate.next());
		addflag = userService.addAddress(address);
		return "addAddress";
	}
	
	public String setDefault(){
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("u");
		address = userService.getDefaultAddress(u.getUserId());
		if(address!=null){
			userService.removeDefault(address.getAddressId());
		}
		addflag = userService.setDefault(addressId);
		return "setDefault";
	}
	
	public String addressEdit2(){
		address = userService.addressEdit2(addressId);
		plist = userService.getAllProvince();
		clist = userService.getCityByProvince(address.getProvinceId());
		city =  address.getCityName();
		province = address.getProvinceName();
		return "addressEdit2";		
	}
	
	public String updateAddress(){
		address.setAddressId(addressId);
		addflag = userService.updateAddress(address);
		return "updateAddress";
	}
	
	public String addressDel(){
		addflag= userService.addressDel(addressId);
		return "addressDel";
	}
	//对管理员的操作
	public String getAllAdmin(){
		userList = userService.getAllAdmin();
		page = PageUtil.page(currentPage, userList.size());
		if (userList.size() < PageUtil.COUNT) {
			page.put("userList", userList);
		} else {
			userList = userService.getAllAdminDiv(page);
			page.put("userList", userList);
		}
		return "getAllAdmin";
	}
	
	public String searchAdmin(){
		userList = userService.searchAdmin(searchName.trim());
		page = PageUtil.page(currentPage, userList.size());
		if (userList.size() < PageUtil.COUNT) {
			page.put("userList", userList);
		} else {
			page.put("searchName", searchName.trim());
			userList = userService.searchAdminDiv(page);
			page.put("userList", userList);
		}
		return "searchAdmin";
	}
	
	public String getAdminByName(){
		User u = userService.getAdminByName(userName);
		if(u==null){
			flag =true;
		}else{
			flag = false;
		}
		return "getAdminByName";
	}
	
	public String addAdmin(){
		user.setUserId(IDgenerate.next());
		user.setLevelName(user.getUserName().trim());
		user.setUserPassword(MD5util.MD5(user.getUserPassword().trim()));
		userService.addremind(user.getUserId());
		addflag = userService.addAdmin(user);
		return "addAdmin";
	}
	public String getAdminById(){
		user = userService.getAdminById(userId);
		return "getAdminById";
	}
	public String getAdminById2(){
		user = userService.getAdminById(userId);
		return "getAdminById2";
	}
	
	public String adminEdit(){
		addflag = userService.editUser(user);
		return "adminEdit";
	}
	public String cAdminPass(){
		return "cAdminPass";
	}
	public String editAdminPass(){
		user.setUserPassword(MD5util.MD5(user.getUserPassword()));
		addflag = userService.changeAdminPass(user);
		return "editAdminPass";
	}
	public String adminDel(){
		addflag = userService.adminDel(userId);
		return "adminDel";
	}
	
	public String adminDelAll(){
		addflag = userService.adminDelAll(userIds);
		return "adminDelAll";
	}
	//管理员登录
	public String adminLogin(){
		User u = null;
		try {
			u = (User) user.clone();
		} catch (CloneNotSupportedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		u.setUserPassword(MD5util.MD5(user.getUserPassword()));
		u = userService.adminLogin(u);
		if (u != null) {
			    LoginLog l = new LoginLog();
			    l.setUserId(u.getUserId());
			    l.setLogId(IDgenerate.next());
			    userService.addLoginlog(l);
			    addflag = 1;
			    ServletActionContext.getRequest().getSession().setAttribute("u", u);
				
		} 	
		return "adminLogin";
	}
	
	public String getOldPassById(){
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("u");
		u = userService.getOldPassById(u.getUserId());
		flag = u.getUserPassword().equals(MD5util.MD5(user.getUserPassword()));
		return "getOldPassById";
	}
	
	public String adminchangPass(){
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("u");
		user.setUserId(u.getUserId());
		user.setUserPassword(MD5util.MD5(user.getUserPassword()));
		addflag =  userService.changeAdminPass(user);
		if(addflag==1){
			ServletActionContext.getRequest().getSession().removeAttribute("u");
			ServletActionContext.getRequest().getSession().invalidate();
		}
		return "adminchangPass";
	}
	
	public String loginOut(){
		ServletActionContext.getRequest().getSession().removeAttribute("u");
		ServletActionContext.getRequest().getSession().invalidate();
		return "loginOut";
	}
	
	public String out(){
		ServletActionContext.getRequest().getSession().removeAttribute("u");
		ServletActionContext.getRequest().getSession().invalidate();
		return "out";
	}
	
	//进入报表管理界面
	public String gotoChart(){
		chartList = userService.gotoChart();
		chartList2 = userService.gotoChart2();
		return "gotoChart";
	}
	
	//管理员首页的提醒
	public String getRemind(){
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("u");
		rankList = userService.getRank();
		remindList = userService.getRemind(u.getUserId());
		LoginLogList = userService.getLog();
		return "getRemind";
	}
	
	public String getMoreSale(){
		rankList = userService.getRank();
		return "getMoreSale";
	}
	
	public String getMoreLogin(){
		LoginLogList = userService.getLog();
		return "getMoreLogin";
	}
	
	public String gotoUser(){
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("u");
		userService.initRemind(u.getUserId());
		return initPeople();
	}
	/************ get，set *******************/
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean getFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public List<Level> getLevelList() {
		return levelList;
	}

	public void setLevelList(List<Level> levelList) {
		this.levelList = levelList;
	}

	public String getLevels() {
		return levels;
	}

	public void setLevels(String levels) {
		this.levels = levels;
	}

	public int getAddflag() {
		return addflag;
	}

	public void setAddflag(int addflag) {
		this.addflag = addflag;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Map<String, Object> getPage() {
		return page;
	}

	public void setPage(Map<String, Object> page) {
		this.page = page;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getLevelCount() {
		return levelCount;
	}

	public void setLevelCount(int levelCount) {
		this.levelCount = levelCount;
	}

	public int getLevelCount2() {
		return levelCount2;
	}

	public void setLevelCount2(int levelCount2) {
		this.levelCount2 = levelCount2;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getCodes() {
		return codes;
	}

	public void setCodes(String codes) {
		this.codes = codes;
	}

	public int getCartCount() {
		return cartCount;
	}

	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}

	public String getLiActive() {
		return liActive;
	}

	public void setLiActive(String liActive) {
		this.liActive = liActive;
	}

	public String getShoeId() {
		return shoeId;
	}

	public void setShoeId(String shoeId) {
		this.shoeId = shoeId;
	}

	public int getBuyNum() {
		return buyNum;
	}

	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}

	public int getTocart() {
		return tocart;
	}

	public void setTocart(int tocart) {
		this.tocart = tocart;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public File getUserPicture() {
		return userPicture;
	}

	public void setUserPicture(File userPicture) {
		this.userPicture = userPicture;
	}

	public String getUserPictureFileName() {
		return userPictureFileName;
	}

	public void setUserPictureFileName(String userPictureFileName) {
		this.userPictureFileName = userPictureFileName;
	}

	public String getUserPictureContentType() {
		return userPictureContentType;
	}

	public void setUserPictureContentType(String userPictureContentType) {
		this.userPictureContentType = userPictureContentType;
	}

	public String getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}

	public List<Province> getPlist() {
		return plist;
	}

	public void setPlist(List<Province> plist) {
		this.plist = plist;
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

	public int getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(int provinceId) {
		this.provinceId = provinceId;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<Address> getaList() {
		return aList;
	}

	public void setaList(List<Address> aList) {
		this.aList = aList;
	}

	public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}

	public String getAsFlag() {
		return asFlag;
	}

	public void setAsFlag(String asFlag) {
		this.asFlag = asFlag;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String[] getUserIds() {
		return userIds;
	}

	public void setUserIds(String userIds[]) {
		this.userIds = userIds;
	}

	public List<Chart> getChartList() {
		return chartList;
	}

	public void setChartList(List<Chart> chartList) {
		this.chartList = chartList;
	}

	public List<Chart> getChartList2() {
		return chartList2;
	}

	public void setChartList2(List<Chart> chartList2) {
		this.chartList2 = chartList2;
	}

	public Remind getRemindList() {
		return remindList;
	}

	public void setRemindList(Remind remindList) {
		this.remindList = remindList;
	}

	public List<LoginLog> getLoginLogList() {
		return LoginLogList;
	}

	public void setLoginLogList(List<LoginLog> loginLogList) {
		LoginLogList = loginLogList;
	}

	public List<Rank> getRankList() {
		return rankList;
	}

	public void setRankList(List<Rank> rankList) {
		this.rankList = rankList;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}
	

}
