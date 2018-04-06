<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe620;</i>商品管理<span class="c-666 en">&gt;</span><a href="javascript:;" onclick="backtoType()">类别管理</a><span class="c-666 en">&gt;</span>添加类别
  <button type="button" class="btn btn-success radius" onclick="location.reload()" style="float:right;margin-top: 4px"><i class="Hui-iconfont">&#xe68f;</i></button>
</nav>
<a style="margin-left: 1%" class=" btn btn-success radius" onclick="history.go(-1)"><i class="Hui-iconfont">&#xe66b;</i>返回</a>
<form action="javascript:;" method="post"  id="roleForm">
  <table class="col-6 col-xs-offset-1" style="margin-top: 10px">
    <tr height="50px">
       <td class="text-l" style="font-size:15px"> 类别名:</td>
       <td><input type="text" id="typeName" name="typeName" class="input-text radius" placeholder="输入类别名" style="width: 320px"></td>
    </tr>
  </table >
  <div class="col-2 col-xs-offset-1" style="margin-top: 20px">
     <input type="button" onclick="addType()" class="size-L btn btn-primary radius" value="提交" >&nbsp;&nbsp;&nbsp;&nbsp;
     <input type="reset" class="size-L btn btn-secondary  radius" value="重置" >
  </div>
</form>
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
				typeName :true,
			},  
		  },
		  messages:{
			  typeName:{
				  required:"请输入类别名"
			  }
		  }
	  });
	  $.validator.addMethod("typeName",function(value,element,parmas){
		  return value.length<10
	  },"类别名长度不得超过10")
  });
  function addType(){
	if($("#roleForm").valid()){
		var typeName = $("#typeName").val().trim();
		$.ajax({
			url:"shoe_addType",
			data:{
				typeName:typeName,
			},
			type:'post',
			success:function(data){
				if(data===1){
					layer.msg("类别名已存在",{
						time: 1000,
						icon: 2 
					})
				}else{
					layer.msg("添加成功",{
						time: 1000,
						icon: 1
					},function(){
						location.href="shoe_initType";
					})
				}
			}
		})
	}
  }
  

  
</script>
</html>