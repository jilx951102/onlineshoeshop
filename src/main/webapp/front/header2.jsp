<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap/bootstrap-theme.min.css">
<style type="text/css">
*{
  padding:0px;
  margin:0px;
}

#connect{
  color:black;
  float: right 
}
#cart{
  color:black;
  cursor: pointer;
  float: right;
  margin-right:50px
}
</style>
</head>
<body >
   <div class="col-xs-12"  style="height:25px;background-color:#EEEEEE;border-bottom:1px solid #E5E5E5">
       <c:if test="${u==null }">
        <div class="col-md-5 col-md-offset-5" style="margin-top: 2px;">
          <a href="../login.jsp" target="parent" style="width:100px;color:#FF0000">欢迎登录名鞋库</a>
          <a href="../register.jsp" target="parent" style="margin-left: 50px;color:#FF0000" >免费注册</a>       
          <span id="connect"><span class="glyphicon glyphicon-phone-alt"></span>联系我们<span style="font-weight:bolder;">400-820-100</span></span>
          <a id="cart" onclick="gointoCart()"><span class="glyphicon glyphicon-shopping-cart"></span>购物车</a>
        </div>
       </c:if>
       <c:if test="${u!=null }">
         <div class="col-md-5 col-md-offset-5" style="margin-top: 2px;">
           <img src='<c:if test="${u.userPicture==null}">../img/preview.jpg</c:if><c:if test="${u.userPicture!=null}">/touxiang/${u.userPicture}</c:if>' alt="..." class="img-circle" style="margin-left:25%;height:20px;width: 20px" >
	        <span class="dropdown" >
		    <span class=" dropdown-toggle"  id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
		              ${u.userRealname }
		    <span class="caret"></span>
		  </span>
		  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
		    <li><a href="personal/user_gotoInfo" target="parent">个人中心</a></li>
		    <li><a href="../user_out">退出登录</a></li>
		  </ul>
		  </span> 
	        <span id="connect"><span class="glyphicon glyphicon-phone-alt"></span>联系我们<span style="font-weight:bolder;">400-820-100</span></span>
	        <a id="cart" href="cart_gotoCart" target="_parent"><span class="glyphicon glyphicon-shopping-cart"></span>购物车<span style="color:#CC0008">${cartCount }</span>件</a>
	     </div>
       </c:if>
       
   </div>
<div class="col-xs-9 col-xs-offset-2" style="margin-top: 5px">
   <ol class="breadcrumb">
	  <li><span>所在位置&nbsp;&nbsp;&nbsp;&nbsp;</span><a href="index.jsp" target="top" style="color: #333333;">名鞋库</a></li>
	  <li class="active" >查看商品详情</li>
   </ol>
 </div>
</body>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/layer/2.4/layer.js"></script>
<script type="text/javascript">
function gointoCart(){
	  $.ajax({
		  url:'shoe_gointocart',
		  type:'post',
		  data:{},
		  success:function(data){
			  if(data===1){
				  location.href = "cart_gotoCart"
			  }else{
				  top.layer.alert("请先登录",{
					  icon:1,
				  },function(){
					  top.location.href = "../user_addintoCart?tocart=1"
				  })
			  }
		  }
	  })
}
</script>
</html>