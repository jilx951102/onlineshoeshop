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
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe687;</i>订单管理<span class="c-666 en">&gt;</span><span class="c-666">未处理订单</span>
    <a href="javascript:;" onclick="location.reload()"><i class="Hui-iconfont btn btn-success radius" style="float:right;margin-top: 4px">&#xe68f;</i> </a>
</nav>
<form action="javascript:;" method="post" class="col-xs-offset-4" style="margin-top: 10px">
   <input type="text" id="searchName" value="${searchName }" placeholder="输入用户名或订单号" class="input-text radius size-M" style="width: 250px">
   <button class="btn btn-success radius" onclick="searchStayOrder(searchName)" type="button">搜索</button>
   <button class="btn btn-success radius" onclick="qk(searchName)" type="button">清空</button>
</form>
<button class="	btn btn-secondary radius" type="button" onclick="sendOrderAll()"><i class="Hui-iconfont">&#xe6dc;</i> 批量发货</button>
<table class="table table-border table-bordered table-striped table-hover" style="margin-top: 5px">
   <tr>
     <td class="text-c"><input type="checkbox"  class="allcheck" onclick="allcheck()"> </td>
     <td class="text-c">序号</td>
     <td class="text-c">订单号</td>
     <td class="text-c">商品名称</td>
     <td class="text-c">购买数量(双)</td>
     <td class="text-c">金额(元)</td>
     <td class="text-c">用户名</td>
     <td class="text-c">下单时间</td>
     <td class="text-c">订单状态</td>
     <td class="text-c">操作</td>
   </tr>
   <c:choose>
     <c:when test="${page.totalSize==0 }">
        <tr>
       <td colspan="10" class="text-c">暂无数据</td>
      </tr>
     </c:when>
     <c:otherwise>
       <c:forEach items="${page.olist }" var="o" varStatus="vst">
          <tr>
		     <td class="text-c"><input type="checkbox" value="${o.orderId }" class="scheck" onclick="scheck()"> </td>
		      <td class="text-c">${page.count*(page.currentPage-1)+vst.count}</td>
		     <td class="text-c">${o.orderId }</td>
		     <td class="text-c"><a href="javascript:;" onclick="watchonLineshoeInfo(this)"><span style="display:none">${o.shoe.shoeId}</span> ${o.shoe.shoeName }</a> </td>
		     <td class="text-c">${o.orderBuynum }</td>
		     <td class="text-c">
		       <fmt:formatNumber value="${o.orderMoney }" pattern="0.00"/>
		     </td>
		     <td class="text-c">
		        ${o.user.userRealname }
		     </td>
		     <td class="text-c">
		        <fmt:formatDate value="${o.orderTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
		     </td>
		     <td class="text-c"><span class="label label-success radius">待发货</span></td>
		     <td class="text-c">
		        <a href="javascript:;" onclick="sendOrder(this)"><i class="Hui-iconfont">&#xe6dc;</i>发货</a>
		        <a href="javascript:;" onclick="orderSee(this)"><i class="Hui-iconfont">&#xe725;</i>查看</a>
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
<script type="text/javascript" src="../../layui/layui.js"></script>
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript">
  var sFlag = $("#sFlag").val();
  function orderSee(obj){
	  var orderId = $(obj).parent().siblings(":eq(2)").html();
	  open("订单详情",'450px','377px','order_seeOrder?orderId='+orderId);
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
							location.href = "order_searchStayOrder?currentPage="+obj.curr+"&searchName="+searchName+"&sFlag="+sFlag
						}else{
							location.href = "order_stayOrder?currentPage="+obj.curr;
						}
		         }
		        }
	  })
});
		function searchStayOrder(searchName){
			var searchName = $(searchName).val().trim();
			location.href = "order_searchStayOrder?currentPage="+currentPage+"&searchName="+searchName+"&sFlag="+1;
		}
		function qk(searchName){
			$(searchName).val("");
		}
		function sendOrder(obj){
			 var orderId = $(obj).parent().siblings(":eq(2)").html();
			 layer.confirm('确认发货吗?', {
				  btn: ['是','否'] //按钮
				}, function(){
					 $.ajax({
						 url:'order_sendOrder',
						 data:{orderId:orderId},
						 type:'post',
						 success:function(data){
							 if(data===1){
								 layer.msg("发货成功",{
									 icon:1,
									 time:1500,
								 },function(){
									 location.reload();
								 })
							 }else{
								 layer.msg("发货失败",{
									 icon:2,
									 time:1500
								 })
							 }
						 }
					 })
				} 
				); 
			
		}
		function sendOrderAll(){
			if($(".scheck:checked").length==0){
				layer.msg("请选择要发货的商品",{
					icon:2,
					time:1500
				});
			}else{
				layer.confirm('确认发货吗', {
  				  btn: ['是','否'] //按钮
  				}, function(){
  				    var array = getArray();
  				    $.ajax({
  				    	url:'order_sendOrderAll',
  				    	data:{orderIds:array},
  				    	type:'post',
  				    	traditional: true,
  				    	success:function(data){
  				    		if(data===1){
								 layer.msg("发货成功",{
									 icon:1,
									 time:1500,
								 },function(){
									 location.reload();
								 })
							 }else{
								 layer.msg("发货失败",{
									 icon:2,
									 time:1500
								 })
							 }
  				    	}
  				    })
  				} 
  				); 
			}
		}
		//全选 
		function allcheck() {
			$(".scheck").prop("checked", $(".allcheck").prop("checked"));
		}
		function scheck() {
			$(".allcheck").prop("checked",
					$(".scheck:checked").length == $(".scheck").length);
		}
		
		function watchonLineshoeInfo(obj){
			var shoeId = $(obj).children(":eq(0)").html();    
			open("查看鞋信息","350px","350px","../GoodsManage/shoe_watchonLineshoe?shoeId="+shoeId+"&shoeFlag="+0);
		}
</script>
</html>