<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  <table class="table table-border">
     <tr>
       <td class="text-r">订单号</td>
       <td class="text-l">${order.orderId }</td>
     </tr>
     <tr>
       <td class="text-r">商品名称</td>
       <td class="text-l">${order.shoe.shoeName }</td>
     </tr>
     <tr>
       <td class="text-r">购买数量(双)</td>
       <td class="text-l">${order.orderBuynum }</td>
     </tr>
     <tr>
       <td class="text-r">金额(元)</td>
       <td class="text-l">
         <fmt:formatNumber value="${order.orderMoney }" pattern="0.00"/>
       </td>
     </tr>
     <tr>
       <td class="text-r">收货人</td>
       <td class="text-l">${order.raddress.receiveName }</td>
     </tr>
     <tr>
       <td class="text-r">收货地址</td>
       <td class="text-l">${province }${city }${order.raddress.addressDetail }</td>
     </tr>
     <tr>
       <td class="text-r">手机</td>
       <td class="text-l">${order.raddress.receicePhone }</td>
     </tr>
     <tr>
       <td class="text-r">下单时间</td>
       <td class="text-l">
         <fmt:formatDate value="${order.orderTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
       </td>
     </tr>
     <tr>
       <td class="text-r">订单状态</td>
       <td class="text-l"><span class="label label-success radius">
          <c:choose>
            <c:when test="${fn:indexOf(order.orderFlag,'0')==0 }">
                                                 待发货
            </c:when>
            <c:when test="${fn:indexOf(order.orderFlag,'1')==0 }">
                                                  未收货
            </c:when>
            <c:when test="${fn:indexOf(order.orderFlag,'2')==0 }">
                                                 已收货
            </c:when>
          </c:choose>
       </span></td>
     </tr>
  </table>
</body>
</html>