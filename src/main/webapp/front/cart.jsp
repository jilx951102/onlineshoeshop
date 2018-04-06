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
<link rel="stylesheet" type="text/css" href="../css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap/bootstrap-theme.min.css">
<link rel="stylesheet" href="../layui/css/layui.css"  media="all">
<style type="text/css">
 #connect{
  color:black;
  float: right 
}
#cart{
  color:black;
  cursor: pointer;
  float: right;
  margin-right:50px
}
</style>
</head>
<body>
    <div class="col-xs-12"  style="height:25px;background-color:#EEEEEE;border-bottom:1px solid #E5E5E5">
       <div class="col-md-5 col-md-offset-5" style="margin-top: 2px;">
         <img src='<c:if test="${u.userPicture==null}">../img/preview.jpg</c:if><c:if test="${u.userPicture!=null}">/touxiang/${u.userPicture}</c:if>' alt="..." class="img-circle" style="margin-left:25%;height:20px;width: 20px" >
	        <span class="dropdown" >
		    <span class=" dropdown-toggle"  id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
		            ${u.userRealname }
		    <span class="caret"></span>
		  </span>
		  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
		    <li><a href="personal/user_gotoInfo" target="parent">个人中心</a></li>
		    <li><a href="../user_out">退出登录</a></li>
		  </ul>
		  </span> 
	        <span id="connect"><span class="glyphicon glyphicon-phone-alt"></span>联系我们<span style="font-weight:bolder;">400-820-100</span></span>
	        <a id="cart" href="cart_gotoCart" target="_parent"><span class="glyphicon glyphicon-shopping-cart"></span>购物车<span style="color:#CC0008">${cartCount }</span>件</a>
	   </div>
       
   </div>
<div class="col-xs-9 col-xs-offset-2" >
   <ol class="breadcrumb">
	  <li><span>所在位置&nbsp;&nbsp;&nbsp;&nbsp;</span><a href="index.jsp" target="top" style="color: #333333;">名鞋库</a></li>
	  <li class="active" >购物车</li>
   </ol>
 </div>
 <div class="col-xs-10 col-xs-offset-2" style="margin-top: -20px">
   <img src="../img/cart_logo.png" alt="..." class="img-thumbnail" style="border: none">
 </div>
 <c:choose>
   <c:when test="${page.totalSize==0 }">
    <div  style="border:1px solid #DDDDDD;margin-left: 17.8%;;height:250px;width: 74%;clear:both;text-align: center;"> 
	   <p style="font-size:15px;margin-top: 70px">
	   <img alt="" src="../img/cart.png">
	          您还没有挑选商品,<a style="color:#FF9900" href="index.jsp">返回首页!</a></p>
     </div> 
   </c:when>
   <c:otherwise>
    <div  style="margin-left: 17.8%;width: 74%;clear:both;"> 
      <table class="table  table-hover">
      <tr >
        <td align="center" width="80">
          <input type="checkbox" onclick="allcheck()" class="allcheck" >
        </td>
        <td align="center">商品图片</td>
        <td align="center" width="200">商品名称</td>
        <td align="center" width="100">购买数量</td>
        <td align="center">库存(双)</td>
        <td align="center">单价</td>
        <td align="center">折扣</td>
        <td align="center">小计</td>
        <td align="center">操作</td>
      </tr>
      <c:forEach items="${page.cartList }" var="c">
        <tr <c:if test="${c.shoe.shoeFlag !=0 }">class="warning" title="该商品下架了"</c:if>>       
        <td align="center" width="80">         
          <input type="checkbox" value="${c.cartId }" class="scheck" onclick="scheck()">
        </td>
        <td align="center">
          <img src="/upload/${c.shoe.shoePicture}" class="img-responsive" alt="Responsive image" style="width:40px;height:40px ">
        </td>
        <td align="center">${c.shoe.shoeName }</td>
        <td align="center">
           <button  <c:if test="${c.shoe.shoeFlag !=0 || c.shoe.shoeStock==0 }">disabled</c:if>  type="button" onclick="cartcut(this)">－</button>
           <input type="text"  value='${c.shoe.shoeStock<=c.cartBuynum?c.shoe.shoeStock:c.cartBuynum }' style="width: 30px" onkeydown="cartcheckNum(this,${c.shoe.shoeStock})" onkeyup="cartcheckNum(this,${c.shoe.shoeStock})" onkeypress="cartcheckNum(this,${c.shoe.shoeStock})" onchange="cartcheckNum2(this)" >
           <button  <c:if test="${c.shoe.shoeFlag !=0 }">disabled</c:if> type="button"  onclick="cartadd(this,${c.shoe.shoeStock})">＋</button>
        </td>
        <td align="center">${c.shoe.shoeStock }</td>
        <td align="center">￥<fmt:formatNumber value="${c.shoe.shoePrice }" pattern="#0.00"></fmt:formatNumber></td>
        <td align="center"><fmt:formatNumber value="${levelCut }" pattern="0.00"></fmt:formatNumber></td>
        <td align="center">￥<fmt:formatNumber value="${c.shoe.shoePrice*levelCut*c.cartBuynum }" pattern="#0.00"></fmt:formatNumber></td>
        <td align="center">
          <a href="javascript:;" onclick="cartDel(this)">删除</a>
          <input value="${c.cartId }"  type="hidden">
        </td>
      </tr> 
      </c:forEach>
      <tr>
        <td colspan="9" align="center">
            <p style="float: left;margin-left: 18px">
              <a href="javascript:;" onclick="cartDelAll()">删除</a>
            </p>
            <p style="float:right">
                <button id="gotopay" disabled="disabled" onclick="gotopay()" class="btn " type="button" style="margin-left:20%;background-color:#FF8600;font-weight: bold;color: white;margin-left:10px">
                <span class="glyphicon glyphicon-ok" aria-hidden="true" ></span>下单结算</button>
            </p>
            <p style="float:right;color: black;font-size:15px;margin-right: 10px;margin-top: 10px">共计:￥<span id="allMoney" style="color: #FF0000">0.00</span></p>
         </td>
      </tr>
     </table>
  <c:if test="${page.totalSize>page.count}">
    <div  id="page" class="page_div col-xs-10 "  ></div>
  </c:if>   
 </div>
   </c:otherwise>
 </c:choose>
