<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../../css/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/css/style.css" />
</head>
<body>
   <div class="col-xs-12">
     
      <div>
         <p>评论内容<span style="float: right"><fmt:formatDate value="${comment.commentTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span></p>
         <p>${comment.commentContent}</p>
         <hr>
      </div>
      <form action="" method="post" >
      <input type="hidden" value="${comment.commentId }" name="comment.commentId">
	  <div style="width:100%">
	    <label for="comment"><i class="Hui-iconfont">&#xe686;</i>回复:${comment.user.userRealname }</label>
	    <textarea id="content" name="answerContent" class="textarea radius" rows="5"  placeholder="回复评论,最多输入100字" style="resize:none"></textarea>
	  </div>

	  <button type="button" onclick="answer()" class="btn btn-primary radius" style="width:100%">回复</button>
	</form>
   </div>
</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script> 
<script type="text/javascript" src="../../js/layer/2.4/layer.js"></script>
<script type="text/javascript">
  function answer(){
	  var content = $("#content").val();
	  if(content=="" || content.length>100){
		  layer.msg("评论内容必填,且长度不得超过100",{
			  icon:2,
			  time:2000
		  })
	  }else{
		  $.ajax({
			  url:'comment_answer',
			  data:$("form").serialize(),
			  type:'post',
			  success:function(data){
				  if(data===1){
					  layer.msg("回复成功",{
						  icon:1,
						  time:1500
					  },function(){
						  parent.window.location.reload();
						   var i = parent.layer.getFrameIndex();
						   parent.layer.close(i);
					  })
				  }else{
					  layer.msg("回复失败",{
						  icon:2,
						  time:1500,
					  })
				  }
			  }
		  })
	  }
  }
</script>
</html>