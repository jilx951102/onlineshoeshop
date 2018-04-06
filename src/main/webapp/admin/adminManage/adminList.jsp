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
<link rel="stylesheet" type="text/css" href="../../css/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../../css/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../../css/h-ui.admin/css/style.css" />
<link rel="stylesheet" href="../../layui/css/layui.css"  media="all">
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe60d;</i>管理员管理<span class="c-666 en">&gt;</span><span class="c-666">管理员列表</span>
    <a href="javascript:;" onclick="location.reload()"><i class="Hui-iconfont btn btn-success radius" style="float:right;margin-top: 4px">&#xe68f;</i> </a>
</nav>
<form action="user_searchAdmin" method="post" class="col-xs-offset-4" style="margin-top: 10px">
   <input type="text" name="searchName" id="searchName" value="${searchName }" placeholder="输入管理员姓名或登录名" class="input-text radius size-M" style="width: 250px">
   <input type="hidden" value="${page.currentPage }" name="currentPage">
   <input type="hidden" value="1" id="asFlag" name="asFlag">
   <button class="btn btn-success radius" type="submit">搜索</button>
   <button class="btn btn-success radius" type="button" onclick="qk(searchName)">清空</button>
</form>
<button class="	btn btn-secondary radius" type="button" onclick="adminAdd()"><i class="Hui-iconfont">&#xe60d;</i> 添加管理员</button>
<button class="	btn btn-danger radius" type="button" onclick="adminDelAll()"><i class="Hui-iconfont" >&#xe6e2;</i> 批量删除</button>
<table class="table table-border table-bordered table-striped table-hover" style="margin-top: 5px">
   <tr>
     <td colspan="7">
                管理员列表
     </td>
   </tr>
   <tr>
     <td class="text-c"><input type="checkbox" value="" class="allcheck" onclick="allcheck()"> </td>
     <td class="text-c">序号</td>
     <td class="text-c">登录名</td>
     <td class="text-c">真实姓名</td>
     <td class="text-c">手机号码</td>
     <td class="text-c">创建时间</td>
     <td class="text-c">操作</td>
   </tr>
   <c:choose>
     <c:when test="${page.totalSize==0 }">
        <tr >
		     <td colspan="7" class="text-c" >
		            暂无数据
		     </td>
		   </tr>
     </c:when>
     <c:otherwise>
        <c:forEach items="${page.userList }" var="u" varStatus="vst">
           <tr <c:if test="${u.roleId==2 }">class='success' title='自己' style='cursor: pointer;'</c:if> >
		    <c:if test="${u.roleId==1 }">
		        <td class="text-c"><input type="checkbox" value="${u.userId }" class="scheck" onclick="scheck()"> </td>
		    </c:if>
		    <c:if test="${u.roleId==2 }">
		       <td class="text-c">自己</td>
		    </c:if>
		     <td class="text-c">${page.count*(page.currentPage-1)+vst.count}</td>
		     <td class="text-c">${u.userName }</td>
		     <td class="text-c">${u.userRealname }</td>
		     <td class="text-c">${u.userPhone }</td>
		     <td class="text-c">
		       <fmt:formatDate value="${u.userTime }" pattern="yyy-MM-dd HH:mm:ss"/>
		     </td>
		     <td class="text-c">
		        <input type="hidden" value="${u.userId }">
		        <a href="javascript:;" onclick="adminInfo(this)"><i class="Hui-iconfont">&#xe725;</i>查看</a>
		        <a href="javascript:;" onclick="adminEdit(this)"><i class="Hui-iconfont">&#xe6df;</i>编辑</a>
		        <c:if test="${u.roleId==1 }">
		            <a href="javascript:;" onclick="editPass(this)"><i class="Hui-iconfont">&#xe63f;</i>修改密码</a>
		            <a href="javascript:;" onclick="adminDel(this)"><i class="Hui-iconfont">&#xe6e2;</i>删除</a>
		        </c:if>       
		     </td>
		   </tr>
        </c:forEach>
     </c:otherwise>
   </c:choose> 
</table>
<c:if test="${page.totalPage>1 }">
   <div style="margin-top: 10px;margin-left: 26%" id="page" class="page_div"></div>
</c:if>
<input type="hidden" value="${page.totalPage}" id="totalPage">
<input type="hidden" value="${page.currentPage}" id="currentPage">
<input type="hidden" value="${page.totalSize}" id="totalSize">
<input type="hidden" value="${page.count}" id="count">
</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script> 
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript" src="../../layui/layui.js"></script>
<script type="text/javascript">
  var asFlag = $("#asFlag").val();			
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
		        	 var searchName = $("#searchName").val().trim();
						if(asFlag==="1"){
							location.href = "user_searchAdmin?currentPage="+obj.curr+"&searchName="+searchName+"&asFlag="+asFlag
						}else{
							location.href = "user_getAllAdmin?currentPage="+obj.curr;
						}
		         }
		        }
	  })
});
  function adminAdd(){
	  open("添加管理员",'450px','500px','adminAdd.jsp');
  }
  function adminEdit(obj){
	  open("编辑管理员",'450px','300px','user_getAdminById2?userId='+$(obj).parent().children(":eq(0)").val());
  }
  function adminInfo(obj){
	  open("查看管理员",'450px','350px','user_getAdminById?userId='+$(obj).parent().children(":eq(0)").val());
  }
  function editPass(obj){
	  console.log($(obj).parent().children(":eq(0)").val())
	  open("修改密码",'450px','250px','user_cAdminPass?userId='+$(obj).parent().children(":eq(0)").val());
  }
//全选 
  function allcheck() {
  	$(".scheck").prop("checked", $(".allcheck").prop("checked"));
  }
  function scheck() {
  	$(".allcheck").prop("checked",
  			$(".scheck:checked").length == $(".scheck").length);
  }
  function adminDelAll(){
	  if($(".scheck:checked").length==0){
		  layer.msg("请选择要删除的管理员",{
			  time:1500
		  })
	  }else{
		  layer.confirm('确认删除吗?', {
			  btn: ['确认','取消'] //按钮
			}, function(){
			    var array = getArray();
                $.ajax({
                	url:'user_adminDelAll',
                	data:{userIds:array},
                	type:'post',
                	traditional: true,
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
                				time:1500
                			})
                		}
                	} 
                })
			} 
			);
	  }
  }
  function adminDel(obj){
	  layer.confirm('确认删除吗?', {
		  btn: ['确认','取消'] //按钮
		}, function(){
		    var userid = $(obj).parent().children(":eq(0)").val();
		    $.ajax({
		    	url:'user_adminDel',
		    	data:{userId:userid},
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
            				time:1500
            			})
            		}
		    	}
		    })
		} 
		);
  }
	function qk(searchName){
		$(searchName).val("");
	}
</script>
</html>