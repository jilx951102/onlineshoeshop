<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
     String  path = request.getContextPath();
     String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %> 
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
</head>
<body background="img/bj_zhuce.jpg">
  <div id="login">
   <p style="margin-top:100px;text-align:center;font-family:STCaiyun;font-size: 30px">网上鞋店后台管理</p>
   <div style="margin-left:525px;margin-top:20px;background-color:white;height:300px;width:330px;padding-top:40px;border:2px solid gray ">
      <form action="javascript:;" method="post" style="margin-left:40px">         
         <div class="input-group" >
		    <span class="input-group-addon"  aria-hidden="true" aria-describedby="basic-addon1">
		       <span class="glyphicon glyphicon-user"  aria-hidden="true" ></span>
		    </span>
		    <input type="text" name="user.userName" value="${userName}" style="height:32px;width:210px" placeholder="用户名" aria-describedby="basic-addon1">
		 </div>
		 <div class="input-group" style="width:200px;margin-top:20px;">
		    <span class="input-group-addon"  aria-describedby="basic-addon1">
		       <span class="glyphicon glyphicon-lock"  aria-hidden="true" ></span>
		    </span>
		    <input type="password" name="user.userPassword" value="${userPassword}" style="height:32px;width:210px" placeholder="密码" aria-describedby="basic-addon1">
		 </div>
		 <div style="margin-top:20px;">
		     <span style="color:red" id="msg"></span>
		     <input type="button" onclick="login()" class="btn btn-info" style="width:252px" value="登录">
		 </div>
    </form>
   </div>
   </div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script> 
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript">
   function login(){
	   $("form").ajaxSubmit({
		   url:'admin/user_adminLogin',
		   type:'post',
		   async:false,
		   success:function(data){
			   if(data===1){
				   location.href = "admin/index.jsp";
			   }else{
				   $("#msg").html("用户名或密码错误")
			   }
		   }
	   })
   }
</script>
</html>