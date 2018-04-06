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
<link rel="stylesheet" href="../../layui/css/layui.css"  media="all">
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe620;</i>商品管理<span class="c-666 en">&gt;</span>上架商品列表
  <button type="button" class="btn btn-success radius" onclick="location.reload()" style="float:right;margin-top: 4px"><i class="Hui-iconfont">&#xe68f;</i></button>
</nav>

<div class="col-7 col-xs-offset-3"  style="margin-top: 10px">
   <form action="">
	<span class="select-box radius" style="width: 100px">
	  <select class="select" size="1" name="shoe.typeId" id="typeId">
	      <option value="0" >全选</option>
	    <c:forEach items="${list}" var="l" varStatus="vst">
	      <option value="${l.typeId }" <c:if test="${l.typeId==typeId}">selected</c:if> >${l.typeName}</option>
	    </c:forEach>			  
	  </select>
	</span>
   <input type="text" id="shoeName"  name="shoeName" value="${shoeName }" placeholder="输入商品名" class="input-text radius size-M" style="width: 280px">
   <button type="button" onclick="searchShoe()" class="size-M btn btn-success radius"><i class="Hui-iconfont">&#xe683;</i>查询</button>
   <button type="button" onclick="qk(shoeName)" class="size-M btn btn-success radius"><i class="Hui-iconfont">&#xe6a6;</i>重置</button>
   </form>
</div>
<div class="col-12" style="margin-top: 20px">
   <button type="button" class="size-M btn btn-danger radius" onclick="offShoeAll()"><i class="Hui-iconfont">&#xe6de;</i>下架</button>
   <button type="button" class="size-M btn btn-primary radius" onclick="addGoods()"><i class="Hui-iconfont">&#xe600;</i>新增</button>
   <button type="button" onclick="location.href='shoe_exportExcel'" class="size-M btn btn-primary radius"><i class="Hui-iconfont">&#xe644;</i>导出</button>
</div>

<div style="margin-top: 5px" class="col-12">
   <table class="table table-border table-bordered table-hover table-striped">
      <tr>
        <td class="text-c">
          <input type="checkbox" class="allcheck" onclick="allcheck()">
        </td>
        <td class="text-c">序号</td>
        <td class="text-c">类别名称</td>
        <td class="text-c">商品名称</td>
        <td class="text-c">商品图片</td>
        <td class="text-c">发布时间</td>
        <td class="text-c">操作</td>
      </tr>
      <c:choose>
         <c:when test="${fn:length(shoeList)>0}">
          <c:forEach items="${page.shoeList}" var="s" varStatus="vst">
             <tr>
		        <td class="text-c">
		          <input type="checkbox" class="scheck" value="${s.shoeId }" onclick="scheck()">
		        </td>
		        <td class="text-c">${page.count*(page.currentPage-1)+vst.count}</td>
		        <td class="text-c">${s.typeName }</td>
		        <td class="text-c">${s.shoeName }</td>
		        <td class="text-c">
		           <img alt="" style="height:50px;width: 50px" src="/upload/${s.shoePicture}" class="radius">
		        </td>
		        <td class="text-c">
		          <fmt:formatDate value="${s.shoeTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
		        </td>
		        <td class="text-c">
		           <a href="javascript:;" onclick="watchonLineshoeInfo(this)" ><span class="Hui-iconfont" style="font-weight:normal;">&#xe725;查看</span></a>
		          <a href="javascript:;" onclick="shoeOff(this)" ><span class="Hui-iconfont" style="font-weight:normal;">&#xe6de;下架</span></a>
		          <a href="javascript:;" onclick="onShoeEdit(this)" ><span class="Hui-iconfont" style="font-weight:normal;">&#xe60c;修改</span></a>
		        </td>
		      </tr>
		     </c:forEach>
         </c:when>
         <c:otherwise>
             <tr >
                <td colspan="7" class="text-c">暂时无数据</td>
             </tr>
         </c:otherwise>
      </c:choose>    
   </table>
</div>
<c:if test="${page.totalSize>page.count}">
    <div style="margin-top: 10px;margin-left: 26%" id="page" class="page_div"></div>
