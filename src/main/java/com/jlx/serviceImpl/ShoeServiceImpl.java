package com.jlx.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jlx.dao.ShoeDao;
import com.jlx.model.Answer;
import com.jlx.model.Cart;
import com.jlx.model.Comment;
import com.jlx.model.Shoe;
import com.jlx.model.Type;
import com.jlx.model.User;
import com.jlx.service.ShoeService;
import com.jlx.util.IDgenerate;

@Service("shoeService")
public class ShoeServiceImpl implements ShoeService{
    
	@Autowired
	private ShoeDao shoeDao;
	
	public int addType(Type type) {
		if(shoeDao.findTypeByName(type)>0){
			return shoeDao.findTypeByName(type);
		}else{
			shoeDao.addType(type);
			return 0;
		}		
		
	}

	public List<Type> getTypes(Map<String, Object> page) {		 
		return shoeDao.getTypes(page);		
	}

	public List<Type> getAllType() {
		return shoeDao.getAllType();
	}

	public Type typeInfo(String TypeId) {
		
		return shoeDao.typeInfo(TypeId);
	}

	public int TypeEdit(String typeId, String typeName) {
		Type type = new Type();
		type.setTypeName(typeName);
		if(shoeDao.findTypeByName(type)>0){
			return shoeDao.findTypeByName(type);
		}else{
			shoeDao.editType(typeId, typeName);
			return 0;
		}	
	}

	public int typeDel(String typeId) {
		if(shoeDao.findShoeBytypeId(typeId)==0){
			shoeDao.typeDel(typeId);
			return 0;
		}else{
			return 1;	
		}
		
	}

	public List<Type> getAllTypeBytypeName(Map<String, Object> page) {
		
		return shoeDao.getAllTypeBytypeName(page);
	}

	public List<String> findType(String[] typeIds) {
		List<String> t = new ArrayList<String>();
		for(int i = 0; i<typeIds.length;i++){
			if(shoeDao.findShoeBytypeId(typeIds[i])>0){
				t.add(typeIds[i]);
			}
		}
		return t;
	}

	public List<Type> findTypeById(List<String> list) {
		return shoeDao.findTypeById(list);
	}

	public int delAllType(String[] typeIds) {
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < typeIds.length; i++) {
			list.add(typeIds[i]);
		}
		return shoeDao.delAllType(list);
	}

	public int addShoe(Shoe shoe) {
		shoeDao.addshoetoremind();
		return shoeDao.addShoe(shoe);
	}

	public List<Shoe> getOnlineShoe() {		
		return shoeDao.getOnlineShoe();
	}

	public List<Shoe> getOnlineShoeDiv(Map<String, Object> map) {
		
		return shoeDao.getOnlineShoeDiv(map);
	}

	public List<Shoe> searchOnlineShoe(Shoe shoe) {
		return shoeDao.searchOnlineShoe(shoe);
	}

	public List<Shoe> searchOnlineShoeDiv(Map<String, Object> map) {
		return shoeDao.searchOnlineShoeDiv(map);
	}

	public Shoe watchshoe(Shoe shoe) {
		
		return shoeDao.watchshoe(shoe);
	}

	public int shoeOff(String shoeId) {		
		return shoeDao.shoeOff(shoeId);
	}

	public int editShoe(Shoe shoe) {
		return shoeDao.editShoe(shoe);
	}
    @Transactional
	public int offShoeAll(String[] shoeIds) {
		for(int i=0;i<shoeIds.length;i++){
			shoeDao.shoeOff(shoeIds[i]);
		}
		return 1;
	}

	public List<Shoe> getOutlineShoe() {		
		return shoeDao.getOutlineShoe();
	}

	public List<Shoe> getOutlineShoeDiv(Map<String, Object> map) {
		return shoeDao.getOutlineShoeDiv(map);
	}

	public int shoeOn(String shoeId) {
		
		return shoeDao.shoeOn(shoeId);
	}

	public int shoeDel(String shoeId) {		
		return shoeDao.shoeDel(shoeId);
	}

	public List<Shoe> searchOutlineShoe(Shoe shoe) {		
		return shoeDao.searchOutlineShoe(shoe);
	}

	public List<Shoe> searchOutlineShoeDiv(Map<String, Object> map) {		
		return shoeDao.searchOutlineShoeDiv(map);
	}
    @Transactional
	public int shoeOnAll(String[] shoeIds) {
		for (int i = 0; i < shoeIds.length; i++) {
			shoeDao.shoeOn(shoeIds[i]);
		}
		return 1;
	}
    @Transactional
	public int shoeDelAll(String[] shoeIds) {
    	for (int i = 0; i < shoeIds.length; i++) {
			shoeDao.shoeDel(shoeIds[i]);
		}
		return 1;
	}

	public List<Shoe> getShoeBytypeName(String typeName) {
		return shoeDao.getShoeBytypeName(typeName);
	}

	public List<Shoe> getShoeBytypeNameDiv(Map<String, Object> map) {
		return shoeDao.getShoeBytypeNameDiv(map);
	}

	public int addIntoCart(String shoeId, String userId, int buyNum) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("shoeId", shoeId);
		map.put("userId", userId);
		Cart c = shoeDao.findaddNum(map);
		if(c!=null){
			int n = c.getCartBuynum();
			int a = shoeDao.getShowStock(shoeId);
			if((n+buyNum)>a){
				return 2;
			}
			shoeDao.delCartShoe(map);
			buyNum = buyNum + n;
		}
		Cart cart = new Cart();
		cart.setCartBuynum(buyNum);
		cart.setCartId(IDgenerate.next());
		cart.setUserId(userId);
		cart.setShoeId(shoeId);
		shoeDao.addIntoCart(cart);
		return 1;
	}

	public List<Shoe> searchShoeFront(String searchName) {
		return shoeDao.searchShoeFront(searchName);
	}

	public List<Shoe> searchShoeFrontDiv(Map<String, Object> map) {
		return shoeDao.searchShoeFrontDiv(map);
	}

	public List<Comment> getCommentByShoeId(String shoeId) {
		return shoeDao.getCommentByShoeId(shoeId);
	}

	public List<Comment> getCommentByShoeIdDiv(Map<String, Object> map) {
		return shoeDao.getCommentByShoeIdDiv(map);
	}

	public Answer getAnswerById(String answerId) {
		return shoeDao.getAnswerById(answerId);
	}

	public User getUserById(String userId) {
		return shoeDao.getUserById(userId);
	}

	public int initRemind(String userId) {
		return shoeDao.initRemind(userId);
	}

}
