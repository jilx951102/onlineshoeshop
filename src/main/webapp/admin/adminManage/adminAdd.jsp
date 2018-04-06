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
  top:0px;
  display: block;
}
</style>
</head>
<body>
<form action="" id="ruleForm">
   <table class="table">
	  <tr>
	    <td class="text-r">登录名</td>
	    <td>
	      <input class="input-text radius" name="user.userName" style="width: 250px" placeholder="登录名">
	    </td>
	  </tr>
	  <tr>
	    <td class="text-r">密码</td>
	    <td>
	       <input class="input-text radius" type="password" id="password" name="user.userPassword" style="width: 250px" placeholder="密码">
	    </td>
	  </tr>
	  <tr>
	    <td class="text-r">确认密码</td>
	    <td>
	      <input class="input-text radius" type="password" name="rpass" style="width: 250px" placeholder="确认密码">
	    </td>
	  </tr>
	  <tr>
	    <td class="text-r">真实姓名</td>
	    <td>
	       <input class="input-text radius" name="user.userRealname" style="width: 250px" placeholder="真实姓名">
	    </td>
	  </tr>
	  <tr>
	    <td class="text-r">手机</td>
	    <td>
	       <input class="input-text radius" name="user.userPhone" style="width: 250px" placeholder="手机号码">
	    </td>
	  </tr>
	  <tr>
	    <td class="text-r">邮箱</td>
	    <td>
	       <input class="input-text radius" name="user.userEmail" style="width: 250px" placeholder="邮箱">
	    </td>
	  </tr>
	  <tr>
	     <td colspan="2">
	       <button class="	btn btn-secondary radius" onclick="addAdmin()" type="button" style="margin-left: 22%">确认</button>
	       <button class="	btn btn-secondary radius" type="reset">重置</button>
	     </td>
	  </tr>
	</table>
</form>
</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script> 
<script type="text/javascript" src="../../js/validate/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../../js/layer/2.4/layer.js"></script>
<script type="text/javascript">
$(function(){
	  $("#ruleForm").validate({
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
		      rpass:{
		    	  equalTo:"#password",
		      },
		      'user.userEmail':{
		    	  required:true, 
		    	  email:true,
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
			  rpass:{
		    	  equalTo:"2次密码不一致",
		      },
		      'user.userEmail':{
		    	  required:"邮箱必填", 
		      }
		  }
	  })
	  
	  $.validator.addMethod("userRealname",function(value,element,parmas){
		  return value.length<=10;
	  },"姓名长度不得超过10");
	   $.validator.addMethod("phoneNumber",function(value,element,parmas){			  
		   var v = /^1[3|4|5|8][0-9]\d{8}$/;  
		   return this.optional(element) || v.test(value);
		  },"输入正确的号码");
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
				  url:"user_getAdminByName",
				  type:'post',
				  async:false,
				  data:{
					  userName:value.trim(),
				  },
				  success:function(result){
					  flag = result;
				  }
			  })
			  return flag;
		  },"用户名已存在"); 
	   $.validator.addMethod("plength",function(value,element,parmas){
			  return value.length<=16;
		  },"密码长度不得超过16");
	   $.validator.addMethod("email",function(value,element,parmas){			  
		   var v = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;  
		   return v.test(value) || this.optional(element);
		  },"填写正确的邮箱地址  例:001Abc@lenovo.com.cn");
})
function addAdmin(){
	if($("#ruleForm").valid()){
		 $.ajax({
			   url:'user_addAdmin',
			   data:$("form").serialize(),
			   success:function(data){
				   if(data){
					   layer.msg("添加成功",{
						   icon:1,
						   time:1500
					   },function(){
						   parent.window.location.reload();
						   var i = parent.layer.getFrameIndex();
						   parent.layer.close(i);
					   })
				   }else{
					   layer.msg("添加失败",{
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