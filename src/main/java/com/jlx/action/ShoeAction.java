package com.jlx.action;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jlx.model.Address;
import com.jlx.model.Answer;
import com.jlx.model.Cart;
import com.jlx.model.City;
import com.jlx.model.Comment;
import com.jlx.model.Level;
import com.jlx.model.Order;
import com.jlx.model.Province;
import com.jlx.model.Shoe;
import com.jlx.model.Type;
import com.jlx.model.User;
import com.jlx.service.CartService;
import com.jlx.service.ShoeService;
import com.jlx.service.UserService;
import com.jlx.util.DateConventor;
import com.jlx.util.ExportExcelUtil;
import com.jlx.util.IDgenerate;
import com.jlx.util.PageUtil;
import com.jlx.util.PeopleUtil;
import com.jlx.util.PlaceUtil;
import com.jlx.util.uploadUtil;

@Controller("shoeAction")
@Scope("request")
public class ShoeAction {
	//file代表前台input域的name
    private File shoePicture;
    
    private String shoePictureFileName; //文件的文件名
    
    private String shoePictureContentType; //文件的类型
	
    private String typeName;
    
    private Type type;	
    
    private int buyNum;
    
	private String[] typeIds;
    
    private String[] shoeIds;
    
    private String typeId;
    
    private String shoeName;
    
    private int addflag;
    
    private int currentPage;
        
    private List<Type> list;
    
    private List<Shoe> shoeList;
    
    private String ts;//类别搜索的标志
    
    private String ss;//鞋搜索的标志
    
    private Shoe shoe;
    
    private Map<String,Object> page ;
    
    private String shoeId;
    
    private String shoeFlag;
    
    private String liActive;
    
    private String searchName;
    
    private List<Cart> clist;
    
    private float levelCut;
    
    private List<Address> aList;
	
	private List<Province> plist;
	
	private List<Cart> cartList;
	
	private String city;
	
	private String province;
	
    private  List<Comment> cList;
    
    @Autowired
    private ShoeService shoeService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
	private CartService cartService;
    
	public String addType(){
		type = new Type();
		type.setTypeId(IDgenerate.next());
		type.setTypeName(typeName);
		addflag = shoeService.addType(type) ;
		return "addType";
	}
    //获取当前页的数据
	public String getTypes(){
		page = new Hashtable<String, Object>();
		page.put("typeName", typeName==null?"":typeName);
		page.put("ts", ts==null?"":ts);	
		list = shoeService.getAllTypeBytypeName(page);				
		page = PageUtil.page(currentPage, list.size());
		page.put("ts", ts==null?"":ts);	
		page.put("typeName", typeName==null?"":typeName);
		page.put("typeList", list.size()>PageUtil.COUNT?shoeService.getTypes(page):list);	
		return "getType";
	}
	public String initType(){
		page = new Hashtable<String, Object>();	
		list = shoeService.getAllType();					
		page = PageUtil.page(currentPage, list.size());
		page.put("ts","");
		page.put("typeName","");
		page.put("typeList", list.size()>PageUtil.COUNT?shoeService.getTypes(page):list);	
		return "initType";
	}
	/**
	 * 查看类别详情
	 * @return
	 */
	public String typeInfo(){
		type = shoeService.typeInfo(typeId);
		return "typeInfo";
	}
	/**
	 * 修改类别
	 * @return
	 */
	public String typeEdit(){
		type = shoeService.typeInfo(typeId);
		return "typeEdit";
	}
	
