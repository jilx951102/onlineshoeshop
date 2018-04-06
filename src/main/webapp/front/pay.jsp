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
label.error{
  color: red
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
	        <a id="cart" href="cart_gotoCart"><span class="glyphicon glyphicon-shopping-cart"></span>购物车<span style="color:#CC0008">${cartCount }</span>件</a>
	   </div>
       
   </div>
<div class="col-xs-9 col-xs-offset-2" >
   <ol class="breadcrumb">
	  <li><span>所在位置&nbsp;&nbsp;&nbsp;&nbsp;</span><a href="index.jsp" target="top" style="color: #333333;">名鞋库</a></li>
	  <li class="active" >确认订单</li>
   </ol>
 </div>
 <div class="col-xs-10 col-xs-offset-2" style="margin-top: -20px">
   <img src="../img/cart_logo.png" alt="..." class="img-thumbnail" style="border: none">
 </div>
<div class="col-xs-9 " style="margin-left:17.6%">
  <p style="font-size:18px;color: #717171">1.收货地址:</p>
   <div id="aList">
     <c:if test="${fn:length(aList)>0 }">
      <c:forEach items="${aList }" var="a">
       <p> 
	     <input type="radio"  <c:if test="${fn:indexOf(a.addressFlag,'1')!=-1 }">checked</c:if> value="${a.addressId }" name="addressId" class="addressId" >
	               地址:${a.provinceName }${a.cityName }${a.addressDetail }  手机:${a.receicePhone } ${a.receiveName }(收)
	   </p>
      </c:forEach>
      </c:if>
   </div>
  <p style="border:1px solid #E5E5E5;width:100px;color: #666666;"><span class="glyphicon glyphicon-plus" style="margin-left: 5px"></span><a href="javascript:;" onclick="addressAdd()" style="color: #666666;" id="a">使用新地址</a></p>
  <form action="saveAddress" method="post" id="addressForm" style="display:none">
  <table>
    <tr>
      <td>
                           选择地址:
      </td>
      <td>
      <select name="provice" id="provinceId" style="width:100px" onchange="pChange(this)">
        <c:forEach items="${plist }" var="p" varStatus="vst">
			<option value = "${p.provinceId }" <c:if test="${p.provinceName==province  }">selected</c:if> >${p.provinceName }</option>
		</c:forEach>
     </select>
     <select name="city" id="cityId" style="width:100px" >
        <c:forEach items="${clist }" var="c" varStatus="vst">
		   <option value = "${c.cityId}" <c:if test="${c.cityName==city  }">selected</c:if> >${c.cityName }</option>
		</c:forEach>
     </select>
      </td>
    </tr>
    <tr height="70px">
      <td>
                       详细地址:
      </td>
      <td>
         <textarea name="address.addressDetail" id="addressDetail" rows="2" cols="30" style="resize: none;"></textarea>
      </td>
    </tr>
    <tr>
       <td>收货人:</td>
       <td>
         <input type="text" id="receiveName" name="address.receiveName">
       </td>
    </tr>
     <tr height="50px">
       <td>手机号码:</td>
       <td>
         <input type="text" id="receicePhone" name="address.receicePhone">
       </td>
    </tr>
    <tr height="50px">
       <td>邮编:</td>
       <td>
         <input type="text" id="addressCode" name="address.addressCode">
       </td>
    </tr>
    <tr height="50px">
       <td colspan="2">
                          是否保存该地址:<input type="checkbox" value="1" id="save">
       </td>
    </tr>
  </table>
  </form>
  <p style="font-size:18px;color: #717171">2.确认订单信息:</p>
   <table  class="table table-striped  table-hover" style="margin-top:10px">
      <tr >
        <td align="center">
                                商品图片
        </td>
        <td align="center" width="200">
                                商品信息
        </td>
        <td align="center" width="100">
                                购买数量
        </td>
        <td align="center">
                                单价
        </td>
        <td align="center">
                               折扣
        </td>
        <td align="center">
                                小计
        </td>
      </tr>
      <c:forEach items="${cartList }" var="c">
        <tr class="pay">
            <td hidden="true">${c.shoe.shoeId }</td>
            <td hidden="true">${c.cartId ==null?"1":c.cartId }</td>
	        <td align="center">
	          <img src="/upload/${c.shoe.shoePicture}" class="img-responsive" alt="Responsive image" style="width:40px;height:40px ">
	        </td>
	        <td align="center">${c.shoe.shoeName }</td>
	        <td align="center">${c.cartBuynum }</td>
	        <td align="center">￥<fmt:formatNumber value="${c.shoe.shoePrice }" pattern="#.00"/> </td>
	        <td align="center">${levelCut }</td>
	        <td align="center">￥<fmt:formatNumber value="${c.shoe.shoePrice*levelCut*c.cartBuynum  }" pattern="#.00"/></td>
	      </tr>
      </c:forEach>
	       <tr>
	         <td colspan="6">
	            <p style="float:right">
	                <button id="gotopay"  onclick="pay()" class="btn " type="button" style="margin-left:20%;background-color:#FF8600;font-weight: bold;color: white;margin-left:10px">
	              <span class="glyphicon glyphicon-ok" aria-hidden="true" ></span>确认,提交订单</button>
	            </p>
	            <p style="float:right;color: black;font-size:15px;margin-right: 10px;margin-top: 10px">共计:￥<span id="allMoney" style="color: #FF0000">0.00</span></p>
	            <p style="float:right;color: black;font-size:15px;margin-right: 10px;margin-top: 10px">共<span style="color:#FF8600">${fn:length(cartList) }</span> 件商品</p>
	         </td>
	       </tr>
   </table>
</div>
 <iframe scrolling="no" frameborder="0" src="footer.jsp" width="100%" height="140px" style="margin-top:100px"></iframe>
</body>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/validate/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../js/layer/2.4/layer.js"></script>
<script type="text/javascript">
   function addressAdd(){
	   if($("#a").html()==="取消"){
		   $("#aList").css("display","block");
		   $("#addressForm").css("display","none");
		   $("#a").html("使用新地址")
	   }else{
		   $("#aList").css("display","none");
		   $("#addressForm").css("display","block");
		   $("#a").html("取消")
	   }
	   
   }
   
   $(function(){
   var allMoney = 0;
   $(".pay").each(function(index){
	   allMoney+=parseFloat($(this).children(":last").html().substring(1))
   })
   $("#allMoney").html(allMoney.toFixed(2));
   $("#addressForm").validate({
	   rules:{
	    	  'address.receiveName':{
				  required:true,
				  receivePeople:true,
			  },
			  'address.receicePhone':{
				  required:true, 
				  phoneNumber:true,
			  },
			  'address.addressDetail':{
				  required:true, 
				  detailAddr:true,
			  },
			  'address.addressCode':{
				  required:true, 
				  postCode:true,
			  }
			  
		  },
		     messages:{
		      'address.receiveName':{
		   		  required:"收货人必填" 
		   	  }	,
		   	  'address.receicePhone':{
				  required:"手机号码必填", 
			  },
			  'address.addressDetail':{
				  required:"详细地址必填", 
			  },
			  'address.addressCode':{
				  required:"邮编必填", 
			  }
		      }
	      });
	      $.validator.addMethod("receivePeople",function(value,element,parmas){			  
			  return value.length<10;
		  },"收货人姓名的长度不能超过10");
	      $.validator.addMethod("phoneNumber",function(value,element,parmas){			  
			   var v = /^1[3|4|5|8][0-9]\d{8}$/;  
			   return v.test(value);
			  },"请输入正确的手机号码");
	      $.validator.addMethod("detailAddr",function(value,element,parmas){			  
			  return value.length<30;
		  },"收货人姓名的长度不能超过30");
	      $.validator.addMethod("postCode",function(value,element,parmas){			  
			  var postCode = /^[0-9]{6}$/;		  
	    	  return postCode.test(value);
		  },"请输入正确的邮编");	   
   })
   
   function pay(){
	   if($("#addressForm").valid()){
		   var shoeIds = "";
		   var buyNums = "";
		   var moneys ="";
		   var cartIds = "";
		   $.each($(".pay"),function(index){
			   shoeIds+= $(this).children(":first").html()+",";
			   buyNums+= $(this).children(":eq(4)").html()+",";
			   moneys+= $(this).children(":last").html().substring(1)+",";
			   cartIds+= $(this).children(":eq(1)").html()+","
		   })
		 if($("#a").html()!="取消" && $(".addressId:checked").length==0){
			 layer.msg("请选择收货地址",{
				 icon:2,
				 time:1500
			 })
		 }else{
			 if($("#a").html()==="取消"){
					$.ajax({
						url:'cart_saveRaddress',
						data:{
						  'address.cityId':$("#cityId").val(),
						  'address.provinceId':$("#provinceId").val(),
						  'address.addressCode':$("#addressCode").val(),
						  'address.addressDetail':$("#addressDetail").val(),
						  'address.receiveName':$("#receiveName").val(),
					      'address.receicePhone':$("#receicePhone").val(),
					       save:$("#save:checked").val(),
					       shoeIds:shoeIds,
					       buyNums:buyNums,
					       moneys:moneys,
					       cartIdses:cartIds,
						},
						type:'post',
						async:false,
						success:function(data){
							if(data!=null){
								location.href="alipay.jsp?orderId="+data
										+"&orderMoney=0.01&orderName=鞋";

								}else{
									layer.msg("购买失败",{
										icon:2,
										time:1000
									})	
							}
						}
					}) 
				 }else{
					 $.ajax({
						 url:'cart_saveRaddress1',
						 data:{
							 addressId:$(".addressId:checked").val(),
							 shoeIds:shoeIds,
						     buyNums:buyNums,
						     moneys:moneys,
						     cartIdses:cartIds,
						 },
						 type:'post',
						 async:false,
						 success:function(data){
							 if(data!=null){
								location.href="alipay.jsp?orderId="+data
										+"&orderMoney=0.01&orderName=鞋";

								}else{
									layer.msg("购买失败",{
										icon:2,
										time:1000
									})	
								}
						 }
					 })
				 }
			   } 
		 }  
		
   }
   function pChange(obj){
	   $.ajax({
		   url:'user_getCitybyId',
		   data:{
			   provinceId:$(obj).val(),
		   },
		   type:'post',
		   success:function(data){
			 $("#cityId").children().remove();
			 $.each(data,function(index){
				 var p = $("<option value="+this.cityId+">"+this.cityName+"<option>")
				 $("#cityId").append(p)
			 })
		   }
	   })
}
   
</script>
</html>