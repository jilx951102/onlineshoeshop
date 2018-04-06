package com.jlx.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jlx.model.Answer;
import com.jlx.model.Comment;
import com.jlx.model.User;
import com.jlx.service.CommentService;
import com.jlx.util.IDgenerate;
import com.jlx.util.PageUtil;

@Controller("commentAction")
@Scope("request")
public class CommentAction {
  
	private int currentPage;
	
	private String searchName;
	
	private String sFlag;
	
	private Map<String, Object> page;
	
	private List<Comment> clist;
	
	private Comment comment;
	
	private String commentId;
	
	private String answerContent;
	
	private int addflag;
	
	private String orderId;
	
	@Autowired
	private CommentService commentService;
    
	//进入未评论列表界面
	public String gotostayComment(){
		clist = commentService.getstayComment();
		page =  PageUtil.page(currentPage, clist.size());
		if(clist.size()>PageUtil.COUNT){	
			clist = commentService.getstayCommentDiv(page);
			page.put("clist", clist);
		}else{
			page.put("clist", clist);
		}	
		return "gotostayComment";
	}
	
	public String searchstayComment(){
		clist = commentService.searchstayComment(searchName);
		page =  PageUtil.page(currentPage, clist.size());
		if(clist.size()>PageUtil.COUNT){	
			page.put("searchName", searchName);
			clist = commentService.searchstayCommentDiv(page);
			page.put("clist", clist);
		}else{
			page.put("clist", clist);
		}	
		return "searchstayComment";
	}
	//去评论
	public String gotoanswer(){
		comment = commentService.getCommentbyId(commentId);
		return "gotoanswer";
	}
	
	//回复
	public String answer(){
		User u = (User)ServletActionContext.getRequest().getSession().getAttribute("u");
		comment.setAnswerId(IDgenerate.next());
		Answer answer = new Answer();
		answer.setAnswerContent(answerContent);
		answer.setAnswerId(comment.getAnswerId());
		answer.setUserId(u.getUserId());
		answer.setCommentId(comment.getCommentId());
		addflag =commentService.answer(comment, answer);
		return "answer";
	}
	
	public String alReadyComment(){
		clist = commentService.getalRadyComment();
		page =  PageUtil.page(currentPage, clist.size());
		if(clist.size()>PageUtil.COUNT){	
			clist = commentService.getalRadyCommentDiv(page);
		}
		if(clist.size()>0){
			for (int i = 0; i < clist.size(); i++) {
				Answer answer = commentService.getAnswerById(clist.get(i).getAnswerId());
				clist.get(i).setUser2(commentService.getUserById(answer.getUserId()));			
			}
		}
		page.put("clist", clist);
		return "alReadyComment";
	}
	
	public String searchAlreadyComment(){
		clist = commentService.searchAeadyComment(searchName);
		page =  PageUtil.page(currentPage, clist.size());
		if(clist.size()>PageUtil.COUNT){	
			page.put("searchName", searchName);
			clist = commentService.searchAeadyCommentDiv(page);
		}
		if(clist.size()>0){
			for (int i = 0; i < clist.size(); i++) {
				Answer answer = commentService.getAnswerById(clist.get(i).getAnswerId());
				clist.get(i).setUser2(commentService.getUserById(answer.getUserId()));			
			}
		}
		page.put("clist", clist);
		return "searchAlreadyComment";
		
	}
	
	
	public String seeComment(){
		comment = commentService.getCommentById2(commentId);
		Answer answer = commentService.getAnswerById(comment.getAnswerId());
		comment.setUser2(commentService.getUserById(answer.getUserId()));
		return "seeComment";
	}
	
	public String gotoseeComment(){
		comment = commentService.getCommentByorderId(orderId);
		if(comment.getAnswerId()!=null){
			Answer answer = commentService.getAnswerById(comment.getAnswerId());
			comment.setUser2(commentService.getUserById(answer.getUserId()));
		}
		return "gotoseeComment";
	}
	
	public String gotoComment(){
		User u = (User)ServletActionContext.getRequest().getSession().getAttribute("u");
		commentService.initRemind(u.getUserId());
		return gotostayComment();
	}
	
	/************get set***************************/
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getsFlag() {
		return sFlag;
	}

	public void setsFlag(String sFlag) {
		this.sFlag = sFlag;
	}

	public Map<String, Object> getPage() {
		return page;
	}

	public void setPage(Map<String, Object> page) {
		this.page = page;
	}

	public List<Comment> getClist() {
		return clist;
	}

	public void setClist(List<Comment> clist) {
		this.clist = clist;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public String getCommentId() {
		return commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public int getAddflag() {
		return addflag;
	}

	public void setAddflag(int addflag) {
		this.addflag = addflag;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	
}
