<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="../../css/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../../css/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/css/style.css" />
<style type="text/css">
label.error{
  position:relative;
  right: -2px;
  top:0px
}
</style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe620;</i>商品管理<span class="c-666 en">&gt;</span><a href="shoe_initShoeOnline">上架商品列表</a><span class="c-666 en">&gt;</span>添加商品
  <button type="button" class="btn btn-success radius" onclick="location.reload()" style="float:right;margin-top: 4px"><i class="Hui-iconfont">&#xe68f;</i></button>
</nav>

<form action="" method="post" enctype="multipart/form-data" id="roleForm">
  <table class="col-6 col-xs-offset-1" style="margin-top: 10px">
    <tr height="50px">
       <td class="text-l" style="font-size:15px"> 商品名:</td>
       <td><input type="text" name="shoe.shoeName" class="input-text radius" placeholder="输入商品名" style="width: 320px"></td>
    </tr>
    <tr height="50px">
       <td class="text-l" style="font-size:15px"> 类别名:</td>
       <td>
	       <span class="select-box radius" style="width: 320px">
			  <select class="select" size="1" name="shoe.typeId" id="typeId">
			    <c:forEach items="${list}" var="l" varStatus="vst">
			      <option value="${l.typeId }" <c:if test="${vst.index==0}">selected</c:if> >${l.typeName}</option>
			    </c:forEach>			  
			  </select>
			</span>
          
       </td>
    </tr>
    <tr height="50px">
       <td class="text-l" style="font-size:15px"> 商品描述:</td>
       <td><textarea  name="shoe.shoeDesc" class="textarea radius" placeholder="输入商品名" style="width: 320px"></textarea></td>
    </tr>
    
    <tr height="50px">
       <td class="text-l" style="font-size:15px"> 商品图片:</td>
       <td>
          <img id="preview"  alt="" src="../../img/preview.jpg" width="80px" height="80px">
          <label for="shoePicture" class="btn btn-info" style="margin-top: 50px">添加图片</label>
		  <input type="file" id="shoePicture" name="shoePicture"  accept="image/jpeg,image/png" style="display: none">
       </td>
    </tr>
    
    <tr height="50px">
       <td class="text-l" style="font-size:15px" > 商品数量:</td>
       <td>
          <input type="text" name="shoe.shoeStock" class="input-text radius" placeholder="输入数量" style="width:320px">
       </td>
    </tr>
    <tr height="50px">
       <td class="text-l" style="font-size:15px"> 商品单价:</td>
       <td><input type="text" name="shoe.shoePrice" class="input-text radius" placeholder="输入单价" style="width: 320px"></td>
    </tr>
     <tr height="50px">
       <td colspan="2">
            <input type="button" onclick="addGoods()" class="size-L btn btn-primary radius" value="提交" >&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" class="size-L btn btn-secondary  radius" value="重置" >
       </td>
    </tr>
 
  </table>

</form>

</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script> 
<script type="text/javascript" src="../../js/validate/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../../js/jquery.form.js"></script>
<script type="text/javascript" src="../../js/layer/2.4/layer.js"></script>
<script type="text/javascript">
  $(function(){
	  $("#shoePicture").change(function(){
  		var filepath = $(this);    		
  		var objURL = filepath[0].files[0];
  		//获得一个http格式的url路径:mozilla(firefox)||webkit or chrome
  		var windowURL = window.URL || window.webkitURL;
  		//createObjectURL创建一个指向该参数对象(图片)的URL
  		var dataURL;
  		dataURL = windowURL.createObjectURL(objURL);
  		$("#preview").attr("src",dataURL);
  	});
	  $("#roleForm").validate({
		  rules:{
			  'shoe.shoeStock':{
				required:true,
			    shoeStock :true,
			},  
			'shoe.shoePrice':{
				required:true,
				shoePrice:true,
			},
			'shoe.shoeName':{
				required:true,
				shoeName:true,
				
			},
			'shoe.shoeDesc':{
				required:true,
				shoeDesc:true,
			},
			
		  },
		  messages:{
			  'shoe.shoeName':{
				  required:"商品名必填"
			  },
			  'shoe.shoeDesc':{
				  required:"商品描述必填" 
			  },
			  'shoe.shoeStock':{
				  required:"鞋数量必填"  
			  },
			  'shoe.shoePrice':{
				  required:"价格必填"  
			  }
			  
		  },
	  });
	  
	  $.validator.addMethod("shoeStock",function(value,element,parmas){
		  var v = /^[0-9]*[1-9][0-9]*$/;
		  return v.test(value);
	  },"请输入正整数");
	  $.validator.addMethod("shoePrice",function(value,element,parmas){
		  return !isNaN(value) && parseInt(value)>0
	  },"请输入正数")
	   $.validator.addMethod("shoeName",function(value,element,parmas){
		  return value.length<10
	  },"商品名长度不得超过10")
	  $.validator.addMethod("shoeDesc",function(value,element,parmas){
		  return value.length<100
	  },"商品描述长度不得超过100")
  })
  //添加商品
  function addGoods(){
	 if( $("#roleForm").valid()){
		 if($("#shoePicture").val()==""){
			 layer.msg("图片也必须上传!",{
				 time:1000
			 })
		 }else{
			 $("#roleForm").ajaxSubmit({
				 url:"shoe_addShoe",
	             type:'post',
	             async:true,
	             success:function(data){
	            	 if(data===1){
	            		 layer.msg("添加成功",{
	            			 icon:1,
	            			 time:1500,
	            		 },function(){
	            			 location.href="shoe_initShoeOnline";
	            		 })
	            	 }else{
	            		 layer.msg("添加失败",{
	            			 icon:2,
	            			 time:2000, 
	            		 })
	            	 }
	             } 
			 })  
		 }
		 
		 
		/*  $.ajax({
	    	 
	     }); */

	 }
  }
</script>
</html>