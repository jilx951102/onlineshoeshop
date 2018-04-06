<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
 <input type="hidden" value='${active }' id="active">
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
       <p ><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span style="font-weight: bolder;color:black;margin-left: 8px">个人信息</span></p>
       <form action="" method="post" enctype="multipart/form-data" id="roleForm">
		  <div class="form-group">
		    <label for="realName">昵称</label>
		    <input type="text" value="${user.userRealname }" class="form-control" name="user.userRealname" id="realName" placeholder="昵称">
		  </div>
		  <div class="form-group">
		    <label for="phoneNumber">手机号码</label>
		    <input type="text" value="${user.userPhone }" name="user.userPhone" class="form-control" id="phoneNumber" placeholder="手机号码">
		  </div>
		  <div class="form-group">
		    <label for="birthday">生日</label>
		    <input type="date" value='<fmt:formatDate value="${user.userBirthday }" pattern="yyyy-MM-dd"/>'  name="userBirthday" class="form-control" id="birthday" placeholder="birthday">
		  </div>
		  <div class="form-group">
		    <label for="email">E-Mail</label>
		    <input type="text" value="${user.userEmail }" name="user.userEmail" class="form-control" id="eamil" placeholder="email">
		  </div>
		  <div class="form-group">
		    <input type="hidden" value="${user.userPicture}" name="user.userPicture">
		    <label  class="col-sm-2 control-label">
		       <img <c:if test="${user.userPicture==null }">src="../../img/preview.jpg"</c:if> <c:if test="${user.userPicture!=null }">src="/touxiang/${user.userPicture}"</c:if> id="preview" alt="头像" class="img-thumbnail" style="height:150px;width: 110px;">
		    </label>
		    <label for="userPicture" class="btn btn-info" style="margin-top: 115px">更换头像</label>
		    <input type="file" name="userPicture" id="userPicture" accept="image/jpeg,image/png" style="display: none">		    
		  </div>
		  <div class="col-xs-12" style="margin-top: 18px;margin-left: -2%">
		    <button type="button" onclick="infoEdit()" class="btn btn-info" style="width: 100px">确认</button>
		    <button type="reset" class="btn btn-info" style="width: 100px">重置</button>
		  </div>
		</form>    
       
    </div>

 </div>
 <iframe scrolling="no" frameborder="0" src="../footer.jsp" width="100%" height="140px;" style="margin-top:20px" ></iframe>
</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/jquery.form.js"></script>
<script type="text/javascript" src="../../js/validate/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/layer/2.4/layer.js"></script>
<script type="text/javascript">
   $(function(){
	   $("#userPicture").change(function(){
	  		var filepath = $(this);    		
	  		var objURL = filepath[0].files[0];
	  		//获得一个http格式的url路径:mozilla(firefox)||webkit or chrome
	  		var windowURL = window.URL || window.webkitURL;
	  		//createObjectURL创建一个指向该参数对象(图片)的URL
	  		var dataURL;
	  		dataURL = windowURL.createObjectURL(objURL);
	  		$("#preview").attr("src",dataURL);
	  	});
	   
	   $("#roleForm").validate({
			  rules:{
				'user.userRealname':{
					required :true,
					realName :true,
				},
				'user.userPhone':{
					required :true,
					phoneNumber:true,
				},
				'user.userEmail':{
					email:true,
				}
		
			  },
			  messages:{
				'user.userRealname':{
					required :"昵称必填!",
				},
				'user.userPhone':{
					required :'手机号码必填',
				},
			  }
		  });
	   $.validator.addMethod("realName",function(value,element,parmas){			  
			  return value.length<10;
		  },"昵称的长度不能超过10");
	   $.validator.addMethod("phoneNumber",function(value,element,parmas){			  
		   var v = /^1[3|4|5|8][0-9]\d{8}$/;  
		   return this.optional(element) || v.test(value);
		  },"请输入正确的手机号码");
	   $.validator.addMethod("email",function(value,element,parmas){			  
		   var v = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;  
		   return v.test(value) || this.optional(element);
		  },"填写正确的邮箱地址  例:001Abc@lenovo.com.cn");
   })

   function init(){
	   var active= $("#active").val();
	   document.getElementById("left").contentWindow.changeleftColors(active); 
   }
   function infoEdit(){	  
	   if($("#roleForm").valid()){
		   $("#roleForm").attr("action","user_editInfo");
		   $("#roleForm").ajaxSubmit({
			  url:'user_editInfo',
			  data:$("form").serialize(),
			  type:'post',
			  success:function(data){
				  if(data===1){
	            		 layer.msg("修改成功",{
	            			 icon:1,
	            			 time:1500,
	            		 },function(){
	            			location.href="user_gotoInfo";
	            		 }) 
	            	 }else{
	            		 layer.msg("修改失败",{
	            			 icon:2,
	            			 time:2000, 
	            		 })
	            	 }
			  }
		   })  
	   }
   }
</script>
</html>