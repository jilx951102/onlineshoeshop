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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe620;</i>会员管理<span class="c-666 en">&gt;</span>等级管理
  <button type="button" class="btn btn-success radius" onclick="location.reload()" style="float:right;margin-top: 4px"><i class="Hui-iconfont">&#xe68f;</i></button>
</nav>
<div id="table1">
  <a href="javascript:;" style="margin-top: 6px;float:right" onclick="levelEdit()" class="btn btn-success radius">编辑</a>
  <table class="table table-border table-bordered radius table-hover" >
    <tr>
      <td class="text-c">会员Id</td>
      <td class="text-c">会员名称</td>
      <td class="text-c">等级消费(双)</td>
      <td class="text-c">等级折扣</td>
    </tr>
    <c:forEach items="${levelList}" var="v" varStatus="vst">
       <tr>
	      <td class="text-c">${v.levelId }</td>
	      <td class="text-c">${v.levelName }</td>
	      <td class="text-c">${v.levelCount }</td>
	      <td class="text-c">
	        <fmt:formatNumber value="${v.levelCut }" pattern="0.00"></fmt:formatNumber>
	      </td>
       </tr>
    </c:forEach>
  </table>
</div>

<div style="display:none" id="table2">
  <form action="" method="post" id="roleForm">
    <table class="table table-border  radius table-hover" id="change">
    <tr>
      <td class="text-c">会员Id</td>
      <td class="text-c">会员名称</td>
      <td  width="300px">等级消费(双)</td>
      <td  width="300px">等级折扣</td>
    </tr>
    <c:forEach items="${levelList}" var="v" varStatus="vst">
       <tr>
	      <td class="text-c">${v.levelId }</td>
	      <td class="text-c">${v.levelName }</td>
	      <td >
	        <input class="input-text radius" id="levelCount${vst.count }" name="levelCount${vst.count }" value="${v.levelCount }" style="width: 100px" >
	      </td>
	      <td >
	        <input style="width: 100px" class="input-text radius" name="levelCut${vst.count}" value="<fmt:formatNumber value="${v.levelCut }" pattern="0.00"></fmt:formatNumber>">
	      </td>
       </tr>
    </c:forEach>
  </table>
  <div style="text-align:center">
    <a href="javascript:;" style="margin-top: 6px;" onclick="save()" class="btn btn-success radius">确认</a>
    <a href="javascript:;" style="margin-top: 6px;" onclick="back()" class="btn btn-success radius">返回</a>
  </div>
  </form>
</div>
</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script> 
<script type="text/javascript" src="../../js/validate/jquery.validate-1.13.1.js"></script>
<script type="text/javascript" src="../../js/layer/2.4/layer.js"></script> 
<script type="text/javascript">
$(function(){
	$("#roleForm").validate({
		rules:{
			levelCount1:{
				required:true,
				levelCount:true,
			},
			levelCut1:{
				required:true,
				levelCut:true,
			},
			levelCount2:{
				required:true,
				levelCount:true,
			},
			levelCut2:{
				required:true,
				levelCut:true,
			},
			levelCount3:{
				required:true,
				levelCount:true,
			},
			levelCut3:{
				required:true,
				levelCut:true,
			},
			levelCount4:{
				required:true,
				levelCount:true,
			},
			levelCut4:{
				required:true,
				levelCut:true,
			},
			levelCount5:{
				required:true,
				levelCount:true,
			},
			levelCut5:{
				required:true,
				levelCut:true,
			}
		},
		messages:{
			levelCount1:{
				required:"等级消费必填"	
			},
			levelCut1:{
				required:"等级折扣必填"
			},
			levelCount2:{
				required:"等级消费必填"	
			},
			levelCut2:{
				required:"等级折扣必填"
			},
			levelCount3:{
				required:"等级消费必填"	
			},
			levelCut3:{
				required:"等级折扣必填"
			},
			levelCount4:{
				required:"等级消费必填"	
			},
			levelCut4:{
				required:"等级折扣必填"
			},
			levelCount5:{
				required:"等级消费必填"	
			},
			levelCut5:{
				required:"等级折扣必填"
			}
		}

	});
	$.validator.addMethod("levelCount",function(value,element,parmas){
		var v = /^[0-9]*[1-9][0-9]*$/;
		return v.test(value);
	},"请输入正整数");
	$.validator.addMethod("levelCut",function(value,element,parmas){
		var v = /^(0\.(0[1-9]|[1-9]{1,2}|[1-9]0)$)|^1$/;
		return v.test(value);
	},"请输入0到1之间的2位小数");
})

	function save(){
	  if($("#roleForm").valid()){
		  var a = parseInt($("#levelCount1").val());
		  var b = parseInt($("#levelCount2").val());
		  var c = parseInt($("#levelCount3").val());
		  var d = parseInt($("#levelCount4").val());
		  var e = parseInt($("#levelCount5").val());
		  if(a<b && b<c && c<d && d<e){
			  var array = new Array();
			  $("#change").children().children().each(function(index){
				  if(index>0){
					 array.push({
						 levelId:$(this).children(":eq(0)").html(),
						 levelName:$(this).children(":eq(1)").html(),
						 levelCount:$(this).children(":eq(2)").children().val(),
						 levelCut:$(this).children(":eq(3)").children().val()
					 }) 
				  }
			  });
			  $.ajax({
				  url:'user_editLevel',
				  data:{
					  levels:JSON.stringify(array)
				  },
				  async:true,
				  type:'post',
				  traditional: true,
				  success:function(data){
					 if(data===1){
						 layer.msg("修改成功",{
							 icon:1,
							 time:1500
						 },function(){
							 location.href="user_initLevel";
						 })
					 }else{
						 layer.msg("修改失败",{
							 icon:2,
							 time:1500 
						 })
					 }
				  }
			  }) 
		  }else{
			  layer.msg("输入的购买数量必须由小到大!",
					  {icon:2,
				       time:1500})
		  }
		  
	  }
	}
	function levelEdit(){
		$("#table1").css("display","none")
		$("#table2").css("display","block")
	}
	function back(){
		$("#table2").css("display","none")
		$("#table1").css("display","block")
	}
</script>
</html>