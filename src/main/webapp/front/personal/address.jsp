<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 <input type="hidden" value='${active }' id="active">
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
    <div class="col-xs-8" style="border: 1px solid #DDDDDD;height:700px;padding-top: 5px">
        <p ><span class="glyphicon glyphicon-home" aria-hidden="true"></span><span style="font-weight: bolder;color:black;margin-left: 8px">收货地址</span></p>  
        <c:if test="${page.totalSize==0 }">
           <p>暂无收货地址,<a href="user_gotoaddressedit?active=3" style="color: #FF7E52">点击添加!</a> </p>
        </c:if> 
        <div>
          <p style="border:1px solid #E5E5E5;width:100px;color: #666666;"><span class="glyphicon glyphicon-plus" style="margin-left: 5px"></span><a href="user_gotoaddressedit?active=3" style="color: #666666;">添加新地址</a></p>
        </div>
        <c:if test="${page.totalSize>0 }">
           <c:forEach items="${aList }" var="a" varStatus="vst">
             <div onmousemove="borderColor1(this)" onmouseleave="borderColor2(this)" class="col-xs-12 " style="border:2px solid #E5E5E5;margin-top:10px">
	           <input value="${a.addressId }" type="hidden">
	           <p > 
	              <a href="javascript:;" onclick="addressDel(this)" style="float: right;">删除</a> 
	              <a href="javascript:;" onclick="addressEdit2(this)" style="float: right;margin-right:5px">编辑</a> 
	              <c:if test="${fn:indexOf(a.addressFlag,'1')==-1 }"><a href="javascript:;" onclick="setDefault(this)" style="float: right;margin-right:5px">设为默认</a></c:if>
	           </p>
	           <p style="margin-top:10px;clear: both;color: #666666;font-weight:bold;">${a.provinceName}${a.cityName }&nbsp;&nbsp;&nbsp;&nbsp;(${a.receiveName }&nbsp;&nbsp;收) </p>
	           <p style="margin-top:10px;clear: both;color: #666666;">
	              ${a.provinceName}${a.cityName }${a.addressDetail }&nbsp;&nbsp;&nbsp;&nbsp;${a.receicePhone } 
	              <c:if test="${fn:indexOf(a.addressFlag,'1')!=-1 }"> <span style="float: right">默认地址</span> </c:if>
	           </p>
	         </div> 
           </c:forEach>
        </c:if> 
      <c:if test="${page.totalSize>page.count}">
        <div  id="page" class="page_div col-xs-12" ></div>
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
   
   function borderColor1(val){
	   $(val).css("border","2px solid #FEE581")
   }
   function borderColor2(val){
	   $(val).css("border","2px solid #E5E5E5")
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
		        	 location.href = "user_gotoaddress?active=3&currentPage="+obj.curr;
		         }
		        }
	  })
});
	function setDefault(obj){
		$.ajax({
			url:'user_setDefault',
			data:{
				addressId:$(obj).parent().prev().val()
			},
			type:'post',
			success:function(data){
				if(data===1){
					location.reload();
				}else{
					layer.msg("设置失败",{
						icon:2,
						time:1500
					})
				}
			}
		})
	}
	function addressEdit2(obj){
		location.href = "user_addressEdit2?currentPage="+currentPage+"&addressId="+$(obj).parent().prev().val()
	}
	function addressDel(obj){
	   $.ajax({
		   url:'user_addressDel',
		   data:{
			   addressId:$(obj).parent().prev().val()
		   },
		   type:'post',
		   success:function(data){
			   if(data===1){
				   layer.msg("删除成功!",{
					   icon:1,
					   time:1500,
				   },function(data){
					   location.reload();
				   })
			   }else{
				   layer.msg("删除失败!",{
					   icon:2,
					   time:1500,
				   })  
			   }
			   
		   }
	   })	
	}
	
</script>
</html>