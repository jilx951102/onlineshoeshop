<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../../css/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/css/style.css" />
</head>
<body>
<table class="table table-border  table-bg">
   <tr>
     <td>商品名:</td>
     <td>${shoe.shoeName}</td>
   </tr>
   <tr>
     <td>类别名:</td>
     <td>${shoe.typeName}</td>
   </tr>
   <tr>
     <td>商品描述:</td>
     <td>${shoe.shoeDesc}</td>
   </tr>
   <tr>
     <td>商品图片:</td>
     <td>
       <img alt="" style="height:50px;width: 50px" src="/upload/${shoe.shoePicture}" class="radius">
     </td>
   </tr>
   <tr>
     <td>商品库存:</td>
     <td>${shoe.shoeStock}件</td>
   </tr>
   <tr>
     <td>商品价格:</td>
     <td>￥<fmt:formatNumber value="${shoe.shoePrice}" pattern="#0.00"></fmt:formatNumber> </td>
   </tr>
   <tr>
     <td>创建时间:</td>
     <td>
        <fmt:formatDate value="${shoe.shoeTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
     </td>
   </tr>
</table>
</body>
</html>