</c:if>
<input type="hidden" value="${page.totalPage}" id="totalPage">
<input type="hidden" value="${page.currentPage}" id="currentPage">
<input type="hidden" value="${page.totalSize}" id="totalSize">
<input type="hidden" value="${ss}" id="ss">
<input type="hidden" value="${page.count}" id="count">
</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script> 
<script type="text/javascript" src="../../layui/layui.js"></script>
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript">
var ss = $("#ss").val();
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
		        	 var typeId = $("#typeId").val();
		 			var shoeName = $("#shoeName").val();
		 			if(ss==="1"){
		 				location.href = "shoe_searchShoe?typeId="+typeId+"&shoeName="+shoeName+"&ss="+ss+"&currentPage="+obj.curr;
		 			}else{
		 				location.href = "shoe_initShoeOnline?typeId="+typeId+"&shoeName="+shoeName+"&currentPage="+obj.curr;
		 			}
		         }
		        }
	  })
});
  function qk(val){
	  $("#typeId").children(":eq(0)").prop("selected",true);
	  $(val).val("");
  }
  
  function addGoods(){
	  window.location.href ="shoe_initAddShoe";
  }
  
  function searchShoe(){
	  var typeId = $("#typeId").val();
	  var shoeName = $("#shoeName").val().trim();
	  location.href = "shoe_searchShoe?typeId="+typeId+"&shoeName="+shoeName+"&ss="+1;
  }
	//全选 
	function allcheck() {
		$(".scheck").prop("checked", $(".allcheck").prop("checked"));
	}
	function scheck() {
		$(".allcheck").prop("checked",
				$(".scheck:checked").length == $(".scheck").length);
	}
  function watchonLineshoeInfo(obj){
	 var shoeId = $(obj).parent().siblings(":eq(0)").children().val();
	 open("查看鞋信息","350px","350px","shoe_watchonLineshoe?shoeId="+shoeId+"&shoeFlag="+0);
  }
  function shoeOff(obj){
	  layer.confirm('确认下架吗?', {
		  btn: ['是','否'], //按钮
		  icon:3,
		}, function(){
		 var shoeId = $(obj).parent().siblings(":eq(0)").children().val();
		  $.ajax({
			  url:"shoe_shoeOff",
			  data:{
				  shoeId:shoeId
			  },
			  success:function(data){
				  if(data===1){
					  layer.msg("下架成功",{
						  icon:1,
						  time:1500
					  },function(){
						var typeId = $("#typeId").val();
						var shoeName = $("#shoeName").val();
						if(ss==="1"){
							location.href = "shoe_searchShoe?typeId="+typeId+"&shoeName="+shoeName+"&ss="+ss+"&currentPage="+currentPage;
						}else{
							location.href = "shoe_initShoeOnline?typeId="+typeId+"&shoeName="+shoeName+"&currentPage="+currentPage;
						} 
					  });
				  }else{
					  layer.alert("下架失败",{
						  icon:1,
						  time:1500 
					  });
				  }
			  },
		  })

		} 
	);	 
  }
  function onShoeEdit(obj){
	  var shoeId = $(obj).parent().siblings(":eq(0)").children().val();
	  open("修改鞋信息","600px","500px","shoe_onShoeEdit?shoeId="+shoeId); 
  }
  function offShoeAll(){
	  
	  if($(".scheck:checked").length<=0){
		  layer.msg("请选择要下架的鞋")
	  }else{
	    layer.confirm('确认下架吗?', {
		   btn: ['是','否'], //按钮
		   icon:3,
		  }, function(){
		  var array = getArray();
		  $.ajax({
			 url:"shoe_offShoeAll",
			 data:{
				 shoeIds:array,
			 },
		     async:true,
		     type:'post',
		     traditional: true,
		     success:function(data){
		    	 if(data===1){
		    		 layer.msg("下架成功",{
		    			 icon:1,
		    			 time:1500 
		    		 },function(){
		    			 var typeId = $("#typeId").val();
						 var shoeName = $("#shoeName").val();
		    			 if(ss==="1"){
						 	location.href = "shoe_searchShoe?typeId="+typeId+"&shoeName="+shoeName+"&ss="+ss+"&currentPage="+currentPage;
						 }else{
							location.href = "shoe_initShoeOnline?typeId="+typeId+"&shoeName="+shoeName+"&currentPage="+currentPage;
						 }  
		    		 })
		    	 }else{
		    		 layer.msg("下架失败",{
		    			 icon:2,
		    			 time:1500
		    		 })
		    	 }
		     }
		  })
		 });
		  
	  }	  
  }
</script>
</html>