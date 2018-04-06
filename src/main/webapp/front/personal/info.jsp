<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../../css/bootstrap/bootstrap-theme.min.css">
<style type="text/css">
*{
  margin: 0px;
  padding: 0px;
}
</style>
</head>

<body onload="init()">
 <iframe scrolling="no" frameborder="0" src="../header.jsp" width="100%" height="140px"></iframe>
  <input type="hidden" value='${active }' id="active">
 <div class="col-xs-10 col-xs-offset-2" >
   <ol class="breadcrumb" style="background-color:#EEEEEE">
	  <li><span>所在位置&nbsp;&nbsp;&nbsp;&nbsp;</span><a href="../index.jsp" style="color: #333333">名鞋库</a></li>
	  <li class="active">个人中心</li>
   </ol>
 </div>
 
 <div class="col-xs-10" style="margin-left:16%">
    <div class="col-xs-2" >
       <iframe scrolling="no" frameborder="0" src="left.jsp" width="100%" height="250px" id="left"></iframe>
    </div>
    <div class="col-xs-8" style="border: 1px solid #DDDDDD;height:500px;padding-top: 5px">
       <p ><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span style="font-weight: bolder;color:black;margin-left: 8px">个人信息</span></p>
       <div class="col-xs-3">
         <img <c:if test="${user.userPicture==null }">src="../../img/preview.jpg"</c:if> <c:if test="${user.userPicture!=null }">src="/touxiang/${user.userPicture}"</c:if> alt="头像" class="img-thumbnail" style="height:150px;width: 110px;margin-left: 36%">        
       </div>
       <div class="col-xs-9">
         <p>
                                  昵称:&nbsp;&nbsp;${user.userRealname }
           <label style="margin-left:50%"> <a href="user_gotoinfoedit">编辑信息</a> </label>
         </p>
         <p>用户名:&nbsp;&nbsp;jlx</p>
         <p title="享受5折折扣">会员等级:&nbsp;&nbsp;${user.levelName }</p>
         <p>账户:&nbsp;&nbsp;aaaassss</p>
         <p>手机:&nbsp;&nbsp;${user.userPhone==null?'无':user.userPhone }</p>
       </div>
       
       <div class="col-xs-4" style="margin-left: 25%">
         <p>生日:&nbsp;&nbsp;<c:if test="${user.userBirthday==null }">无</c:if><c:if test="${user.userBirthday!=null }"><fmt:formatDate value="${user.userBirthday }" pattern="yyyy年MM月dd日"/> </c:if> </p>
         <p>邮箱:&nbsp;&nbsp;${user.userEmail==null?'无':user.userEmail }</p>
       </div>
    </div>

 </div>
 <iframe scrolling="no" frameborder="0" src="../footer.jsp" width="100%" height="140px;" style="margin-top:20px" ></iframe>
</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript">
function init(){
	   var active= $("#active").val();
	   document.getElementById("left").contentWindow.changeleftColors(active); 
}
</script>
</html>