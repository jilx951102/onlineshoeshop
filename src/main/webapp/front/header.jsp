<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.daohang{
  list-style: none;
  text-align: center;
  height: 100%;
}
.daohang li{
  height: 100%;
  float: left;
  text-align: center;
  font-size: 18px;
  color: white;
  width: 115px;
  border-left: 1px solid #B9363D;
}
.daohang li p{
  margin-top: 5px;
  color: white;
}

.daohang li p a{
  color: white;
  text-decoration: none;
  cursor: pointer
}

.daohang li:hover{
  background-color: #444444;
}
.carousel img{
 width: 100%;
}
.libg{
  background:#444444
}


</style>
</head>
<body >
   <div class="col-xs-12"  style="height:25px;background-color:#EEEEEE;border-bottom:1px solid #E5E5E5">
       <c:if test="${u==null}">
         <div class="col-md-5 col-md-offset-5" style="margin-top: 2px;">
          <a target="parent" href="../login.jsp" style="width:100px;color:#FF0000">欢迎登录名鞋库</a>
          <a href="../register.jsp" target="parent" style="margin-left: 50px;color:#FF0000" >免费注册</a>       
          <span id="connect"><span class="glyphicon glyphicon-phone-alt"></span>联系我们<span style="font-weight:bolder;">400-820-100</span></span>
          <a id="cart" onclick="gointoCart()" ><span class="glyphicon glyphicon-shopping-cart"></span>购物车</a>
         </div>
       </c:if>
       <c:if test="${u!=null}">
        <div class="col-md-5 col-md-offset-5" style="margin-top: 2px;">
          <img src='<c:if test="${u.userPicture==null}">../img/preview.jpg</c:if><c:if test="${u.userPicture!=null}">/touxiang/${u.userPicture}</c:if>' alt="..." class="img-circle" style="margin-left:25%;height:20px;width: 20px" >
	        <span class="dropdown" >
		    <span class=" dropdown-toggle"  id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
		             ${u.userRealname}
		    <span class="caret"></span>
		  </span>
		  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
		    <li><a href="personal/user_gotoInfo" target="parent">个人中心</a></li>
		    <li><a href="../user_out" target="parent">退出登录</a></li>
		  </ul>
		  </span> 
	        <span id="connect"><span class="glyphicon glyphicon-phone-alt"></span>联系我们<span style="font-weight:bolder;">400-820-100</span></span>
	        <a id="cart" href="cart_gotoCart" target="_parent"><span class="glyphicon glyphicon-shopping-cart"></span>购物车<span style="color:#CC0008">${cartCount}</span>件</a>
	    </div>
       </c:if>
       
   </div>
   
   <div class="col-xs-12">
      <div style="margin-top:20px;" class="col-md-8 col-md-offset-2" >
        <img src="../img/logo.png" alt="..." class="img-thumbnail" style="border: none;">
        <div style="float: right;">
          <form action="shoe_searchShoeFront" target="_parent" class="form-inline" method="post">
           <input type="text" id="searchName" value="${searchName }"  name="searchName" class="form-control" placeholder="输入鞋的名称或类别" style="width: 300px;outline-color:#91B3EA;">
           <button type="submit" style="margin-left: -5px;height: 34px;width: 50px;background-color: #444444;color: white;border: none;float:right">搜索</button>
          </form>
          <p style="color: #888"> <span style="color: #CFD6E3">热搜:</span>&nbsp;&nbsp;跑步鞋&nbsp;&nbsp;帆布鞋&nbsp;&nbsp;篮球鞋&nbsp;&nbsp;足球鞋&nbsp;&nbsp;休闲鞋 </p>
        </div>
      </div>
   </div>
   
   <div class="col-xs-12 " style="height:34px;background-color: #A21F25">
      <div class="col-xs-10 col-md-offset-2" style="height: 100%">
       <ul class="daohang">
        <li class="libg"><p> <a href="index.jsp" target="parent">首页</a> </p></li>
        <li > <p><a href="shoe_searchByType?liActive=1&typeName=男子运动" target="parent">男子运动</a></p> </li>
        <li ><p><a href="shoe_searchByType?liActive=2&typeName=女子运动" target="parent">女子运动</a></p></li>
        <li ><p><a href="shoe_searchByType?liActive=3&typeName=儿童" target="parent">儿童</a></p></li>
        <li ><p><a href="shoe_searchByType?liActive=4&typeName=休闲鞋" target="parent">休闲鞋</a></p></li>
        <li ><p><a href="shoe_searchByType?liActive=5&typeName=运动鞋" target="parent">运动鞋</a></p></li>
        <li style="border-right:1px solid #B9363D " ><p><a href="shoe_searchByType?liActive=6&typeName=户外" target="top">户外</a> </p></li>
       </ul>
      </div>
   </div>
</body>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/layer/2.4/layer.js"></script>
<script type="text/javascript">
  function changeColor(val){
	  $(".daohang li").removeClass("libg");
	  console.log(val)
	  if(val===7 || isNaN(val)){
		  $(".daohang li:eq(0)").addClass("libg"); 
	  }else{
		  $(".daohang li:eq("+val+")").addClass("libg"); 
	  }
	  
  }
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
					  top.location.href = "/onlineshoeshop/user_addintoCart?tocart=1"
				  })
			  }
		  }
	  })
}
  function setName(val){
 	 $("#searchName").val(val);
  }
</script>
</html>