	public String editType(){
		addflag = shoeService.TypeEdit(typeId, typeName);
		return "editType";
	}
	/**
	 * 删除单个类别
	 * @return
	 */
	public String typeDel(){
		addflag = shoeService.typeDel(typeId);
		return "typeDel";		
	}
	//批量删除
	public String delAllType(){
		List<String> s = shoeService.findType(typeIds);
		if(s.size()>0){
		   list = shoeService.findTypeById(s);
		   return "delAllType";
		}else{
			addflag = shoeService.delAllType(typeIds);
			return "delAllType";
		}
			
	}
	//初期进入商品添加画面，先去查询所有的商品类别
	public String initAddShoe(){
		list = shoeService.getAllType();
		return "initAddShoe";
	}
	//添加鞋
	public String addShoe() throws IOException{
		String path = uploadUtil.tupian.upload(shoePicture, shoePictureFileName);
		shoe.setShoeId(IDgenerate.next());
		shoe.setShoePicture(path);
		addflag= shoeService.addShoe(shoe);
		return "addShoe";
	}
	//初期进入上架鞋的画面
	public String initShoeOnline(){
		list = shoeService.getAllType();
		shoeList = shoeService.getOnlineShoe();
		page = PageUtil.page(currentPage, shoeList.size());
		if(shoeList.size()>PageUtil.COUNT){	
			shoeList = shoeService.getOnlineShoeDiv(page);
			page.put("shoeList", shoeList);
		}else{
			page.put("shoeList", shoeList);
		}
		return "initShoeOnlone";		
	}
	//搜索鞋的action
	public String searchShoe(){
		list = shoeService.getAllType();
		shoe = new Shoe();
		shoe.setTypeId(typeId.equals("0")?"":typeId);
		shoe.setShoeName(shoeName);
		shoeList = shoeService.searchOnlineShoe(shoe);
		page = PageUtil.page(currentPage, shoeList.size());
		if(shoeList.size()>PageUtil.COUNT){	
			page.put("typeId", typeId.equals("0")?"":typeId);
			page.put("shoeName", shoeName);
			shoeList = shoeService.searchOnlineShoeDiv(page);
			page.put("shoeList", shoeList);
		}else{
			page.put("shoeList", shoeList);
		}
		return "searchShoe";		
	}
	//查看上架鞋的详细信息
	public String watchonLineshoe(){
		shoe = new Shoe();
		shoe.setShoeId(shoeId);
		shoe = shoeService.watchshoe(shoe);		
		return "watchonLineshoe";		
	}
	//下架鞋
	public String shoeOff(){
		addflag = shoeService.shoeOff(shoeId);
		return "shoeOff";
		
	}
	//进入鞋的编辑画面
	public String onShoeEdit(){
		list = shoeService.getAllType();
		shoe = new Shoe();
		shoe.setShoeId(shoeId);
		shoe = shoeService.watchshoe(shoe);	
		return "onShoeEdit";
	}
	public String editShoe() throws IOException{		
		if(shoePicture!=null){
		   uploadUtil.tupian.upload2(shoePicture, shoe.getShoePicture());
		}
		addflag = shoeService.editShoe(shoe);
		return "editShoe";
	}
	
	public String offShoeAll(){
        addflag = shoeService.offShoeAll(shoeIds);
		return "offShoeAll";		
	}
	

