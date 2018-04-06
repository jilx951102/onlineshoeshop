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
  margin: 0;
  padding: 0;
}
a{
 color: black
}
.bg{
  color: #A21F25
}
</style>
</head>
<body>
<div class="col-xs-2" style="text-align: center;width: 180px;margin-left:-10%">
  <ul class="list-group">
  <li class="list-group-item" ><a  href="user_gotoInfo" target="parent"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>个人信息</a>  </li>
  <li class="list-group-item"><a href="pass.jsp?active=2" target="parent"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>修改密码</a> </li>
  <li class="list-group-item"><a href="user_gotoaddress?active=3" target="parent"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>收货地址</a> </li>
  <li class="list-group-item"><a href="order_personStayOrder?active=6" target="parent"><span class="glyphicon glyphicon-tag" aria-hidden="true"></span>待付款订单</a> </li>
  <li class="list-group-item"><a href="order_personOrder?active=4" target="parent"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>已付款订单</a> </li>
  <li class="list-group-item"><a href="order_personBuy?active=5" target="parent"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>历史购买</a> </li>
</ul>
</div>
</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript">
   function changeleftColors(val){
	   $("div ul li").children().removeClass("bg");
	   switch(val){
	   case '2':$("div ul li:eq(1)").children().addClass("bg");break;
	   case '3':$("div ul li:eq(2)").children().addClass("bg");break;
	   case '4':$("div ul li:eq(4)").children().addClass("bg");break;
	   case '5':$("div ul li:eq(5)").children().addClass("bg");break;
	   case '6':$("div ul li:eq(3)").children().addClass("bg");break;
	   default:
		   $("div ul li:eq(0)").children().addClass("bg");break;
	   }
   }
</script>
</html>