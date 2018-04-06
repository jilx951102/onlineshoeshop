package com.jlx.service;

import java.util.List;
import java.util.Map;

import com.jlx.model.Answer;
import com.jlx.model.Comment;
import com.jlx.model.Shoe;
import com.jlx.model.Type;
import com.jlx.model.User;

public interface ShoeService {
   /**
    * 添加类别
    */
	int addType(Type type);
	
	/**
	 * 获取当前页的数据
	 * @param page
	 * @return
	 */
	List<Type> getTypes(Map<String, Object> page);
	/**
	 * 获取所有类别
	 * @return
	 */
	List<Type> getAllType();
	
	List<Type> getAllTypeBytypeName(Map<String, Object> page);
	
	/**
	 * 查看类别详情
	 * @param TypeId
	 * @return
	 */
	Type typeInfo(String TypeId);
	
	int TypeEdit(String typeId,String typeName);
	/**
	 * 查看某个类别下的拥有的鞋数
	 * @param typeId
	 * @return
	 */
	int typeDel(String typeId);
	/**
	 * 批量删除之前先查看每一个类别下面的鞋数
	 * @return
	 */
	List<String> findType(String[] typeIds);
	
	List<Type> findTypeById(List<String> list);
	/**
	 * 批量删除
	 * @param list
	 * @return
	 */
	int delAllType(String[] list);
	/**
	 * 添加鞋
	 * @param shoe
	 * @return
	 */
	int addShoe(Shoe shoe);
	
	/**
	 * 查询上架的鞋
	 * @return
	 */
	List<Shoe> getOnlineShoe();
	/**
	 * 查询上架鞋的分页
	 * @return
	 */
	List<Shoe> getOnlineShoeDiv(Map<String, Object> map);
	/**
	 * 查询上架鞋的分页
	 * @param shoe
	 * @return
	 */
	List<Shoe> searchOnlineShoe(Shoe shoe);
	
	List<Shoe> searchOnlineShoeDiv(Map<String, Object> map);
	/**
	 * 查看单双鞋的详细信息
	 * @param shoe
	 * @return
	 */
	Shoe watchshoe(Shoe shoe);
	/**
	 * 下架鞋
	 * @param shoeId
	 * @return
	 */
	int shoeOff(String shoeId);
	/**
	 * 修改鞋的信息
	 * @param shoe
	 * @return
	 */
	int editShoe(Shoe shoe);
	/**
	 * 批量下架鞋
	 * @return
	 */
	int offShoeAll(String[] shoeIds);
	/**
	 * 下架鞋的操作
	 * @return
	 */
	List<Shoe> getOutlineShoe();
	List<Shoe> getOutlineShoeDiv(Map<String, Object> map);
	/**
	 * 上架鞋
	 * @param shoeId
	 * @return
	 */
	int shoeOn(String shoeId);
	/**
	 * 删除鞋
	 * @param shoeId
	 * @return
	 */
	int shoeDel(String shoeId);
	/**
	 * 查询下架鞋的分页
	 * @param shoe
	 * @return
	 */
	List<Shoe> searchOutlineShoe(Shoe shoe);
	
	List<Shoe> searchOutlineShoeDiv(Map<String, Object> map);
	/**
	 * 批量上架
	 * @return
	 */
	int shoeOnAll(String shoeIds[]);
	/**
	 * 批量删除
	 * @return
	 */
	int shoeDelAll(String shoeIds[]);
	
	/**
	 * 导航条的查询
	 * @param typeName
	 * @return
	 */
	List<Shoe> getShoeBytypeName(String typeName);
	List<Shoe> getShoeBytypeNameDiv(Map<String,Object> map);
	/**
	 * 向购物车添加商品
	 * @param shoeId
	 * @param userId
	 * @param buyNum
	 * @return
	 */
	int addIntoCart(String shoeId,String userId,int buyNum);
	List<Shoe> searchShoeFront(String searchName);
	List<Shoe> searchShoeFrontDiv(Map<String,Object> map);
	//每一双鞋的评论
	List<Comment> getCommentByShoeId(String shoeId);
	List<Comment> getCommentByShoeIdDiv(Map<String,Object> map);
	Answer getAnswerById(String answerId);
	User getUserById(String userId);
	int initRemind(String userId);
}
