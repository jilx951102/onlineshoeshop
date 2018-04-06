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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe620;</i>商品管理<span class="c-666 en">&gt;</span>类别管理
  <button type="button" class="btn btn-success radius" onclick="location.reload()" style="float:right;margin-top: 4px"><i class="Hui-iconfont">&#xe68f;</i></button>
</nav>

<div class="col-7 col-xs-offset-3"  style="margin-top: 10px">
   <form action="javascript:;" method="post">
   <input type="text" id="typeName" value="${page.typeName }" placeholder="输入类别名" class="input-text radius size-M" style="width: 280px">
   <button type="button" class="size-M btn btn-success radius" onclick="searchType()"><i class="Hui-iconfont">&#xe683;</i>查询</button>
   <button type="button" onclick="qk(typeName)" class="size-M btn btn-success radius"><i class="Hui-iconfont">&#xe6a6;</i>重置</button>
   </form>
</div>
<div class="col-12" style="margin-top: 20px">
   <button onclick="delAllType()"  type="button" class="size-M btn btn-danger radius"><i class="Hui-iconfont">&#xe60b;</i>删除</button>
   <button type="submit" class="size-M btn btn-primary radius" onclick="addGoods()"><i class="Hui-iconfont">&#xe600;</i>新增</button>
</div>

<div style="margin-top: 5px" class="col-12">
   <table class="table table-border table-bordered table-hover table-striped">
      <tr>
        <td class="text-c">
          <input type="checkbox" onclick="allcheck()" class="allcheck">
        </td>
        <td class="text-c">序号</td>
        <td class="text-c">类别名称</td>
        <td class="text-c">创建时间</td>
        <td class="text-c">操作</td>
      </tr>
      
      <c:if test="${page.totalSize==0}">
        <tr >
         <td colspan="6" class="text-c">暂时无数据</td>
        </tr>
      </c:if>
      <c:if test="${page.totalSize>0}">
        <c:forEach items="${page.typeList}" var="t" varStatus="vst">
            <tr>
               <td class="text-c">
                 <input type="checkbox" onclick="scheck()" class="scheck" value="${t.typeId}">
		        </td>
		        <td class="text-c">${page.count*(page.currentPage-1)+vst.count}</td>
		        <td class="text-c">${t.typeName}</td>
		        <td class="text-c">
		          <fmt:formatDate value="${t.typeTime}" pattern="yyyy-MM-dd- HH:mm:ss"/>
		        </td>
		        <td class="text-c">
		          <a href="javascript:;" onclick="watchInfo(this)" ><span class="Hui-iconfont" style="font-weight:normal;">&#xe725;查看</span></a>
		          <a href="javascript:;" onclick="typeDel(this)" ><span class="Hui-iconfont" style="font-weight:normal;">&#xe6e2;删除</span></a>
		          <a href="javascript:;" onclick="typeEdit(this)" ><span class="Hui-iconfont" style="font-weight:normal;">&#xe60c;修改</span></a>
		        </td>
	            </tr>
        </c:forEach>
      </c:if>
   </table>
</div>
<c:if test="${page.totalPage>1 }">
   <div style="margin-top: 10px;margin-left: 26%" id="page" class="page_div"></div>
</c:if>
<input type="hidden" value="${page.totalPage}" id="totalPage">
<input type="hidden" value="${page.currentPage}" id="currentPage">
<input type="hidden" value="${page.totalSize}" id="totalSize">
<input type="hidden" value="${page.ts}" id="ts">
<input type="hidden" value="${page.count}" id="count">
</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script> 
<script type="text/javascript" src="../../layui/layui.js"></script>
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript">
var ts =$("#ts").val()===""?"1":$("#ts").val();	
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
		        	 var typeName = $("#typeName").val().trim();
		 			if(ts==="1"){
		 				location.href = "shoe_getTypes?currentPage="+obj.curr+"&typeName="+typeName
		 			}else{
		 				location.href = "shoe_getTypes?currentPage="+obj.curr+"&typeName="+typeName+"&ts="+ts;
		 			}
		         }
		        }
	  })
});
  function qk(val){
	  $(val).val("");
  }
  //批量删除
  function delAllType(){  
	  if($("input:checked").length<1){
		  layer.msg("请选择要删除的数据",{time:1500});
	  }else{
		  layer.confirm('确认删除吗?', {
		   btn: ['是','否'], //按钮
		   icon:3,
		  }, function(){
			  var i =0;
			  if($($("input:checked").get(0)).prop("class")==="allcheck"){
				  i = 1;
			  }
			  var typeIds = new Array(); 
			  var j = 0;
			  for(var k = i;k<$("input:checked").length;k++){
				  typeIds[j] = $($("input:checked").get(k)).val();
				  j++;
			  }
			  $.ajax({
				  url:"shoe_delAllType",
				  async:false,
				  traditional: true,
				  data:{
					  typeIds:typeIds ,
				  },
				  success:function(data){
					  if(typeof data ==="object"){
						  var a ="";
						  $.each(data,function(index,value){
							 a+=value.typeName+","; 
						  });
						  layer.alert(a.substring(0,a.length-1)+"下有鞋,删除失败",{
							  icon:2,
							  time:1500,
						  })
						  
					  }else{
						  layer.msg("删除成功",{
								time: 1500,
								icon: 1 
							},function(){
								var typeName = $("#typeName").val().trim();
								if(ts==="1"){
									location.href = "shoe_getTypes?currentPage="+currentPage+"&typeName="+typeName
								}else{								
									location.href = "shoe_getTypes?currentPage="+currentPage+"&typeName="+typeName+"&ts="+ts;
								}
							})  
					  }
				  }
			  }) 
		  })
		  
	  }
  }
  function addGoods(){	 
	  location.href ="addType.jsp";
  }
  
  function watchInfo(obj){
	  let typeId = $(obj).parent().siblings(":eq(0)").children().val();
	  open("查看类别信息","300px","200px","shoe_typeInfo?typeId="+typeId);
  }
  function typeEdit(obj){
	  let typeId = $(obj).parent().siblings(":eq(0)").children().val();
	  open("修改类别信息","400px","200px","shoe_typeEdit?typeId="+typeId);
  }
	//全选 
	function allcheck() {
		$(".scheck").prop("checked", $(".allcheck").prop("checked"));
	}
	function scheck() {
		$(".allcheck").prop("checked",
				$(".scheck:checked").length == $(".scheck").length);
	}
  function typeDel(obj){
	  layer.confirm('确认删除吗?', {
	   btn: ['是','否'], //按钮
	   icon:3,
	  }, function(){
		  let typeId = $(obj).parent().siblings(":eq(0)").children().val();
		  $.ajax({
			url:'shoe_typeDel',
			async:false,
			data:{
				typeId:typeId,
			},
			success:function(data){
				if(data===0){
					layer.msg("删除成功",{
						time: 1500,
						icon: 1 
					},function(){
						var typeName = $("#typeName").val().trim();
						if(ts==="1"){
							location.href = "shoe_getTypes?currentPage="+currentPage+"&typeName="+typeName
						}else{						
							location.href = "shoe_getTypes?currentPage="+currentPage+"&typeName="+typeName+"&ts="+ts;
						}
					})
				}else{
					layer.msg("该类别下有鞋,删除失败",{
						time: 1500,
						icon: 2 
					})
				}
				}
		  })
	  });
	  
  }
  function searchType(){
	  var typeName = $("#typeName").val().trim();
	  location.href = "shoe_getTypes?currentPage="+currentPage+"&typeName="+typeName+"&ts="+2; 
  }
</script>
</html>