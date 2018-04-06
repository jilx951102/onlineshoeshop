<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="../css/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../css/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../css/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../css/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../css/h-ui.admin/css/style.css" />
<style type="text/css">
  .blue{
    background-color:#2D6DCC;
  }
  .red{
    background-color: #C81623;
  }
  .black{
    background-color: #222222;
  }
  .orange{
    background-color: #FF4A00;
  }
  .yellow{
    background-color: #FFD200
  }
  .green{
    background-color: #19A97B;
  }
  .white{
    background-color: white;
  }
</style>
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>网上鞋店后台管理</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body onload="initColor()" >
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top white"  id="top">
		<div class="container-fluid cl " > <a class="logo navbar-logo f-l mr-10 hidden-xs" href="javascript:;">网上鞋店后台管理</a>
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
		<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li>${u.roleId==1?'管理员':'超级管理员' }</li>
				<li class="dropDown dropDown_hover">
					<a href="#" class="dropDown_A">${u.userRealname } <i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" onClick="creatIframe('editPass/editPass.jsp','修改密码')">修改密码</a></li>
						<li><a href="user_loginOut">退出</a></li>
				</ul>
			</li>
				<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
					<ul class="dropDown-menu menu radius box-shadow" id="selectColor">						
						<li><a href="javascript:;" data-val="blue" onclick="changeColor(this)" title="蓝色">蓝色</a></li>
						<li><a href="javascript:;" data-val="default" onclick="changeColor(this)" title="黑色">黑色</a></li>
						<li><a href="javascript:;" data-val="green" onclick="changeColor(this)" title="绿色">绿色</a></li>
						<li><a href="javascript:;" data-val="red" onclick="changeColor(this)" title="红色">红色</a></li>
						<li><a href="javascript:;" data-val="yellow" onclick="changeColor(this)" title="黄色">黄色</a></li>
						<li><a href="javascript:;" data-val="orange" onclick="changeColor(this)" title="橙色">橙色</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe60d;</i> 会员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="peopleManage/user_initPeople" data-title="会员列表" href="javascript:void(0)">会员列表</a></li>
					<li><a data-href="peopleManage/user_initLevel" data-title="等级管理" href="javascript:void(0)">等级管理</a></li>
			</ul>
		</dd>
	</dl>

		<dl id="menu-product">
			<dt><i class="Hui-iconfont">&#xe620;</i> 商品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
				   <li><a data-href="GoodsManage/shoe_initType" data-title="类别管理" href="javascript:void(0)">类别管理</a></li>
				   <li><a data-href="GoodsManage/shoe_initShoeOnline" data-title="上架商品列表" href="javascript:void(0)">上架商品列表</a></li>
				   <li><a data-href="GoodsManage/shoe_initShoeOutline" data-title="下架商品列表" href="javascript:void(0)">下架商品列表</a></li>
					
			</ul>
		</dd>
	</dl>
	<dl id="menu-picture">
			<dt><i class="Hui-iconfont">&#xe687;</i> 订单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="order/order_stayOrder" data-title="未处理订单" href="javascript:void(0)">未处理订单</a></li>
					<li><a data-href="order/order_alReadyOrder" data-title="未收货订单" href="javascript:void(0)">未收货订单</a></li>
					<li><a data-href="order/order_collectOrder" data-title="已收货订单" href="javascript:void(0)">已收货订单</a></li>
			</ul>
		</dd>
	</dl>
		<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe622;</i> 评论管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="comment/comment_gotostayComment" data-title="未回复评论" href="javascript:;">未回复评论</a></li>
					<li><a data-href="comment/comment_alReadyComment" data-title="未已回复评论" href="javascript:void(0)">已回复评论</a></li>
			</ul>
		</dd>
	</dl>
		<dl id="menu-member">
			<dt><i class="Hui-iconfont">&#xe621;</i> 报表管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="charts/user_gotoChart" data-title="销售报表" href="javascript:;">销售报表</a></li>
			</ul>
		</dd>
	    <c:if test="${u.roleId==2 }">
	       </dl>
				<dl id="menu-admin">
				<dt><i class="Hui-iconfont">&#xe60d;</i> 管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<li><a data-href="adminManage/user_getAllAdmin" data-title="管理员列表" href="javascript:void(0)">管理员列表</a></li>
				   </ul>
			    </dd>
			</dl>
	    </c:if>
		<dl id="menu-admin">
			<dt><i class="Hui-iconfont">&#xe62d;</i> 个人信息管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="editPass/editPass.jsp" data-title="修改密码" href="javascript:void(0)">修改密码</a></li>
					<li><a data-href="javascript:;" data-title="修改密码" href="user_loginOut">退出系统</a></li>
			</ul>
		</dd>
	</dl>
</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="我的桌面" data-href="welcome.html">我的桌面</span>
					<em></em></li>
		</ul>
	</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="../user_getRemind" id="welcome"></iframe>
	</div>
</div>
</section>

<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
</ul>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../js/jquery.min.js"></script> 
<script type="text/javascript" src="../js/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../js/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="../js/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="../js/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
/* var color = $("#top").context.cookie.substring(8,12);
if(!isNaN(color)){
	color = "default"
} */
var color = "blue";

function changeColor(val){
	var old =$(val).attr("data-val");
	if(old==="default"){
		old = "black";
	}
	$("#top").removeClass(color);
	$("#top").removeClass(old);
	document.getElementById("welcome").contentWindow.changeColor(old,color); 
	color = old;
}
function initColor(){
	$("#top").removeClass('white');
	$("#top").addClass(color);
	document.getElementById("welcome").contentWindow.changeColor(color,color); 
}

</script> 
</body>
</html>