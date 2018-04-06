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
        <p ><span class="glyphicon glyphicon-tag" aria-hidden="true"></span><span style="font-weight: bolder;color:black;margin-left: 8px">待付款订单</span></p>
        <c:choose>
          <c:when test="${page.totalSize==0 }">
             <div class="col-xs-12">
                <p style="color:blcak;font-weight:bolder;font-size:18px;margin-left:45%;margin-top:50px">暂无相关订单,<a href="../index.jsp" style="color: #FF8600">去逛逛!</a> </p>
             </div>
          </c:when>
          <c:otherwise>
             <div class="col-xs-12">
	          <c:forEach items="${page.olist }" var="o" varStatus="vst">
	             <p>
		             <span style="float:left;font-weight: bolder;">订单号:${o.orderId }</span>
		             <span style="float:right;width: 60px;"><a href="javascript:;" onclick="orderDel(this)">删除</a></span> 
		             <span style="float:right;margin-right: 10px"><c:if test="${fn:indexOf(o.payFlag,'2')!=-1 }">交易已关闭
		                </c:if>  
		                <c:if test="${fn:indexOf(o.payFlag,'0')!=-1 }">
		                                                       距离交易关闭:<span class="time" style="color:blue"></span>
		                           <input value=' <fmt:formatDate value="${o.orderTime }" pattern="yyyyMMddHHmmss"/>' type="hidden">
		                </c:if> 
		                 
		             </span>
		          </p>
		          <table class="table table-striped table-bordered table-hover">
					  <tr>
					    <td align="center">
					       
					    </td> 			    
					    <td align="center">商品名称</td> 
					    <td align="center">图片</td> 
					    <td align="center">商品描述</td> 
					    <td align="center">购买数量</td>
					    <td align="center">价格(元)</td>
					    <td align="center">下单时间</td>
					 </tr>
					 <tr>
					    <td align="center">
					      <input type="checkbox" class="scheck" onclick="scheck()" value="${o.orderId }">
					    </td>	
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
        <c:if test="${page.totalSize>0 }">
          <p>
            <span style="float:left;margin-left: 18px"><input type="checkbox" class="allcheck" onclick="allcheck()">全选</span>
            <span style="float:left;width: 60px;margin-left: 18px"><a href="javascript:;" onclick="orderDelAll()">删除</a></span> 
            <p style="float:right;margin-right:18px">
                <button id="gotopay" disabled="disabled" onclick="paymoney()" class="btn " type="button" style="margin-left:20%;background-color:#FF8600;font-weight: bold;color: white;margin-left:10px">
                <span class="glyphicon glyphicon-ok" aria-hidden="true" ></span>结算</button>
            </p>
            <p style="float:right;color: black;font-size:15px;margin-right: 10px;margin-top: 10px">共计:￥<span id="allMoney" style="color: #FF0000">0.00</span></p>
          </p>
        </c:if>
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
	  var util = layui.util
	  ,laydate = layui.laydate
	  ,layer = layui.layer,
	  laypage = layui.laypage;
	//倒计时
	    $(".time").each(function(index){
	    	    var thisTimer, setCountdown = function(y, M, d, H, m, s){
	    	    var endTime = new Date(y, M||0, d||1, H||0, m||0, s||0) //结束日期
	    	    ,serverTime = new Date(); //假设为当前服务器时间，这里采用的是本地时间，实际使用一般是取服务端的	     
	    	    clearTimeout(thisTimer);
	    	    util.countdown(endTime, serverTime, function(date, serverTime, timer){
	    	      var str =  date[1] + '时' +  date[2] + '分' + date[3] + '秒';
	    	      if(str==="0时0分0秒"){
	    	    	  $($(".time").get(index)).parent().html("交易已关闭");
	    	      }else{
	    	    	  $(".time").get(index).innerHTML = str; 
	    	      }	    	      
	    	      thisTimer = timer;
	    	      
	    	    });
	    	  };
	    	  var t = $(this).next().val();
	    	  var time = new Date(t.substring(0,5),parseInt(t.substring(5,7))-1,t.substring(7,9),t.substring(9,11),parseInt(t.substring(11,13))+10,t.substring(13));
	    	  setCountdown(time.getFullYear(),time.getMonth(),time.getDate(),time.getHours(),time.getMinutes(),time.getSeconds());	
	    })
	    
	  
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
						location.href = "order_personStayOrder?currentPage="+obj.curr+"&active="+active;
		         }
		        }
	  })
	  
	  
});
		
function orderDel(obj){
	layer.confirm('确认删除?', {
		  btn: ['确认','取消'] //按钮
		}, function(){
			$.ajax({
				url:'order_orderDel',
				data:{orderId:$(obj).parent().prev().html().substring(4)},
				type:'post',
				success:function(data){
					if(data===1){
						layer.msg("删除成功",{
							icon:1,
							time:1500
						},function(){
							location.reload();
						})
					}else{
						layer.msg("删除失败",{
							icon:2,
							time:1500
						})
					}
				}
			})
		});
}
function orderDelAll(){
	if($(".scheck:checked").length==0){
		layer.msg("请选择要删除的订单");
	}else{
		layer.confirm('确认删除这些订单吗?', {
			  btn: ['确认','取消'] //按钮
			}, function(){
				var array = getArray();
				$.ajax({
					url:'order_orderDelAll',
					data:{orderIds:array},
					traditional: true,
					type:'post',
					success:function(data){
						if(data===1){
							layer.msg("删除成功",{
								icon:1,
								time:1500
							},function(){
								location.reload();
							})
						}else{
							layer.msg("删除失败",{
								icon:2,
								time:1500
							})
						}
					}
				})
			})
	}
}

   function allcheck(){
	   $(".scheck").prop("checked",$(".allcheck").prop("checked"));
	   $("#gotopay").prop("disabled",!$(".allcheck").prop("checked"));
	   jszj();
   }
   function scheck(){
        $(".allcheck").prop("checked",$(".scheck:checked").length==$(".scheck").length);
        $("#gotopay").prop("disabled",!$(".scheck:checked").length>0);
        jszj();
   }
   
   function paymoney(){
	   var flag = true;
	  $(".scheck:checked").each(function(index){
		  console.log($(this).parent().parent().parent().parent().prev().children(":eq(2)").html().substring(0,5)=="交易已关闭");
		  if($(this).parent().parent().parent().parent().prev().children(":eq(2)").html().substring(0,5)=="交易已关闭"){			  
			  layer.msg("有订单交易关闭了");
			  flag = false;
		  }
	  })
	  if(flag){
		  var orderIds = getArray();
		  var orderId = "";
		  for(var i=0;i<orderIds.length;i++){
			  orderId+=orderIds[i];
		  }
		  location.href="../alipay.jsp?orderId="+orderId
			+"&orderMoney=0.01&orderName=鞋";
	  } 
	
   }
</script>
</html>