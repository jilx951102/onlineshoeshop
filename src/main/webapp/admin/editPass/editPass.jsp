<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../../css/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/css/style.css" />
<style type="text/css">
label.error{
  position:relative;
  right: -2px;
  top:0px
}
</style>
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe62d;</i>个人信息管理<span class="c-666 en">&gt;</span><span class="c-666">修改密码</span>
    <a href="javascript:;" onclick="location.reload()"><i class="Hui-iconfont btn btn-success radius" style="float:right;margin-top: 4px">&#xe68f;</i> </a>
</nav>
<form action="#" method="post" id="ruleForm">
   <table class="table">
      <tr>
         <td class="text-r" width="100">旧密码</td>
         <td class="text-l">
           <input name="old" type="password" class="input-text radius size-M" style="width:300px">
         </td>
      </tr>
      <tr>
         <td class="text-r">新密码</td>
          <td class="text-l">
           <input name="user.userPassword" id="newpass" type="password" class="input-text radius size-M" style="width:300px">
         </td>
      </tr>
      <tr>
         <td class="text-r">确认密码</td>
          <td class="text-l">
           <input name="rPass" type="password" class="input-text radius size-M" style="width:300px">
         </td>
      </tr>
      <tr>
        <td></td>
        <td class="text-l" >
          <button class="btn btn-secondary radius" onclick="editPass()" type="button"><i class="Hui-iconfont">&#xe6a7;</i> 确认修改</button>
        </td>
      </tr>
   </table>
   
</form>
<script type="text/javascript" src="../../js/jquery.min.js"></script> 
<script type="text/javascript" src="../../js/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript" src="../../js/validate/jquery.validate-1.13.1.js"></script>
<script type="text/javascript">
   $(function(){
	   $("#ruleForm").validate({
		   rules:{
				  old:{
					 required:true,
					 oldPass:true,
				  },
		          'user.userPassword':{
				     required:true,
				     length:true,
			      },
			      rPass:{
			    	  equalTo:"#newpass",
			      }
			  },
		      messages:{
		    	  old:{
					  required:"旧密码必填",
				  },
				  'user.userPassword':{
					  required:"新密码必填",
				  } ,
				  rPass:{
					  equalTo:"2密码输入不一致",
				  } 
			  
		      }
	   })
	  $.validator.addMethod("length",function(value,element,parmas){
		  return value.length<=16;
	  },"密码长度不得超过16");
	   $.validator.addMethod("oldPass",function(value,element,parmas){
			  var flag = true;
			  $.ajax({
				  url:'user_getOldPassById',
				  data:{'user.userPassword':value.trim()},
				  type:'post',
				  async:false,
				  success:function(data){
					  flag = data;
				  }
			  })
			  return flag;
		  },"旧密码错误");
   })
   function editPass(){
	   if($("#ruleForm").valid()){
		   $.ajax({
			   url:'user_adminchangPass',
			   data:$("form").serialize(),
			   type:'post',
			   success:function(data){
				   if(data===1){
					   layer.alert("修改成功,请重新登录",{
						   icon:1
					   },function(){
						   parent.location.href="../../adminlogin.jsp";
					   })
				   }else{
					   layer.msg("修改失败",{
						   icon:1,
						   time:1500
					   })
				   }
			   }
		   })
	   }
   }
</script>
</body>
</html>