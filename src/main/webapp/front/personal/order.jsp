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
<link rel="stylesheet" type="text/css" href="../../css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../../css/bootstrap/bootstrap-theme.min.css">
<link rel="stylesheet" href="../../layui/css/layui.css"  media="all">
<style type="text/css">
*{
  margin: 0px;
  padding: 0px;
}
</style>
</head>

<body onload="init()">
 <input type="hidden" value='${active}' id="active">
 <iframe scrolling="no" frameborder="0" src="../header.jsp" width="100%" height="140px"></iframe>
 
 <div class="col-xs-10 col-xs-offset-2" >
   <ol class="breadcrumb">
	  <li><span>所在位置&nbsp;&nbsp;&nbsp;&nbsp;</span><a href="../index.jsp" style="color: #333333">名鞋库</a></li>
	  <li class="active">个人中心</li>
   </ol>
 </div>
 
 <div class="col-xs-10" style="margin-left:16%">
    <div class="col-xs-2" >
       <iframe scrolling="no" frameborder="0" src="left.jsp" width="100%" height="250px" id="left"></iframe>
    </div>
    <div class="col-xs-10" style="border: 1px solid #DDDDDD;height:780px;padding-top: 5px">
        <p ><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span><span style="font-weight: bolder;color:black;margin-left: 8px">已付款订单</span></p>
        <c:choose>
          <c:when test="${page.totalSize==0 }">
             <div class="col-xs-12">
                <p style="color:blcak;font-weight:bolder;font-size:18px;margin-left:45%;margin-top:50px">暂无订单,<a href="../index.jsp" style="color: #FF8600">去逛逛!</a> </p>
             </div>
          </c:when>
          <c:otherwise>
             <div class="col-xs-12">
	          <c:forEach items="${page.olist }" var="o" varStatus="vst">
	             <p>
		             <span style="float:left;font-weight: bolder;">订单号:${o.orderId }</span>
		             <c:if test="${fn:indexOf(o.orderFlag,'1')==0 }">
		                <span style="float:right;width: 60px;margin-left: 20px"><a href="javascript:;" onclick="receiveOrder(this)">确认收货</a></span> 
		             </c:if>
		             <span style="float:right">发货状态:
		                <c:if test="${fn:indexOf(o.orderFlag,'0')==0 }">
		                                                         未发货
		                </c:if>
		                <c:if test="${fn:indexOf(o.orderFlag,'1')==0 }">
		                                                       已发货
		                </c:if>
		             </span>            
		          </p>
		          <table class="table table-striped table-bordered table-hover">
					  <tr>
					    <td align="center">序号</td> 			    
					    <td align="center">商品名称</td> 
					    <td align="center">图片</td> 
					    <td align="center">商品描述</td> 
					    <td align="center">购买数量</td>
					    <td align="center">价格(元)</td>
					    <td align="center">下单时间</td>
					 </tr>
					 <tr>
					    <td align="center">${page.count*(page.currentPage-1)+vst.count}</td>	
					    <td align="center">${o.shoe.shoeName }</td> 
					    <td align="center">
					       <img src="/upload/${o.shoe.shoePicture }" style="height:40px;width: 40px" alt="..." class="img-rounded">
					    </td> 
					    <td align="center">${o.shoe.shoeDesc }</td> 
					    <td align="center">${o.orderBuynum }</td>
					    <td align="center">
					       <fmt:formatNumber value="${o.orderMoney }" pattern="0.00"/>
					    </td>
					    <td align="center">
					       <fmt:formatDate value="${o.orderTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
					    </td>
					 </tr>
				 </table>
	          </c:forEach>
	        </div>
          </c:otherwise>
        </c:choose>
        
        <c:if test="${page.totalPage>1 }">
           <div style="margin-top: 10px" id="page" class="page_div"></div>
        </c:if>  
    </div>

<input type="hidden" value="${page.totalPage}" id="totalPage">
<input type="hidden" value="${page.currentPage}" id="currentPage">
<input type="hidden" value="${page.totalSize}" id="totalSize">
<input type="hidden" value="${page.count}" id="count">
 </div>
 <iframe scrolling="no" frameborder="0" src="../footer.jsp" width="100%" height="140px;" style="margin-top:20px" ></iframe>
</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript" src="../../layui/layui.js"></script>
<script type="text/javascript">
   function init(){
	   var active= $("#active").val();
	   document.getElementById("left").contentWindow.changeleftColors(active); 
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
		        	 var active= $("#active").val();
						location.href = "order_personOrder?currentPage="+obj.curr+"&active="+active;
		         }
		        }
	  })
});
		function receiveOrder(obj){
			layer.confirm('确认收货?', {
				  btn: ['确认','取消'] //按钮
				}, function(){
					$.ajax({
						url:'order_receiveOrder',
						data:{orderId:$(obj).parent().prev().html().substring(4)},
						type:'post',
						success:function(data){
							if(data===1){
								layer.msg("收货成功",{
									icon:1,
									time:1500
								},function(){
									location.reload();
								})
							}else{
								layer.msg("收货失败",{
									icon:2,
									time:1500
								})
							}
						}
					})
				} 
				)
			
			
		}
</script>
</html>