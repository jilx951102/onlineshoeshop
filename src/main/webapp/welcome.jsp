<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="css/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="css/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="css/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="css/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css" href="css/common.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<style type="text/css">


  .value h1 {
    color: #45C8DC !important;
  }
  
  .fontsize-90 {
    font-size: 30px;
  }
  .a-portal {
    text-decoration:none !important;
    color: white !important;
    float: left;
    margin-top:22px;
    width:80px
  }
  .imgStyle{
    height: 23px;
    width: 20px;
    float: left;
    margin-left: 25px;
  }
  .r-div{
    border-radius: 50px;
    width:80px;
    height: 80px;
    margin-left:93px;
    text-align: center;
  }
  .o-div{ 
     float: left;
  }
  .fontStyle{
      margin-left:95px;
  }

</style>
<title>我的桌面</title>
</head>
<body onload="init()">
<div class="page-container">
   <p style="color: black;font-size:18px">新增提醒</p>
   <div class="value valuePadding o-div col-3" >
     <h1 class="fontsize-90" >
       <div class="r-div  changeColor">
            <a class="a-portal" href="javascript:;" onclick="gotoUser()" id="addUser">${remindList.addUser }</a>
       </div>
      
     </h1>
     <p style="color: black" class="fontsize-28">     
       <span class="fontStyle"><i class="Hui-iconfont">&#xe60d;</i>新增用户</span>
     </p>
   </div>
   <div class="value valuePadding o-div col-3" >
     <h1 class="fontsize-90">
       <div class="r-div  changeColor">
         <a class="a-portal" href="javascript:;" onclick="gotoOrder()" id="addOrder">${remindList.addOrder }</a>
       </div>
     </h1>
     <p style="color: black" class="fontsize-28">     
       <span class="fontStyle"><i class="Hui-iconfont">&#xe687;</i>新增订单</span>
     </p>
   </div>
   <div class="value valuePadding o-div col-3" >
     <h1 class="fontsize-90">
       <div class="r-div  changeColor">
         <a class="a-portal" href="javascript:;" onclick="gotoComment()"  id="addComment">${remindList.addComment }</a>
       </div>
     </h1>
     <p style="color: black" class="fontsize-28">     
       <span class="fontStyle"><i class="Hui-iconfont">&#xe622;</i>新增评论</span>
     </p>
   </div> 
      <div class="value valuePadding o-div col-3" >
     <h1 class="fontsize-90">
       <div class="r-div changeColor">
         <a class="a-portal" href="javascript:;" onclick="gotoShoe()" id="addShoe">${remindList.addShoe }</a>
       </div>
     </h1>
     <p style="color: black" class="fontsize-28 ">     
       <span class="fontStyle" ><i class="Hui-iconfont">&#xe620;</i>新增商品</span>
     </p>
   </div>
</div>
<hr style="width:100%">
<div style="celar:both;">
 <div id="myChart" class="col-4 " style="float:left;height:300px;width:500px;margin-top:20px;margin-left:20px"></div>
 <div class="col-4 col-xs-offset-2" style="float:left;" >
   <p style="font-size:18px;color: black;margin-top:20px">时间</p>
   <div style="width:270px;border:1px solid gray;height:70px;margin-top:80px">
     <div class="changeColor" style="width:130px;float: left;">
      <p style="color:white;font-size:18px;margin-left:5px" id="day"></p>   
      <p style="color:white;margin-left:5px" id="d"></p>
	  </div>
	  <div style="width:130px;float: left;margin-top:20px;margin-left:10px">   
	     <p style="font-size:25px;font-weight: bolder;" id="timeColor"></p>
	  </div>
   </div>
 </div>
</div>
<hr style="width:100%">

<div style="clear: both">
    <div class="col-4" style="float: left ">
       <span style="font-size: large;"><i class="Hui-iconfont">&#xe611;</i>登录记录</span>
       <c:if test="${fn:length(LoginLogList)>5 }">
          <span style="float: right" onclick="findMorelogin('登录记录(仅列出12条)','400px','${fn:length(LoginLogList)*45}px','admin/user_getMoreLogin')">更多<i class="Hui-iconfont">&#xe717;</i></span>
       </c:if>
       <table class="table table-border table-bg table-hover">
           <tr>
	           <td class="text-c">管理员名</td>
	           <td class="text-c">
	              上次登录时间
	           </td>
	       </tr>
          <c:choose>
             <c:when test="${fn:length(LoginLogList)>0}" >
               <c:forEach items="${LoginLogList }" var="l" begin="1" end="5">
                  <tr>
			           <td class="text-c">${l.userRealname }</td>
			           <td class="text-c">
			              <fmt:formatDate value="${l.loginTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
			           </td>
			       </tr>
               </c:forEach>
             </c:when>
          </c:choose>
          
       </table>        
    </div>
    
    <div class="col-8  " style="float:left">
      <span style="font-size: large;"><i class="Hui-iconfont">&#xe6cf;</i>商品销售排行</span>
      <c:if test="${fn:length(rankList)>5 }">
        <span style="float: right"  onclick="findMoreSale('销售排行(仅列出前12条)','450px','${fn:length(rankList)*46.5 }px','admin/user_getMoreSale')" >更多<i class="Hui-iconfont">&#xe717;</i></span>
      </c:if>
      <table class="table table-border table-bg table-hover">
        <tr>
         <td class="text-c">排名</td>
         <td class="text-c">商品编号</td>
         <td class="text-c">商品名称</td>
         <td class="text-c">销售数量</td>
        </tr>
        <c:choose>
            <c:when test="${fn:length(rankList)>0 }" > 
               <c:forEach items="${rankList }" var="r" varStatus="vst" begin="1" end="5">
                   <tr>
			         <td class="text-c">
			           <span class="label radius  changeColor" >${vst.count }</span>
			         </td>
			         <td class="text-c">${r.shoeId }</td>
			         <td class="text-c">${r.shoeName }</td>
			         <td class="text-c">${r.sellNum }</td>
			        </tr>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="4" class="text-c">暂无数据</td>
               </tr>
            </c:otherwise>
        </c:choose>
      </table>    
    </div>
     
