<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购买成功</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap/bootstrap-theme.min.css">
<style type="text/css">
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
<body>
    <div class="col-xs-12"  style="height:25px;background-color:#EEEEEE;border-bottom:1px solid #E5E5E5">
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
       
   </div>
<div class="col-xs-12" style="text-align: center;font-size:18px;margin-top: 100px">
 <span><i class="glyphicon glyphicon-gift"></i>宝贝整装待发,请耐心等待!</span>
 <a href="index.jsp" style="color: #FF8600">返回首页!</a>
</div>
</body>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
</html>