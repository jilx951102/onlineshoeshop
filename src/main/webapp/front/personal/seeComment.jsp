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
  <div class="col-xs-12">
      <div>
         <p>评论内容<span style="float:right">${comment.user.userRealname }&nbsp;&nbsp;<fmt:formatDate value="${comment.commentTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span></p>
         <span>${comment.commentContent }</span>
         <hr/>
      </div>
      <div>
         <c:choose>
            <c:when test="${comment.answerId!=null }">
               <p>回复内容<span style="float:right">掌柜回复&nbsp;&nbsp;<fmt:formatDate value="${comment.answer.answerTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span> </p>
               <p>${comment.answer.answerContent }</p>
            </c:when>
            <c:otherwise>
                <p style="margin-top:20px;text-align: center;">暂无回复。</p>
            </c:otherwise>
         </c:choose>
        
      </div>
   </div>
</body>
</html>