</div>

<footer class="footer mt-20" style="margin-top:270px">
	<div class="container" style="clear:both;">
		<p>网上鞋店系统<br>
			本后台系统由<a href="http://www.h-ui.net/" target="_blank" title="H-ui前端框架">H-ui前端框架</a>提供前端技术支持</p>
	</div>
</footer>
<script type="text/javascript" src="js/jquery.min.js"></script> 
<script type="text/javascript" src="js/layer/2.4/layer.js"></script>
<script type="text/javascript" src="js/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="js/static/h-ui.admin/js/H-ui.admin.js"></script>
<script src="js/echarts.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
function init(){
	getTime();
	changeColor("blue");
}
  var addUser = $("#addUser").html();
  var addComment = $("#addComment").html();
  var addShoe = $("#addShoe").html();
  var addOrder = $("#addOrder").html();
  var myChart = echarts.init(document.getElementById('myChart'));
  var option = {
		  /* color: ['#2D6DCC'], */
          title: {
              text: '新增明细图表',
             
               textStyle:{
            	  color:' black',
            	  fontWeight:'normal',
            	  fontSize:'18'
              } 
          },
          tooltip : {
              trigger: 'axis',
              axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                  type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
              }
          },
          legend: {
              data:['新增'],
              selectedMode:false
          },
          xAxis: {
        	  name:'名称',
              data: ["用户","订单","评论","商品",]
          },
          yAxis: {
        	  name:'数量',
          },
          series: [{
              name: '新增',
              type: 'bar',
              data: [addUser, addOrder, addComment, addShoe, ]
          }]
      };
  // 使用刚指定的配置项和数据显示图表。
  myChart.setOption(option);
  myChart.on('click', function (params){
	  switch(params.dataIndex){
	   case 0:gotoUser() ;break;
	   case 1:gotoOrder() ;break;
	   case 2:gotoComment() ;break;
	   default: gotoShoe();
	  }
 })
 var date = new Date();
 console.log(date.getMonth())
 
 function getTime(){
	  var date = new Date();
	  var day ="";
	  switch(date.getDay()){
	    case 1 :day= "星期一";break;
	    case 2 :day= "星期二";break;
	    case 3 :day= "星期三";break;
	    case 4 :day= "星期四";break;
	    case 5 :day= "星期五";break;
	    case 6 :day= "星期六";break;
	    default :day= "星期日";break;
	  }
	 
	  var myDate = "";
      if(date.getHours()<10){
    	  myDate+="0"+date.getHours()+":";
      }else{
    	  myDate+=""+date.getHours()+":";
      }
      if(date.getMinutes()<10){
    	  myDate+="0"+date.getMinutes()+":";
      }else{
    	  myDate+=""+date.getMinutes()+":"; 
      }
      if(date.getSeconds()<10){
    	  myDate+="0"+date.getSeconds();
      }else{
    	  myDate+=""+date.getSeconds();
      }
      var dd = date.getDate()>10?date.getDate():"0"+date.getDate();
      var month = (date.getMonth()+1)>10?date.getMonth()+1:"0"+(date.getMonth()+1);
      var d = date.getFullYear()+"-"+month+"-"+dd;
      $("#d").html(d);
      $("#day").html(day);
	  $("#timeColor").html(myDate);
  }
  setInterval(getTime, 1000);
  
  function changeColor(newColor,oldColor){
	  $(".changeColor").removeClass(oldColor);
	  $(".changeColor").addClass(newColor);
	  switch (newColor) {
	case 'red':
		option.color = ["#C81623"];
		$("#timeColor").css("color","#C81623");
		break;
    case 'black':
    	option.color = ["#222222"]
    	$("#timeColor").css("color","#222222");
		break;
    case 'yellow':
    	option.color = ["#FFD200"]
    	$("#timeColor").css("color","#FFD200");
		break;
    case 'orange':
    	option.color = ["#FF4A00"]
    	$("#timeColor").css("color","#FF4A00");
	    break;
    case 'green':
    	option.color = ["#19A97B"]
    	$("#timeColor").css("color","#19A97B");
	break;
	default:
		option.color = ["#2D6DCC"]
	    $("#timeColor").css("color","#2D6DCC");
		break;
	}
	  myChart.setOption(option);
  }
  
  //查看跟多登录记录
  function findMorelogin(title,width,height,url){
	  open(title,width,height,url);
  }
  //查看销售排行
  function findMoreSale(title,width,height,url){
	  open(title,width,height,url);
  }
  
  function gotoUser(){
	  creatIframe('user_gotoUser','会员列表')
  }
  
  function gotoOrder(){
	  creatIframe('order/order_gotoOrder','未处理订单')
  }
  function gotoComment(){
	  creatIframe('comment/comment_gotoComment','未回复评论')
  }
  function gotoShoe(){
	  creatIframe('shoe_gotoShoe','上架商品列表')
  }

</script>
</body>
</html>