<input type="hidden" value="${page.totalPage}" id="totalPage">
<input type="hidden" value="${page.currentPage}" id="currentPage">
<input type="hidden" value="${page.totalSize}" id="totalSize">
<input type="hidden" value="${page.count}" id="count">
<iframe scrolling="no" frameborder="0" src="footer.jsp" width="100%" height="140px" style="margin-top:100px"></iframe>
</body>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
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
		        	 location.href = "cart_gotoCart?currentPage="+obj.curr
		         }
		        }
	  })
});
   function gotopay(){
	   var flag = true;
	   $.each($(".scheck:checked"),function(index){		 
		 if($(this).parent().parent().attr("title") == "该商品下架了" || $(this).parent().siblings(":eq(3)").html() =="0"){
			 flag = false;
		 } 
		 
	   });
	   if(!flag){
		   layer.msg("有商品下架了或没货了,无法前往付款",{
				 icon:2,
				 time:1500
			 })
	   }else{
		 var array = getArray();
		 var cartIds= "";
		 for(var i =0;i<array.length;i++){
			 cartIds+=array[i]+",";
		 }
		 location.href = "cart_gotoPay?cartIdses="+cartIds   
	   }
   }
   
   function cartDel(obj){
	   var cartId = $(obj).next().val();
	   layer.confirm('确认删除吗?', {
			  btn: ['是','否'], //按钮
			  icon:3,
			},function(){
				$.ajax({
					url:'cart_cartDel',
					data:{
						cartId:cartId
					},
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
								icon:1,
								time:1500,
							})
						}
					}
				})
			});
   }
   function cartDelAll(){
	   if($(".scheck:checked").length<=0){
		   layer.msg("请选择要删除的商品",{
			   icon:7,
			   time:1500
		   });		   
	   }else{
		   layer.confirm('确认删除吗?', {
				  btn: ['是','否'], //按钮
				  icon:3,
				},function(){
				  var array = getArray();
				  $.ajax({
					  url:'cart_cartDelAll',
					  data:{
						  cartIds:array
					  },
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
									time:1500,
								})
							} 
					  }
				  })
				})
	   }
   }
</script>
</html>