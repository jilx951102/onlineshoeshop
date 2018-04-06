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
<link rel="stylesheet" type="text/css" href="../../css/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../../css/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/css/style.css" />
<style type="text/css">
 label.error{
  position:relative;
  right: -2px;
  top:0px;
  display: block;
}
</style>
</head>
<body>
<form action="" id="ruleForm">
   <table class="table table-border">
	  <tr>
	    <td class="text-r" width="100px">登录名</td>
	    <td>
	      ${user.userName }
	    </td>
	  </tr>
	  <tr>
	    <td class="text-r">真实姓名</td>
	    <td>
	       ${user.userRealname }
	    </td>
	  </tr>
	  <tr>
	    <td class="text-r">手机</td>
	    <td>
	       ${user.userPhone }
	    </td>
	  </tr>
	  <tr>
	    <td class="text-r">邮箱</td>
	    <td>
	       ${user.userEmail }
	    </td>
	  </tr>
	  <tr>
	    <td class="text-r">创建时间</td>
	    <td>
	       <fmt:formatDate value="${user.userTime }" pattern="yyy-MM-dd HH:mm:ss"/>
	    </td>
	  </tr>
	</table>
</form>
</body>

</html>