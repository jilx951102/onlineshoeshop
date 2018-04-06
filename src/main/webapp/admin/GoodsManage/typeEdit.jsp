<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../../css/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/css/style.css" />
<title>Insert title here</title>
<style type="text/css">
label.error{
  position:relative;
  right: -2px;
  top:0px
}
</style>
</head>
<body>
<div >
  <input type="hidden" value="${type.typeId}" id="typeId">
  <form action="javascript:;" id="roleForm">
    <p style="margin-left:20px; ">
     类别名称:&nbsp;&nbsp;&nbsp;<input id="typeName" type="text" class="input-text radius" style="width:160px" value="${type.typeName}" name="typeName">
  </p>

  <button class="btn btn-success radius" type="button" style="width:100px;margin-left: 80px" onclick="checkEdit()">确认</button>
  </form>
</div>

</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script> 
<script type="text/javascript" src="../../js/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../../js/validate/jquery.validate-1.13.1.js"></script>
<script type="text/javascript">
  $(function(){
	  $("#roleForm").validate({
		  rules:{
			  typeName:{
				required :true,
				typeName:true,
			},  
		  },
		  messages:{
			  typeName:{
				  required:"请输入类别名"
			  }
		  }
	  });
	  $.validator.addMethod("typeName",function(value,element,parmas){
		  return value.length<10;
	  },"类别名长度不能超过10 ");

  })
  
  	  function checkEdit(){
		  if($("#roleForm").valid()){
			 var typeName = $("#typeName").val().trim();
			 var typeId = $("#typeId").val();
			 $.ajax({
				url:'shoe_editType',
				async:false,
				data:{
					typeName:typeName,
					typeId:typeId,
				},
			    success:function(data){
			    	if(data===1){
			    		layer.msg("类别名已存在",{
							time: 1000,
							icon: 2 
						})
			    	}else{
			    		layer.msg("修改成功",{
							time: 1000,
							icon: 1 
						},function(){
							parent.window.location.reload();
							var i = parent.layer.getFrameIndex();
							parent.layer.close(i);
						})
			    		
			    	}
			    }
			 }) 
		  }
	  }
</script>
</html>