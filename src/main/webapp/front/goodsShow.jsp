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
<link rel="stylesheet" type="text/css" href="../css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap/bootstrap-theme.min.css">
<link rel="stylesheet" href="../layui/css/layui.css"  media="all">
</head>
<body onload="init()">
 <input type="hidden" id="liActive" value="<%=request.getParameter("liActive") %>">
 <iframe scrolling="no" frameborder="0" src="header.jsp" width="100%" id="header" height="150px"></iframe>
 <div class="col-xs-10 col-xs-offset-2" >
   <ol class="breadcrumb">
	  <li><span>所在位置&nbsp;&nbsp;&nbsp;&nbsp;</span><a href="index.jsp" style="color: #333333">名鞋库</a></li>
	  <li class="active" id="place"></li>
   </ol>
 </div>
 <div class="col-xs-8 col-xs-offset-2" style="height:1400px">
  <c:if test="${page.totalSize>0 }">
     <c:forEach items="${page.shoeList }" var="l" varStatus="vst">
      <div class="col-xs-3" >
	    <div class="thumbnail" style="border: 1px solid red">
	      <img src="/upload/${l.shoePicture}" alt="..." style="height:170px;width:100%">
	      <div class="caption">
	        <b>${l.shoeName}</b><span style="float: right">库存:${l.shoeStock }双</span>
	        <p style="clear:both;height:35px;margin-top:5px;width:175px;">${l.shoeDesc }</p>
	        <p>
	          <span style="color: red;font-size: 13px">
	                                       ￥<fmt:formatNumber value="${l.shoePrice }" pattern="#.00"></fmt:formatNumber>
	          </span> 
	          <a href="shoe_getShowById?shoeId=${l.shoeId }" target="_blank" class="btn btn-default" style="float: right;height: 30px">查看详情</a>
	        </p>
	      </div>
	    </div>
	  </div>
     </c:forEach>
  </c:if> 
  <c:if test="${page.totalSize==0 }">
     <p class="col-xs-offset-5" style="font-size: 20px;font-weight:bold;margin-top: 50px">抱歉,没找到相关的产品!</p>
  </c:if>
  <c:if test="${page.totalSize>page.count}">
    <div  id="page" class="page_div col-xs-12" style="margin-left:10%;text-align: center;"></div>
  </c:if> 
 </div>
<input type="hidden" value="${page.totalPage}" id="totalPage">
<input type="hidden" value="${page.currentPage}" id="currentPage">
<input type="hidden" value="${page.totalSize}" id="totalSize">
<input type="hidden" value="${liActive}" id="liActive">
<input type="hidden" value="${typeName}" id="typeName">
<input type="hidden" value="${searchName}" id="searchName">
<input type="hidden" value="${page.count}" id="count">
  <iframe scrolling="no" frameborder="0" src="footer.jsp" width="100%" height="140px" ></iframe>
</body>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript">
var liActive = $("#liActive").val(); 
var typeName = $("#typeName").val();
var searchName = $("#searchName").val();
   function init(){
	   var liActive =parseInt($("#liActive").val());
	   document.getElementById("header").contentWindow.changeColor(liActive);
	   switch(liActive){
	     case 1:$("#place").html("男子运动");break;
	     case 2:$("#place").html("女子运动");break;
	     case 3:$("#place").html("儿童");break;
	     case 4:$("#place").html("休闲鞋");break;
	     case 5:$("#place").html("运动鞋");break;
	     case 6:$("#place").html("户外");break;
	     case 7:$("#place").html("首页图片");break;
	     default:
	    	 document.getElementById("header").contentWindow.setName(searchName);
	    	 $("#place").html("搜索:"+searchName);break;
	   }
   }
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
		        	 if($("#place").html().substring(0,2)=="搜索"){
		  	    	   location.href = 'shoe_searchShoeFront?currentPage='+obj.curr+"&searchName="+searchName;
		  	       }else{
		  	    	   location.href = "shoe_searchByType?typeName="+typeName+"&currentPage="+obj.curr+"&liActive="+liActive
		  	       }
		         }
		        }
	  })
});
</script>
</html>