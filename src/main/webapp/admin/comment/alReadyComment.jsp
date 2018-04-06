<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
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
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe622;</i>评论管理<span class="c-666 en">&gt;</span><span class="c-666">未回复评论</span>
    <a href="javascript:;" onclick="location.reload()"><i class="Hui-iconfont btn btn-success radius" style="float:right;margin-top: 4px">&#xe68f;</i> </a>
</nav>
<form action="#" method="post" class="col-xs-offset-4" style="margin-top: 10px">
   <input type="text" id="searchName" value="${searchName }" placeholder="输入用户名或商品名或回复者名" class="input-text radius size-M" style="width: 250px">
   <button class="btn btn-success radius" onclick="searchAlreadyComment(searchName)" type="button">搜索</button>
   <button class="btn btn-success radius" onclick="qk(searchName)" type="button">重置</button>
</form>
<table class="table table-border table-bordered table-striped table-hover" style="margin-top: 5px">
   <tr>
     <td class="text-c">商品名</td>
     <td class="text-c">用户名</td>
     <td class="text-c">回复者</td>
     <td class="text-c">评论时间</td>
     <td class="text-c">回复时间</td>
     <td class="text-c">状态</td>
     <td class="text-c">操作</td>
   </tr>
   <c:choose>
     <c:when test="${page.totalSize==0 }">
	   <tr>
	     <td colspan="7" class="text-c">暂无数据</td>
	   </tr>
     </c:when>
     <c:otherwise>
        <c:forEach items="${page.clist }" var="c" varStatus="vst">
           <tr>
		     <td class="text-c"><a href="javascript:;" onclick="watchonLineshoeInfo(this)"><span style="display:none">${c.shoe.shoeId}</span> ${c.shoe.shoeName }</a></td>
		     <td class="text-c">${c.user.userRealname }</td>
		     <td class="text-c">${c.user2.userRealname }</td>
		     <td class="text-c">
		       <fmt:formatDate value="${c.commentTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
		     </td>
		     <td class="text-c">
		       <fmt:formatDate value="${c.answer.answerTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
		     </td>
		     <td class="text-c"><span class="label label-success radius">已回复</span></td>
		     <td class="text-c">
		        <input type="hidden" value="${c.commentId }">
		        <a href="javascript:;" onclick="seeComment(this)"><i class="Hui-iconfont">&#xe725;</i>查看</a>
		     </td>
		   </tr>
        </c:forEach>
     </c:otherwise>
   </c:choose>
   

</table>
<c:if test="${page.totalPage>1 }">
   <div style="margin-top: 10px;margin-left: 26%" id="page" class="page_div"></div>
</c:if>
<input type="hidden" value="${page.totalPage}" id="totalPage">
<input type="hidden" value="${page.currentPage}" id="currentPage">
<input type="hidden" value="${page.totalSize}" id="totalSize">
<input type="hidden" value="${sFlag}" id="sFlag">
<input type="hidden" value="${page.count}" id="count">
</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script> 
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript" src="../../layui/layui.js"></script>
<script type="text/javascript">
	function seeComment(obj){
		  open("回复评论",'450px','280px','comment_seeComment?commentId='+$(obj).prev().val());
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
		        	 var searchName = $("#searchName").val().trim();
						if(sFlag==="1"){
							location.href = "comment_searchAlreadyComment?currentPage="+obj.curr+"&searchName="+searchName+"&sFlag="+sFlag
						}else{
							location.href = "comment_alReadyComment?currentPage="+obj.curr;
						}
		         }
		        }
	  })
});
		function searchAlreadyComment(searchName){
			var searchName = $(searchName).val().trim();
			location.href = "comment_searchAlreadyComment?currentPage="+currentPage+"&searchName="+searchName+"&sFlag="+1;
		} 
		function qk(searchName){
			$(searchName).val("");
		}
		function watchonLineshoeInfo(obj){
			var shoeId = $(obj).children(":eq(0)").html();    
			open("查看鞋信息","350px","350px","../GoodsManage/shoe_watchonLineshoe?shoeId="+shoeId+"&shoeFlag="+0);
		}
</script>
</html>