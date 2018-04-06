<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../../css/bootstrap/bootstrap-theme.min.css">
<style type="text/css">
*{
  margin: 0px;
  padding: 0px;
}

label.error{
  color: red
}
</style>
</head>

<body onload="init()">
 <input type="hidden" value='<%=request.getParameter("active")%>' id="active">
 <iframe scrolling="no" frameborder="0" src="../header.jsp" width="100%" height="140px"></iframe>
 
 <div class="col-xs-10 col-xs-offset-2" >
   <ol class="breadcrumb">
	  <li><span>所在位置&nbsp;&nbsp;&nbsp;&nbsp;</span><a href="../index.jsp" style="color: #333333">名鞋库</a></li>
	  <li class="active">个人中心</li>
   </ol>
 </div>
 
 <div class="col-xs-10" style="margin-left:16%">
    <div class="col-xs-2" >
       <iframe scrolling="no" frameborder="0" src="left.jsp" width="100%" height="250px" id="left"></iframe>
    </div>
    <div class="col-xs-8" style="border: 1px solid #DDDDDD;height:700px;padding-top: 5px">
       <p ><span class="glyphicon glyphicon-lock" aria-hidden="true"></span><span style="font-weight: bolder;color:black;margin-left: 8px">修改密码</span></p>
       <form action="java" method="post" id="roleForm">
		  <div class="form-group">
		    <label for="old">旧密码</label>
		    <input type="password" name="oldPass" class="form-control" id="old" placeholder="旧密码">
		  </div>
		  <div class="form-group">
		    <label for="new">新密码</label>
		    <input type="password" name="newPass" class="form-control" id="new" placeholder="新密码">
		  </div>
		  <div class="form-group">
		    <label for="rpass">确认密码</label>
		    <input type="password" name="rPass" class="form-control" id="rpass" placeholder="确认密码">
		  </div>
		  <button type="button" onclick="changePass()" class="btn btn-info" style="width: 100px">确认</button>
		  <button type="reset" class="btn btn-info" style="width: 100px">重置</button>
		</form>    
       
    </div>

 </div>
 <iframe scrolling="no" frameborder="0" src="../footer.jsp" width="100%" height="140px;" style="margin-top:20px" ></iframe>
</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/validate/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/layer/2.4/layer.js"></script>
<script type="text/javascript">
   function init(){
	   var active= $("#active").val();
	   document.getElementById("left").contentWindow.changeleftColors(active); 
   }
   
   $(function(){
	   $("#roleForm").validate({
		  rules:{
			  oldPass:{
				 required:true,
				 oldPass:true,
			  },
	          newPass:{
			     required:true,
			     length:true,
		      },
		      rPass:{
		    	  equalTo:"#new",
		      }
		  },
	      messages:{
	    	  oldPass:{
				  required:"旧密码必填",
			  },
			  newPass:{
				  required:"新密码必填",
			  } ,
			  rPass:{
				  equalTo:"2密码输入不一致",
			  } 
		  
	      }
		  
	  });
	   $.validator.addMethod("length",function(value,element,parmas){
			  return value.length<=16;
		  },"密码长度不得超过16");
	   $.validator.addMethod("oldPass",function(value,element,parmas){	
		      var oldPass = false
		      $.ajax({
		    	  url:'user_getOldPass',
		    	  data:{
		    		  userPassword:value
		    	  },
		    	  async:false,
		    	  success:function(data){
		    		  if(data===1){
		    			  oldPass =true;
		    		  }
		    	  }
		      })
			  return oldPass;
		  },"旧密码错误");
   })
   function changePass(){
	   if($("#roleForm").valid()){
		   $.ajax({
			   url:'user_changeonePass',
			   data:{
				   userPassword:$("#new").val().trim()
			   },
			   type:'post',
			   success:function(data){
				   if(data===1){
					   layer.alert("修改成功,请重新登录",{
						   icon:1,						  						   
					   },function(){
						   location.href = "../../login.jsp";
					   })
				   }else{
					   layer.msg("修改失败",{
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