<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../../css/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/css/style.css" />
 <link rel="stylesheet" href="../../layui/css/layui.css"  media="all">
<title>Insert title here</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe620;</i>会员管理<span class="c-666 en">&gt;</span>会员管理
  <button type="button" class="btn btn-success radius" onclick="location.reload()" style="float:right;margin-top: 4px"><i class="Hui-iconfont">&#xe68f;</i></button>
</nav>
<div class="col-7 col-xs-offset-3"  style="margin-top: 10px">
   <form action="">
	<span class="select-box radius" style="width: 100px">
	  <select class="select" size="1" name="user.levelCount" id="levelCount">
	      <option value="0" >全选</option>
	    <c:forEach items="${levelList}" var="l" varStatus="vst">
	      <option value="${l.levelCount }" <c:if test="${l.levelCount==levelCount}">selected</c:if> >${l.levelName}</option>
	    </c:forEach>			  
	  </select>
	</span>
   <input type="text" id="userName"  name="userName" value="${userName }" placeholder="输入用户名或者昵称" class="input-text radius size-M" style="width: 280px">
   <button type="button" onclick="searchPeople()" class="size-M btn btn-success radius"><i class="Hui-iconfont">&#xe683;</i>查询</button>
   <button type="button" onclick="qk(userName)" class="size-M btn btn-success radius"><i class="Hui-iconfont">&#xe6a6;</i>重置</button>
   </form>
</div>
<div style="margin-top: 10px">
   <table class="table table-border table-bg table-bordered radius table-hover">
      <tr>
         <td class="text-c">序号</td>
         <td class="text-c">登录名</td>
         <td class="text-c">昵称</td>
         <td class="text-c">手机号码</td>
         <td class="text-c">创建时间</td>
         <td class="text-c">会员等级</td>
         <td class="text-c">购买鞋数</td>
      </tr>
      <c:if test="${page.totalSize==0}">
        <tr>
         <td colspan="7" class="text-c">
                                 暂时无数据
         </td>
      </tr>
      </c:if>
       <c:if test="${page.totalSize>0}">
        <c:forEach items="${userList }" var="u" varStatus="vst">
          <tr>
	         <td class="text-c">${page.count*(page.currentPage-1)+vst.count}</td>
	         <td class="text-c">${u.userName}</td>
	         <td class="text-c">${u.userRealname}</td>
	         <td class="text-c">${u.userPhone }</td>
	         <td class="text-c">
	           <fmt:formatDate value="${u.userTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
	         </td>
	         <td class="text-c">${u.levelName }</td>
	         <td class="text-c">${u.levelCount}</td>
          </tr>
        </c:forEach>
      </c:if>
   </table>
</div>
<c:if test="${page.totalSize>page.count}">
    <div style="margin-top: 10px;margin-left: 26%" id="page" class="page_div"></div>
</c:if>
<input type="hidden" value="${page.totalPage}" id="totalPage">
<input type="hidden" value="${page.currentPage}" id="currentPage">
<input type="hidden" value="${page.totalSize}" id="totalSize">
<input type="hidden" value="${us}" id="us">
<input type="hidden" value="${page.count}" id="count">
</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script> 
<script type="text/javascript" src="../../layui/layui.js"></script>
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript">
var us = $("#us").val();
layui.use(['util', 'laydate', 'layer','laypage'], function(){
	  layer = layui.layer,
	  laypage = layui.laypage;
	  laypage.render({
		    elem: 'page'
		    ,count: parseInt(totalSize),
		     limit:parseInt(count)
		    ,first: '首页'
		    ,last: '尾页'
		    ,prev: '上一页'
		    ,next: '下一页',
		    theme: '#2D6DCC',
		    curr:parseInt(currentPage),
		    layout: ['prev', 'page', 'next','count', 'skip'],
		    jump: function(obj,first){
		         if(!first){
		        	 var levelCount = $("#levelCount").val();
		 			var userName = $("#userName").val().trim();
		 			if(us==="1"){
		 				var levelCount2 = 0;
		 				if(typeof $("#levelCount").children(":selected").next().val() ==='undefined'){
		 					levelCount2 = levelCount;
		 				}else if(typeof $("#levelCount").children(":selected").prev().val() ==='undefined'){
		 					levelCount2 =0;
		 				}else{
		 					levelCount2 =$("#levelCount").children(":selected").next().val();
		 				}
		 				location.href = "user_searchPeople?levelCount="+levelCount+"&userName="+userName+"&us="+us+"&currentPage="+obj.curr+"&levelCount2="+levelCount2;
		 			}else{
		 				location.href = "user_initPeople?levelCount="+levelCount+"&userName="+userName+"&currentPage="+obj.curr;
		 			}
		         }
		        }
	  })
});
function searchPeople(){
	var levelCount = $("#levelCount").val();
	var userName = $("#userName").val().trim();
	var levelCount2 = 0;
	if(typeof $("#levelCount").children(":selected").next().val() ==='undefined'){
		levelCount2 = levelCount;
	}else if(typeof $("#levelCount").children(":selected").prev().val() ==='undefined'){
		levelCount2 =0;
	}else{
		levelCount2 =$("#levelCount").children(":selected").next().val();
	}
	location.href = "user_searchPeople?levelCount="+levelCount+"&userName="+userName+"&us="+1+"&levelCount2="+levelCount2;
}
function qk(val){
	  $("#levelCount").children(":eq(0)").prop("selected",true);
	  $(val).val("");
}
</script>
</html>