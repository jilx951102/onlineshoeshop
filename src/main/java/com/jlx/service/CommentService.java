package com.jlx.service;

import java.util.List;
import java.util.Map;

import com.jlx.model.Answer;
import com.jlx.model.Comment;
import com.jlx.model.User;

public interface CommentService {
	   /**
	    * 进入带评论列表界面
	    * @return
	    */
	   List<Comment> getstayComment(); 
	   List<Comment> getstayCommentDiv(Map<String, Object> map); 
	   List<Comment> searchstayComment(String searchName); 
	   List<Comment> searchstayCommentDiv(Map<String, Object> map);
	   /**
	    * 获取某一条评论
	    * @param commentId
	    * @return
	    */
	   Comment getCommentbyId(String commentId);
	   //已回复的品论
	   int addanswerId(Comment comment);
	   int addAnswer(Answer answer);
	   List<Comment> getalRadyComment();
	   List<Comment> getalRadyCommentDiv(Map<String, Object> map);
	   List<Comment> searchAeadyComment(String searchName);
	   List<Comment> searchAeadyCommentDiv(Map<String, Object> map);
	   int answer(Comment comment,Answer answer);
	   User getUserById(String userId);
	   Answer getAnswerById(String answerId);
	   Comment getCommentById2(String commentId);
	   /**
	    * 根据订单号查看评论
	    * @param orderId
	    * @return
	    */
	   Comment getCommentByorderId(String orderId);
	   int initRemind(String userId);
}
