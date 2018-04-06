<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../css/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../css/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../css/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../css/h-ui.admin/css/style.css" />
<title>Insert title here</title>
</head>
<body>
 <table class="table table-border table-bg table-hover">
          <tr>
            <td class="text-c">用户名</td>
            <td class="text-c">上次登陆时间</td>
          </tr>
          <c:forEach items="${LoginLogList }" var="l" >
                  <tr>
			           <td class="text-c">${l.userRealname }</td>
			           <td class="text-c">
			              <fmt:formatDate value="${l.loginTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
			           </td>
			       </tr>
           </c:forEach>
          
       </table>       
</body>
</html>