package com.jlx.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jlx.dao.CommentDao;
import com.jlx.model.Answer;
import com.jlx.model.Comment;
import com.jlx.model.User;
import com.jlx.service.CommentService;
@Service("commentService")
public class CommentServiceImpl implements CommentService {
    @Autowired
	private CommentDao commentDao;
	
	public List<Comment> getstayComment() {
		return commentDao.getstayComment();
	}

	public List<Comment> getstayCommentDiv(Map<String, Object> map) {
		return commentDao.getstayCommentDiv(map);
	}

	public List<Comment> searchstayComment(String searchName) {
		return commentDao.searchstayComment(searchName);
	}

	public List<Comment> searchstayCommentDiv(Map<String, Object> map) {
		return commentDao.searchstayCommentDiv(map);
	}

	public Comment getCommentbyId(String commentId) {
		return commentDao.getCommentbyId(commentId);
	}

	public int addanswerId(Comment comment) {       
		return commentDao.addanswerId(comment);
	}

	public int addAnswer(Answer answer) {
		return commentDao.addAnswer(answer);
	}

	public List<Comment> getalRadyComment() {
		return commentDao.getalRadyComment();
	}

	public List<Comment> getalRadyCommentDiv(Map<String, Object> map) {
		return commentDao.getalRadyCommentDiv(map);
	}

	public List<Comment> searchAeadyComment(String searchName) {
		return commentDao.searchAeadyComment(searchName);
	}

	public List<Comment> searchAeadyCommentDiv(Map<String, Object> map) {
		return commentDao.searchstayCommentDiv(map);
	}
    @Transactional
	public int answer(Comment comment, Answer answer) {
        addAnswer(answer);
		return addanswerId(comment);
	}

	public User getUserById(String userId) {
		return commentDao.getUserById(userId);
	}

	public Answer getAnswerById(String answerId) {
		return commentDao.getAnswerById(answerId);
	}

	public Comment getCommentById2(String commentId) {
		return commentDao.getCommentById2(commentId);
	}

	public Comment getCommentByorderId(String orderId) {
		return commentDao.getCommentByorderId(orderId);
	}

	public int initRemind(String userId) {
		return commentDao.initRemind(userId);
	}

}