	//导出所有上架鞋子信息
	public void exportExcel() throws Exception {
		
		// 初始化HttpServletResponse对象
		HttpServletResponse response = ServletActionContext.getResponse();
		
		// 定义表的标题
		String title = "上架鞋子一览";
		
		//定义表的列名
		String[] rowsName = new String[] { "序号","类别", "名称", "描述", "价格(元)", "库存(双)",
				"创建时间"};
		
		//定义表的内容
		List<Object[]> dataList = new ArrayList<Object[]>();
		Object[] objs = null;
		//去数据库查询导出的内容
		List<Shoe> listShoe = shoeService.getOnlineShoe();
		for (int i = 0; i < listShoe.size(); i++) {
			Shoe shoe = listShoe.get(i);
			objs = new Object[rowsName.length];
			//序号
			objs[0] = i+1;
			objs[1] = shoe.getTypeName();
			objs[2] = shoe.getShoeName();
			objs[3] = shoe.getShoeDesc();
			objs[4] = shoe.getShoePrice();
			objs[5] = shoe.getShoeStock();
			objs[6] = DateConventor.format(shoe.getShoeTime());
			dataList.add(objs);
		}
		
		// 创建ExportExcel对象
		ExportExcelUtil ex = new ExportExcelUtil (title, rowsName, dataList);

		// 输出Excel文件
		try {
			OutputStream output = response.getOutputStream();
			response.reset();
			response.setHeader("Content-disposition",
					"attachment; filename=shoelist.xls");
			response.setContentType("application/msexcel");
			ex.export(output);
			output.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//return "tolist";// 返回列表显示
	}
	//初期进入下架鞋的界面
	public String initShoeOutline(){
		list = shoeService.getAllType();
		shoeList = shoeService.getOutlineShoe();
		page = PageUtil.page(currentPage, shoeList.size());
		if(shoeList.size()>PageUtil.COUNT){	
			shoeList = shoeService.getOutlineShoeDiv(page);
			page.put("shoeList", shoeList);
		}else{
			page.put("shoeList", shoeList);
		}
		return "initShoeOutline";		
	}
	//搜索下架鞋的action
	public String searchOutLineShoe(){
		list = shoeService.getAllType();
		shoe = new Shoe();
		shoe.setTypeId(typeId.equals("0")?"":typeId);
		shoe.setShoeName(shoeName);
		shoeList = shoeService.searchOutlineShoe(shoe);
		page = PageUtil.page(currentPage, shoeList.size());
		if(shoeList.size()>PageUtil.COUNT){	
			page.put("typeId", typeId.equals("0")?"":typeId);
			page.put("shoeName", shoeName);
			shoeList = shoeService.searchOutlineShoeDiv(page);
			page.put("shoeList", shoeList);
		}else{
			page.put("shoeList", shoeList);
		}
		return "searchOutLineShoe";		
	}
	//上架鞋
	public String shoeOn(){
		addflag = shoeService.shoeOn(shoeId);
		return "shoeOn";		
	}
	//删除鞋
	public String shoeDel(){
		addflag = shoeService.shoeDel(shoeId);
		return "shoeDel";
	}
	//批量上架
	public String shoeOnAll(){
		addflag = shoeService.shoeOnAll(shoeIds);
		return "shoeOnAll";
		
	}
	//批量删除
    public String shoeDelAll(){
    	addflag = shoeService.shoeDelAll(shoeIds);
		return "shoeDelAll";		
	}
	//导出所有下架鞋子信息
	public void exportExcel2() throws Exception {
		
		// 初始化HttpServletResponse对象
		HttpServletResponse response = ServletActionContext.getResponse();
		
		// 定义表的标题
		String title = "下架鞋子一览";
		
		//定义表的列名
		String[] rowsName = new String[] { "序号","类别", "名称", "描述", "价格(元)", "库存(双)",
				"创建时间"};
		
		//定义表的内容
		List<Object[]> dataList = new ArrayList<Object[]>();
		Object[] objs = null;
		//去数据库查询导出的内容
		List<Shoe> listShoe = shoeService.getOutlineShoe();
		for (int i = 0; i < listShoe.size(); i++) {
			Shoe shoe = listShoe.get(i);
			objs = new Object[rowsName.length];
			//序号
			objs[0] = i+1;
			objs[1] = shoe.getTypeName();
			objs[2] = shoe.getShoeName();
			objs[3] = shoe.getShoeDesc();
			objs[4] = shoe.getShoePrice();
			objs[5] = shoe.getShoeStock();
			objs[6] = DateConventor.format(shoe.getShoeTime());
			dataList.add(objs);
		}
		
		// 创建ExportExcel对象
		ExportExcelUtil ex = new ExportExcelUtil (title, rowsName, dataList);

		// 输出Excel文件
		try {
			OutputStream output = response.getOutputStream();
			response.reset();
			response.setHeader("Content-disposition",
					"attachment; filename=shoelist.xls");
			response.setContentType("application/msexcel");
			ex.export(output);
			output.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public String searchByType(){
		shoeList = shoeService.getShoeBytypeName(typeName);
		page = PageUtil.page2(currentPage, shoeList.size());
		getCommon();
		if(shoeList.size()>PageUtil.COUNT2){	
			page.put("typeName", typeName);
			shoeList = shoeService.getShoeBytypeNameDiv(page);
			page.put("shoeList", shoeList);
		}else{
			page.put("shoeList", shoeList);
		}
		return "searchByType";		
	}
	//获取鞋的详细信息
	public String getShowById(){
		getCommon();
		shoe = new Shoe();
		shoe.setShoeId(shoeId);
		shoe = shoeService.watchshoe(shoe);
		cList = shoeService.getCommentByShoeId(shoeId);
		page = PageUtil.page(currentPage, cList.size());
		if(cList.size()>PageUtil.COUNT){	
			page.put("shoeId", shoeId);
			cList = shoeService.getCommentByShoeIdDiv(page);
			
		}
		if(cList.size()>0){
			for (int i = 0; i < cList.size(); i++) {
				System.out.println(cList.get(i).getAnswerId());
				if(cList.get(i).getAnswerId()!=null){
					Answer answer = shoeService.getAnswerById(cList.get(i).getAnswerId());
					cList.get(i).setUser2(shoeService.getUserById(answer.getUserId()));	
				}				
			}			
		}
		page.put("cList", cList);
		return "getShowById";
	}
	//添加商品到购物车
	public String addIntoCart(){
		User u = (User)ServletActionContext.getRequest().getSession().getAttribute("u");
		if(u==null){
			addflag =3;
		}else{
			addflag = shoeService.addIntoCart(shoeId, u.getUserId(), buyNum);
		}
		return "addIntoCart";
		
	}
	
	public String searchShoeFront(){
		getCommon();
		shoeList = shoeService.searchShoeFront(searchName.trim());
		page = PageUtil.page2(currentPage, shoeList.size());
		if(shoeList.size()>PageUtil.COUNT2){	
			page.put("searchName",searchName.trim());
			shoeList = shoeService.searchShoeFrontDiv(page);
			page.put("shoeList", shoeList);
		}else{
			page.put("shoeList", shoeList);
		}
		return "searchShoeFront";
	}
	
	public String gointocart(){
		User u = (User)ServletActionContext.getRequest().getSession().getAttribute("u");
		if(u==null){
			addflag = 2;
		}else{
			addflag =1;
		}
		return "gointocart";
	}
	
	public String gotoBuy() throws JSONException, IOException{
		shoe = new Shoe();
		shoe.setShoeId(shoeId);
		shoe = shoeService.watchshoe(shoe);
		Cart cart = new Cart();
		cart.setShoe(shoe);
		cart.setShoeId(shoeId);
		cart.setCartBuynum(buyNum);
		cartList = new ArrayList<Cart>();
		cartList.add(cart);
		getCommon();
		User u = (User) ServletActionContext.getRequest().getSession().getAttribute("u");
		List<Order> l = cartService.getBuyCount(u.getUserId());
		List<Level> ll = userService.initLevel();
		setLevelCut(PeopleUtil.getLevelCount(ll, l));
		setaList(userService.getAllAddress(u.getUserId()));
		plist = userService.getAllProvince();
		org.json.JSONObject json = PlaceUtil.getPath();
		for (int i = 0; i < plist.size(); i++) {
			if(json.get("province").equals(plist.get(i).getProvinceName())){
				List<City> clist = new ArrayList<City>();
				clist = userService.getCityByProvince(plist.get(i).getProvinceId());
				ServletActionContext.getRequest().setAttribute("clist", clist);
			}
		}
		setCity(json.getString("city"));
		setProvince(json.getString("province"));
		return "gotoBuy";
	}
	
	//获得header里面的购物车件数
	public void getCommon(){
		User u = (User)ServletActionContext.getRequest().getSession().getAttribute("u");
		if(u!=null){
			int cartCount =userService.getCartCount(u.getUserId());
			ServletActionContext.getRequest().getSession().setAttribute("cartCount",cartCount);
		}
	}
	
	public String gotoShoe(){
		User u = (User)ServletActionContext.getRequest().getSession().getAttribute("u");
		shoeService.initRemind(u.getUserId());
		return initShoeOnline();
	}

	
	/************getter和setter*****************************/
	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}


	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public int getAddflag() {
		return addflag;
	}
	public Map<String, Object> getPage() {
		return page;
	}
	public void setPage(Map<String, Object> page) {
		this.page = page;
	}
	public void setAddflag(int addflag) {
		this.addflag = addflag;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getTs() {
		return ts;
	}
	public void setTs(String ts) {
		this.ts = ts;
	}
	public List<Type> getList() {
		return list;
	}
	public void setList(List<Type> list) {
		this.list = list;
	}
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public String[] getTypeIds() {
		return typeIds;
	}
	public void setTypeIds(String[] typeIds) {
		this.typeIds = typeIds;
	}
	public File getShoePicture() {
		return shoePicture;
	}
	public void setShoePicture(File shoePicture) {
		this.shoePicture = shoePicture;
	}
	public String getShoePictureFileName() {
		return shoePictureFileName;
	}
	public void setShoePictureFileName(String shoePictureFileName) {
		this.shoePictureFileName = shoePictureFileName;
	}
	public String getShoePictureContentType() {
		return shoePictureContentType;
	}
	public void setShoePictureContentType(String shoePictureContentType) {
		this.shoePictureContentType = shoePictureContentType;
	}
	public Shoe getShoe() {
		return shoe;
	}
	public void setShoe(Shoe shoe) {
		this.shoe = shoe;
	}
	public List<Shoe> getShoeList() {
		return shoeList;
	}
	public void setShoeList(List<Shoe> shoeList) {
		this.shoeList = shoeList;
	}
	public String getShoeName() {
		return shoeName;
	}
	public void setShoeName(String shoeName) {
		this.shoeName = shoeName;
	}
	public String getSs() {
		return ss;
	}
	public void setSs(String ss) {
		this.ss = ss;
	}
	public String getShoeId() {
		return shoeId;
	}
	public void setShoeId(String shoeId) {
		this.shoeId = shoeId;
	}
	public String getShoeFlag() {
		return shoeFlag;
	}
	public void setShoeFlag(String shoeFlag) {
		this.shoeFlag = shoeFlag;
	}
	public String[] getShoeIds() {
		return shoeIds;
	}
	public void setShoeIds(String[] shoeIds) {
		this.shoeIds = shoeIds;
	}
	public String getLiActive() {
		return liActive;
	}
	public void setLiActive(String liActive) {
		this.liActive = liActive;
	}
	public int getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public float getLevelCut() {
		return levelCut;
	}
	public void setLevelCut(float levelCut) {
		this.levelCut = levelCut;
	}
	public List<Address> getaList() {
		return aList;
	}
	public void setaList(List<Address> aList) {
		this.aList = aList;
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
	public List<Cart> getCartList() {
		return cartList;
	}
	public void setCartList(List<Cart> cartList) {
		this.cartList = cartList;
	}
	public List<Cart> getClist() {
		return clist;
	}
	public void setClist(List<Cart> clist) {
		this.clist = clist;
	}
	public List<Comment> getcList() {
		return cList;
	}
	public void setcList(List<Comment> cList) {
		this.cList = cList;
	}
	
	

}
