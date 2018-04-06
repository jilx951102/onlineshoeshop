package com.jlx.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jlx.dao.UserDao;
import com.jlx.model.Address;
import com.jlx.model.Chart;
import com.jlx.model.City;
import com.jlx.model.Level;
import com.jlx.model.LoginLog;
import com.jlx.model.Province;
import com.jlx.model.Rank;
import com.jlx.model.Remind;
import com.jlx.model.User;
import com.jlx.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService{
   
	@Autowired
	private UserDao userDao;
	@Transactional
	public int userRegister(User user) {
		userDao.addUserToremind();
		userDao.sendtime(user.getUserId());
		return userDao.userRegister(user);
	}

	public int findUserByName(String userName) {
		return userDao.findUserByName(userName);
	}

	public User login(User user) {
		return userDao.login(user);
	}

	public List<Level> initLevel() {		
		return userDao.initLevel();
	}
    @Transactional
	public int editLevel(List<Level> list) {
		for (int i = 0; i < list.size(); i++) {
		  userDao.editLevel(list.get(i));
		}
		return 1;
	}

	public List<User> initPeople() {
		return userDao.initPeople();
	}

	public List<User> initPeopleDiv(Map<String, Object> map) {
		return userDao.initPeopleDiv(map);
	}

	public List<User> searchPeople(Map<String, Object> map) {		
		return userDao.searchPeople(map);
	}

	public List<User> searchPeopleDiv(Map<String, Object> map) {
		return userDao.searchPeopleDiv(map);
	}

	public User getUserByName(String userName) {
		return userDao.getUserByName(userName);
	}

	public int changePass(User user) {		
		return userDao.changePass(user);
	}

	public int getCartCount(String userId) {		
		return userDao.getCartCount(userId);
	}

	public User getUserById(String userId) {		
		return userDao.getUserById(userId);
	}

	public int editInfo(User user) {
		return userDao.editInfo(user);
	}

	public int getOldPass(User user) {
		return userDao.getOldPass(user);
	}

	public int changePassById(User user) {		
		return userDao.changePassById(user);
	}

	public List<Province> getAllProvince() {
		return userDao.getAllProvince();
	}

	public List<City> getCityByProvince(int provinceId) {
		return userDao.getCityByProvince(provinceId);
	}

	public int addAddress(Address address) {
		return userDao.addAddress(address);
	}

	public List<Address> getAllAddress(String userId) {
		return userDao.getAllAddress(userId);
	}

	public List<Address> getAllAddressDiv(Map<String, Object> map) {
		return userDao.getAllAddressDiv(map);
	}

	public Address getDefaultAddress(String userId) {
		return userDao.getDefaultAddress(userId);
	}

	public int removeDefault(String addressId) {
		return userDao.removeDefault(addressId);
	}

	public int setDefault(String addressId) {
		return userDao.setDefault(addressId);
	}

	public Address addressEdit2(String addressId) {
		return userDao.addressEdit2(addressId);
	}

	public int updateAddress(Address address) {
		return userDao.updateAddress(address);
	}

	public int addressDel(String addressId) {
		return userDao.addressDel(addressId);
	}

	public List<User> getAllAdmin() {
		return userDao.getAllAdmin();
	}

	public List<User> getAllAdminDiv(Map<String, Object> map) {
		return userDao.getAllAdminDiv(map);
	}

	public List<User> searchAdmin(String searchName) {
		return userDao.searchAdmin(searchName);
	}

	public List<User> searchAdminDiv(Map<String, Object> map) {
		return userDao.searchAdminDiv(map);
	}

	public User getAdminById(String userId) {
		return userDao.getAdminById(userId);
	}

	public User getAdminByName(String userName) {
		return userDao.getAdminByName(userName);
	}

	public int addAdmin(User user) {
		return userDao.addAdmin(user);
	}

	public int addremind(String userId) {
		return userDao.addremind(userId);
	}

	public int editUser(User user) {
		return userDao.editUser(user);
	}

	public int adminDel(String userId) {
		return userDao.adminDel(userId);
	}
    @Transactional
	public int adminDelAll(String[] userIds) {
		for (int i = 0; i < userIds.length; i++) {
			adminDel(userIds[i]);
		}
		return 1;
	}

	public int changeAdminPass(User user) {
		return userDao.changeAdminPass(user);
	}

	public User adminLogin(User user) {
		return userDao.adminLogin(user);
	}

	public int addLoginlog(LoginLog loginLog) {
		return userDao.addLoginlog(loginLog);
	}

	public User getOldPassById(String userId) {
		return userDao.getOldPassById(userId);
	}

	public List<Chart> gotoChart() {		
		return userDao.gotoChart();
	}
	public List<Chart> gotoChart2(){
		return userDao.gotoChart2();
	}

	public Remind getRemind(String userId) {
		return userDao.getRemind(userId);
	}

	public List<LoginLog> getLog() {
		return userDao.getLog();
	}

	public List<Rank> getRank() {
		return userDao.getRank();
	}

	public int initRemind(String userId) {
		return userDao.initRemind(userId);
	}

	public void getTime(Map<String, Object> map) {
		 userDao.getTime(map);
	}

	public int cutTime(String userId) {		
		return userDao.cutTime(userId);
	}
}
