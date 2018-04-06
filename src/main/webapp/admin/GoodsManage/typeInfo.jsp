<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table style="margin-left:20px">
   <tr>
      <td>类别名称:</td>
      <td>${type.typeName}</td>
   </tr>
   <tr>
      <td>创建时间:</td>
      <td>
        <fmt:formatDate value="${type.typeTime}" pattern="yyyy-MM-dd- HH:mm:ss"/>
      </td> 
   </tr>
</table>
</body>
</html>