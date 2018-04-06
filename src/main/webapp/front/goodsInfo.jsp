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
<style type="text/css">
  *{
   margin: 0px;
   padding: 0px;
  }
</style>
</head>
<body>
 <iframe scrolling="no" frameborder="0" src="header2.jsp" width="100%" id="header2" height="90px"></iframe>
 
 <div class="col-xs-8 col-xs-offset-2">
    <div class="col-xs-2">
         <a href="javascript:;" class="thumbnail">
          <img src="/upload/${shoe.shoePicture}" alt="...">
        </a>
    </div>
    <div class="col-xs-4 " style="margin-left: 3%">
        <input type="hidden" id="shoeName" value="${shoe.shoeName }">
        <input type="hidden" id="shoeId" value="${shoe.shoeId }">
        <input type="hidden" id="shoeStock" value="${shoe.shoeStock }">
        <p style="color:black;font-weight: bolder;">商品名称:${shoe.shoeName }</p>
        <p style="color: #666666">吊牌价:<span style="text-decoration: line-through;">￥<fmt:formatNumber value="${shoe.shoePrice }" pattern="#.00"/></span></p>
        <p style="color: #666666">现价:<span style="color:red">￥<fmt:formatNumber value="${shoe.shoePrice }" pattern="#.00"/></span> </p>
        <p style="color: #666666">库存:${shoe.shoeStock }双 </p>
        <p style="color: #666666">描述:${shoe.shoeDesc }</p>
        <p style="color: #666666">运费:￥0</p>
        <p style="color: #666666">购买数量:
           <button type="button" onclick="cut(this)">－</button>
           <input type="text" id="buyNum" value="${buyNum==0?1:buyNum }" style="width: 30px" onkeydown="checkNum(this,shoeStock)" onkeyup="checkNum(this,shoeStock)" onkeypress="checkNum(this,shoeStock)" onchange="checkNum2(this)" >
           <button type="button" onclick="add(this,shoeStock)">＋</button>
        </p>
    </div>
    <div class="col-xs-12">
       <button class="btn " onclick="gotoBuy(shoeId,buyNum)" type="button" style="margin-left:20%;background-color:#CC1110;font-weight: bold;color: white">
              <span class="glyphicon glyphicon-ok" aria-hidden="true" ></span>直接购买</button>
       <button class="btn " onclick="addIntoCart(shoeId,shoeName)" type="button" style="background-color: #EE6800;font-weight: bold;color: white">
              <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true" ></span> 加入购物车</button>
    </div>
 </div>
 <div class="col-xs-7 col-xs-offset-2" style="margin-top:100px">
    <p style="color:black;font-weight:bold;font-size: 16px">商品评论(${page.totalSize })</p>
    <hr style="width: 100%;"/>
    <c:choose>
       <c:when test="${page.totalSize==0 }">
           <p>暂无评论</p>
       </c:when>
       <c:otherwise>
          <c:forEach items="${page.cList }" var="c" >
            <div class="col-xs-2"style="text-align: left;">
               <img src='<c:if test="${c.user.userPicture==null}">../img/preview.jpg</c:if><c:if test="${c.user.userPicture!=null}">/touxiang/${c.user.userPicture}</c:if>' alt="..." class="img-circle" style="margin-left:25%;height:20px;width: 20px" >
              <p style="color: #005AA0">${c.user.userRealname }</p>
            </div>
		    <div class="col-xs-10" style="border:1px solid #E5E5E5">
		       <p style="float:right;">评论时间:<fmt:formatDate value="${c.commentTime }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
		       <p style="clear: both">${c.commentContent }</p>
		       <c:if test="${c.user2!=null }">
		           <p style="color: #666666">
			         <span>掌柜回复:</span>
			         <span>${c.answer.answerContent }</span>
			         <span style="display: block">(<fmt:formatDate value="${c.answer.answerTime }" pattern="yyyy-MM-dd HH:mm:ss"/>)</span>
			       </p>
		       </c:if>
		       
		    </div>
		    <div class="col-xs-12" style="height:20px"></div>
          </c:forEach>
       </c:otherwise>
    </c:choose>   
    
<c:if test="${page.totalPage>1 }">
   <div  id="page" class="page_div col-xs-12" ></div>  
</c:if>
<input type="hidden" value="${page.totalPage}" id="totalPage">
<input type="hidden" value="${page.currentPage}" id="currentPage">
<input type="hidden" value="${page.totalSize}" id="totalSize">
<input type="hidden" value="${page.count}" id="count">
 </div>
 <iframe scrolling="no" frameborder="0" src="footer.jsp" width="100%" height="140px" style="margin-top:100px"></iframe>
 
</body>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
 function addIntoCart(shoeId,shoeName){
	 var buyNum = $("#buyNum").val();
     $.ajax({
    	 url:'shoe_addIntoCart',
    	 data:{
    		 shoeId:$(shoeId).val(),
    		 buyNum:buyNum,
    	 },
    	 type:'post',
    	 success:function(data){
    		 if(data===1){
    			 layer.confirm('成功添加'+$(shoeName).val()+buyNum+'件', {
    				  btn: ['购物车','再逛逛'] //按钮
    				}, function(){
    				    location.href = "cart_gotoCart"
    				} 
    				); 
    		 }else if(data===3){
    			layer.alert("请先登录",{
    				icon:1
    			},function(){
    				location.href = "../user_addintoCart?shoeId="+$(shoeId).val()+"&buyNum="+buyNum
    			}) 
    		 }else{
    			 layer.alert("添加过该商品，且添加后数量超过库存",{
    				 icon:2,
    			 });
    		 }
    	 }
     })
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
		        	 var shoeId= $("#shoeId").val();
		  	       var buyNum = $("#buyNum").val();
		  	       location.href = "shoe_getShowById?shoe_id="+shoeId+"&currentPage="+obj.curr+"&buyNum="+buyNum ;
		         }
		        }
	  })
});
	function gotoBuy(shoeId,buyNum){
	 $.ajax({
		 url:'user_checkTobuy',
		 data:{},
		 type:'post',
		 success:function(data){
			 if(data===1){
				 location.href = "shoe_gotoBuy?shoeId="+$(shoeId).val()+"&buyNum="+$(buyNum).val();
			 }else{
				 layer.alert("请先登录",{
	    				icon:1
	    			},function(){
	    				location.href = "../user_addintoCart?shoeId="+$(shoeId).val()+"&buyNum="+$(buyNum).val()
	    			}) 
			 }
		 }
	 })
 }
</script>
</html>