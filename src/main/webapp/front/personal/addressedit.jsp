<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <p ><span class="glyphicon glyphicon-home" aria-hidden="true"></span><span style="font-weight: bolder;color:black;margin-left: 8px">收货地址</span></p>
        <input type="hidden" value="${currentPage }" id="currentPage">
        <form action="#" method="post" id="roleForm">
          <input type = "hidden" value="${address.addressId }" name="addressId">
		  <div class="form-group">
		    <label for="people">收货人</label>
		    <input type="text" value="${address.receiveName }" name="address.receiveName" class="form-control" id="people" placeholder="收货人">
		  </div>
		  <div class="form-group">
		    <label for="phone">手机号码</label>
		    <input type="text" value="${address.receicePhone }" name="address.receicePhone" class="form-control" id="phone" placeholder="手机号码">
		  </div>
		  <div class="form-group">
		    <p><label for="pc">选择省市</label></p>
		    <select class="form-control" name="address.provinceId" onchange="pChange(this)" style="width:20%;float:left;margin-top: -10px">
			  <c:forEach items="${plist }" var="p" varStatus="vst">
			     <option value = "${p.provinceId }" <c:if test="${p.provinceName==province  }">selected</c:if> >${p.provinceName }</option>
			  </c:forEach>
			</select>
			<select class="form-control" id="cityId" name="address.cityId" style="width:20%;float:left;margin-top: -10px;margin-left: 5px">
			  <c:forEach items="${clist }" var="c" varStatus="vst">
			     <option value = "${c.cityId}" <c:if test="${c.cityName==city  }">selected</c:if> >${c.cityName }</option>
			  </c:forEach>
			</select>
		  </div>
		  <div class="form-group" style="clear: both;margin-top: 50px">
		    <label for="detailadd">详细地址</label>
		    <textarea class="form-control" name="address.addressDetail" rows="2" id="detailadd" placeholder="详细地址" style="
             resize: none;">${address.addressDetail }</textarea>
		  </div>
		  <div class="form-group">
		    <label for="postCode">邮编</label>
		    <input type="text" value="${address.addressCode }" name="address.addressCode" class="form-control" id="postCode" placeholder="邮编">
		  </div>
		  <button type="button" onclick="addAddress()" class="btn btn-info" style="width: 100px">确认</button>
		  <button type="reset" class="btn btn-info" style="width: 100px">重置</button>
		</form>
           
    </div>

 </div>
 <iframe scrolling="no" frameborder="0" src="../footer.jsp" width="100%" height="140px;" style="margin-top:20px" ></iframe>
</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/validate/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/jquery.form.js"></script>
<script type="text/javascript" src="../../js/layer/2.4/layer.js"></script>
<script type="text/javascript">
var currentPage = $("#currentPage").val()
   function init(){
	   var active= $("#active").val();
	   document.getElementById("left").contentWindow.changeleftColors(active); 
   }
   
   $(function(){
   $("#roleForm").validate({
      rules:{
    	  'address.receiveName':{
			  required:true,
			  receivePeople:true,
		  },
		  'address.receicePhone':{
			  required:true, 
			  phoneNumber:true,
		  },
		  'address.addressDetail':{
			  required:true, 
			  detailAddr:true,
		  },
		  'address.addressCode':{
			  required:true, 
			  postCode:true,
		  }
		  
	  },
	     messages:{
	      'address.receiveName':{
	   		  required:"收货人必填" 
	   	  }	,
	   	  'address.receicePhone':{
			  required:"手机号码必填", 
		  },
		  'address.addressDetail':{
			  required:"详细地址必填", 
		  },
		  'address.addressCode':{
			  required:"邮编必填", 
		  }
	      }
      });
      $.validator.addMethod("receivePeople",function(value,element,parmas){			  
		  return value.length<10;
	  },"收货人姓名的长度不能超过10");
      $.validator.addMethod("phoneNumber",function(value,element,parmas){			  
		   var v = /^1[3|4|5|8][0-9]\d{8}$/;  
		   return v.test(value);
		  },"请输入正确的手机号码");
      $.validator.addMethod("detailAddr",function(value,element,parmas){			  
		  return value.length<30;
	  },"收货人姓名的长度不能超过30");
      $.validator.addMethod("postCode",function(value,element,parmas){			  
		  var postCode = /^[0-9]{6}$/;		  
    	  return postCode.test(value);
	  },"请输入正确的邮编");
	   
   })
   function addAddress(){
	  if($("#roleForm").valid()){
		  if(currentPage!=0){
			  $("#roleForm").ajaxSubmit({
				  url:'user_updateAddress',
		          type:'post',
		          success:function(data){
		        	  if(data===1){		        
		        		  layer.msg("修改成功",{
		        			  icon:1,
		        			  time:1500,
		        		  },function(){
		        			  location.href = "user_gotoaddress?active=3&currentPage="+currentPage;
		        		  })	       
		        	  }else{
		        		  layer.msg("修改失败",{
		        			  icon:2,
		        			  time:1500
		        		  })
		        	  }
		          }
			  })  
		  }else{
			  $("#roleForm").ajaxSubmit({
				  url:'user_addAddress',
		          type:'post',
		          success:function(data){
		        	  if(data===1){		      
	        			  layer.msg("添加成功",{
		        			  icon:1,
		        			  time:1500,
		        		  },function(){
		        			  location.href = "user_gotoaddress?active=3";
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
   }
   function pChange(obj){
	   $.ajax({
		   url:'user_getCitybyId',
		   data:{
			   provinceId:$(obj).val(),
		   },
		   type:'post',
		   success:function(data){
			 $("#cityId").children().remove();
			 $.each(data,function(index){
				 var p = $("<option value="+this.cityId+">"+this.cityName+"<option>")
				 $("#cityId").append(p)
			 })
		   }
	   })
   }
</script>
</html>