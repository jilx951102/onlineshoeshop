<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../css/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../css/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../css/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../css/h-ui.admin/css/style.css" />
</head>
<body>
<table class="table table-border table-bg table-hover">
        <tr>
         <td class="text-c">排名</td>
         <td class="text-c">商品编号</td>
         <td class="text-c">商品名称</td>
         <td class="text-c">销售数量</td>
        </tr>
        <c:forEach items="${rankList }" var="r" varStatus="vst" >
             <tr>
		         <td class="text-c">
		           <span class="label radius  label-primary" >${vst.count }</span>
		         </td>
		         <td class="text-c">${r.shoeId }</td>
		         <td class="text-c">${r.shoeName }</td>
		         <td class="text-c">${r.sellNum }</td>
		        </tr>
            </c:forEach>
        
      </table>    
</body>
</html>