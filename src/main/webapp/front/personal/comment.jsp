<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../../css/bootstrap/bootstrap-theme.min.css">
</head>
<body>
   <div class="col-xs-12">
      <form action="#" method="post" >
      <input type="hidden" value="${orderId }" name="orderId">
	  <div class="form-group">
	    <label for="comment"><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;请留下您的好评</label>
	    <textarea class="form-control" id="content" name="comment.commentContent" rows="5"  placeholder="详细地址" style="resize:none"></textarea>
	  </div> 

	  <button type="button" onclick="comment()" class="btn btn-info" style="width:100%">发表评论</button>
	</form>
   </div>
</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/layer/2.4/layer.js"></script>
<script type="text/javascript">
  function comment(){
	  var content = $("#content").val();
	  if(content=="" || content.length>100){
		  layer.msg("评论内容必填,且长度不得超过100",{
			  icon:2,
			  time:2000
		  })}else{
			  $.ajax({
				  url:'order_comment',
				  data:$("form").serialize(),
				  type:'post',
				  success:function(data){
					  if(data===1){
						  layer.msg("评论成功",{
							  icon:1,
							  time:1500,
						  },function(){
							  parent.window.location.reload();
							  var i = parent.layer.getFrameIndex();
							  parent.layer.close(i);
						  })
					  }else{
						  layer.msg("评论失败",{
							  icon:2,
							  time:1500
						  })
					  }
				  }
			  }) 
		  }
	  
  }
</script>
</html>