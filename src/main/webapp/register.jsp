<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<style type="text/css">
label.error{
  color:red;
}
</style>
</head>
<body background="img/bj_zhuce.jpg">
    <div id="regist">
   <p style="margin-top:65px;text-align:center;font-family:STCaiyun;font-size: 30px">注册新账号</p>
   <div style="margin-left:330px;margin-top:20px;background-color:white;height:400px;width:740px;padding-top:20px;border:2px solid gray ">
      <form action="" method="post" style="margin-left:250px" id="roleForm" >         
         <div class="input-group" >
		    <span class="input-group-addon"  aria-hidden="true" aria-describedby="basic-addon1">
		       <span class="glyphicon glyphicon-user"  aria-hidden="true" ></span>
		    </span>
		    <input type="text" name="user.userName" style="height:32px;width:210px" placeholder="用户名" aria-describedby="basic-addon1" id="userName" >
		 </div>
		 <div class="input-group" style="margin-top:20px;">
		    <span class="input-group-addon"  aria-describedby="basic-addon1">
		       <span class="glyphicon glyphicon-lock"  aria-hidden="true" ></span>
		    </span>
		    <input type="password" name="user.userPassword" id="new" style="height:32px;width:210px" placeholder="密码" aria-describedby="basic-addon1">
		 </div>
		  <div class="input-group" style="margin-top:20px;">
		    <span class="input-group-addon"  aria-describedby="basic-addon1">
		       <span class="glyphicon glyphicon-lock"  aria-hidden="true" ></span>
		    </span>
		    <input type="password" name="rPass" style="height:32px;width:210px" placeholder="确认密码" aria-describedby="basic-addon1">
		 </div>
		 <div class="input-group" style="margin-top:20px;">
		    <span class="input-group-addon"  aria-describedby="basic-addon1">
		       <span class="glyphicon glyphicon-pencil"  aria-hidden="true" ></span>
		    </span>
		    <input type="text" name="user.userRealname" style="height:32px;width:210px" placeholder="昵称" aria-describedby="basic-addon1">
		 </div>
		 <div class="input-group" style="margin-top:20px;">
		    <span class="input-group-addon"  aria-describedby="basic-addon1">
		       <span class="glyphicon glyphicon-phone"  aria-hidden="true" ></span>
		    </span>
		    <input type="text" name="user.userPhone" style="height:32px;width:210px" placeholder="手机号码" aria-describedby="basic-addon1">
		 </div>
		 <div style="margin-top:20px;">
		     <input type="button" onclick="CheckRegister()" class="btn btn-info" style="width:252px" value="注册">
		 </div>
		 <div style="margin-top:20px;">
		     <input type="reset" class="btn btn-info" style="width:252px" value="重置">
		 </div>
    </form>
   </div>
   </div>
</body>
<script type="text/javascript" src="js/jquery.min.1.8.1.js"></script>
<script type="text/javascript" src="js/validate/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="js/layer/2.4/layer.js"></script>
<script type="text/javascript">
  $(function(){
	  $("#roleForm").validate({
		  rules:{
			  'user.userName':{
				  required:true,
				  userName:true,
				  userName2:true,
				  userName3:true,				  
			  },
			  'user.userPassword':{
				  required:true,
				  plength:true,
			  },
			  'user.userRealname':{
				  required:true,
				  userRealname:true,
			  },
			  'user.userPhone':{
				  required:true,
				  phoneNumber:true,
			  },
		      rPass:{
		    	  equalTo:"#new",
		      }
		  },
		  messages:{
			  'user.userName':{
				  required:"用户名必填",
			  },
			  'user.userPassword':{
				  required:"密码必填",
			  },
			  'user.userRealname':{
				  required:"昵称必填",
			  },
			  'user.userPhone':{
				  required:"手机号码必填",
			  },
			  rPass:{
		    	  equalTo:"2次密码不一致",
		      }
		  }
	  })
	  
	  $.validator.addMethod("userRealname",function(value,element,parmas){
		  return value.length<=10;
	  },"昵称长度不得超过10");
	   $.validator.addMethod("phoneNumber",function(value,element,parmas){			  
		   var v = /^1[3|4|5|8][0-9]\d{8}$/;  
		   return this.optional(element) || v.test(value);
		  },"输入正确的号码");
	   $.validator.addMethod("userRealname",function(value,element,parmas){
		   return value.length<10;
	   },"请输入正整数");
	   $.validator.addMethod("userName2",function(value,element,parmas){
		   var v = /^[a-zA-Z]{1}\w*$/;
		   return v.test(value);
	   },"字母开头,且是字母数字的组合");
	   $.validator.addMethod("userName3",function(value,element,parmas){
		   return value.length<=10 &&value.length>=4 ;
	   },"长度为4到10位");
	   $.validator.addMethod("userName",function(value,element,parmas){			  
		   var flag = false
		   $.ajax({
				  url:"user_userNameCheck",
				  type:'post',
				  async:false,
				  data:{
					  "user.userName":value.trim(),
				  },
				  success:function(result){
					  flag = !result;
				  }
			  })
			  return flag;
		  },"用户名已存在");
	   $.validator.addMethod("plength",function(value,element,parmas){
			  return value.length<=16;
		  },"密码长度不得超过16");
  })

   function CheckRegister(){
	   if($("#roleForm").valid()){
		   $.ajax({
			   url:'user_register',
			   data:$("form").serialize(),
			   success:function(data){
				   if(data){
					   layer.msg("注册成功",{
						   icon:1,
						   time:1500
					   },function(){
						   location.href = "login.jsp"
					   })
				   }
			   }
		   })
	   };
   }
</script>
</html>