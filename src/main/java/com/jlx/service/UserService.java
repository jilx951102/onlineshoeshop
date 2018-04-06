package com.jlx.service;


import java.util.List;
import java.util.Map;

import com.jlx.model.Address;
import com.jlx.model.Chart;
import com.jlx.model.City;
import com.jlx.model.Level;
import com.jlx.model.LoginLog;
import com.jlx.model.Province;
import com.jlx.model.Rank;
import com.jlx.model.Remind;
import com.jlx.model.User;

public interface UserService {
	//用户注册
	int userRegister(User user);
	//检查用户名是否唯一
	int findUserByName(String userName);
	//登录
	User login(User user);
	/**
	 * 初期进入等级管理页面
	 * @return
	 */
	List<Level> initLevel();
	/**
	 * 修改level信息
	 * @param level
	 * @return
	 */
    int editLevel(List<Level> list);
    /**
     * 初期进入会员管理页面
     * @return
     */
    List<User> initPeople();
    List<User> initPeopleDiv(Map<String,Object> map);
    /**
     * 查询会员
     * @param map
     * @return
     */
    List<User> searchPeople(Map<String,Object> map);
    List<User> searchPeopleDiv(Map<String,Object> map);
    User getUserByName(String userName);
    int changePass(User user);
    /**
     * 获取用户购物车的数量
     * @param userId
     * @return
     */
    int getCartCount(String userId);
    /**
     * 根据用户id获取用户信息
     * @param userId
     * @return
     */
    User getUserById(String userId);
    /**
     * 修改信息
     * @param user
     * @return
     */
    int editInfo(User user);
    /**
     * 获取旧密码
     * @param user
     * @return
     */
    int getOldPass(User user);
    /**
     * 修改密码
     * @param user
     * @return
     */
    int changePassById(User user);
    /**
     * 收货地址
     * @return
     */
    List<Province> getAllProvince();
    List<City> getCityByProvince(int provinceId);
    /**
     * 添加新的收获地址
     * @param address
     * @return
     */
    int addAddress(Address address);
    /**
     * 获取用户的所有收获地址
     * @param userId
     * @return
     */
    List<Address> getAllAddress(String userId);
    List<Address> getAllAddressDiv(Map<String,Object> map);
    /**
     * 对地址的操作
     * @param userId
     * @return
     */
    Address getDefaultAddress(String userId);
    int removeDefault(String addressId);
    int setDefault(String addressId);
    Address addressEdit2(String addressId);
    int updateAddress(Address address);
    int addressDel(String addressId);
    //对管理员的操作
    List<User> getAllAdmin();
    List<User> getAllAdminDiv(Map<String,Object> map);
    List<User> searchAdmin(String searchName);
    List<User> searchAdminDiv(Map<String,Object> map);
    User getAdminById(String userId);
    User getAdminByName(String userName);
    int addAdmin(User user);
    int addremind(String userId);
    int editUser(User user);
    int adminDel(String userId);
    int adminDelAll(String[] userIds);
    int changeAdminPass(User user);
    //管理员登录
    User adminLogin(User user);
    int addLoginlog(LoginLog loginLog);
    User getOldPassById(String userId);
    /**
     * 进入销售报表界面
     * @return
     */
    List<Chart> gotoChart();
    List<Chart> gotoChart2();
    /**
     * 提醒
     * @param userId
     * @return
     */
    Remind getRemind(String userId);
    /**
     * 登录日志
     * @return
     */
    List<LoginLog> getLog();
    /**
     * 获得商品排行
     * @return
     */
    List<Rank> getRank();
    
    int initRemind(String userId);
    void getTime(Map<String, Object> map);
    int cutTime(String userId);
}
