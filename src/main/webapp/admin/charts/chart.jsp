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
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe621;</i>报表管理<span class="c-666 en">&gt;</span><span class="c-666">销售报表</span>
    <a href="javascript:;" onclick="location.reload()"><i class="Hui-iconfont btn btn-success radius" style="float:right;margin-top: 4px">&#xe68f;</i> </a>
</nav>
<c:forEach items="${chartList }" var="c" varStatus="vst">
   <p class="cl">
      <input value="${c.typeName }" type="hidden">
      <input value="${c.sellNum }" type="hidden">
   </p>
</c:forEach>
<c:forEach items="${chartList2 }" var="c2" varStatus="vst">
   <p class="cl2">
      <input value="${c2.typeName }" type="hidden">
      <input value="${c2.sellMoney }" type="hidden">
   </p>
</c:forEach>
 <div id="myChart1" class="col-6 " style="float:left;height:300px;width:500px;margin-top:20px;margin-left:20px"></div>
 <div id="myChart2" class="col-6 " style="float:left;height:300px;width:500px;margin-top:20px;margin-left:20px"></div>
 <hr style="width:100%">
 <div id="myChart3" class="col-6 " style="float:left;height:300px;width:500px;margin-top:20px;margin-left:20px"></div>
 <div id="myChart4" class="col-6 " style="float:left;height:300px;width:500px;margin-top:20px;margin-left:20px"></div>
</body>
<script type="text/javascript" src="../../js/jquery.min.js"></script> 
<script type="text/javascript" src="../../js/echarts.min.js"></script>
<script type="text/javascript">
  if($(".cl").length>0){
	  var nameArray = new Array();
	  var moneyArray = new Array();
	  var nameArray2 = new Array();
	  var sellArray = new Array();
	if($(".cl").length<5){
		$(".cl").each(function(index){
			nameArray.push($(this).children(":eq(0)").val());
			sellArray.push(parseFloat($(this).children(":eq(1)").val()));
		})
		$(".cl2").each(function(index){
			nameArray2.push($(this).children(":eq(0)").val());
			moneyArray.push(parseFloat($(this).children(":eq(1)").val()));
		})
	}else{
		var name="其他";
		var sell =0;
		var money = 0;
		$(".cl").each(function(index){
			if(index <5){
				nameArray.push($(this).children(":eq(0)").val());
				sellArray.push(parseFloat($(this).children(":eq(1)").val()));
			}else{
				sell+=parseFloat(parseFloat($(this).children(":eq(1)").val()));
			}			
		})
		$(".cl2").each(function(index){
			if(index <5){
				nameArray2.push($(this).children(":eq(0)").val());
				moneyArray.push(parseFloat($(this).children(":eq(1)").val()));
			}else{
				money+=parseFloat(parseFloat($(this).children(":eq(1)").val()));
			}			
		})
		nameArray.push(name);
		nameArray2.push(name);
		sellArray.push(sell);
		moneyArray.push(money);
		
	}
	var myChart1 = echarts.init(document.getElementById('myChart1'));
	  var option1 = {
			    title : {
			        text: '类别数量销售统计饼图',
			        x:'center'
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        left: 'left',
			        data: nameArray
			    },
			    series : [
			        {
			            name: '数量统计',
			            type: 'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:[],
			            itemStyle: {
			                emphasis: {
			                    shadowBlur: 10,
			                    shadowOffsetX: 0,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                }
			            }
			        }
			    ]
			};
	    for(var i =0 ; i<nameArray.length;i++){
	    	option1.series[0].data.push({
	    		name:nameArray[i],value:sellArray[i]
		    })
	    }
	    myChart1.setOption(option1);
	    
	    var myChart2 = echarts.init(document.getElementById('myChart2'));
	    var option2 = {
	  		   color: ['#9FDABF'], 
	            title: {
	                text: '类别数量销售统计柱状图',
	                x: 'center',  
	                 textStyle:{
	              	  color:' black',          	  
	                } 
	            },
	            tooltip : {
	                trigger: 'axis',
	                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	                }
	            },
	            legend: {
	                data:['数量统计'],
	                selectedMode:false,
	                align:'left',
	                left:'left',
	            },
	            xAxis: {
	          	  name:'类别',
	                data: nameArray
	            },
	            yAxis: {
	          	  name:'数量/双',
	            },
	            series: [{
	                name: '数量统计',
	                type: 'bar',
	                data: sellArray
	            }]
	        };
	    // 使用刚指定的配置项和数据显示图表。
	    myChart2.setOption(option2);
	    
	    var myChart3 = echarts.init(document.getElementById('myChart3'));
	    var option3 = {
	  		    title : {
	  		        text: '类别利润销售统计饼图',
	  		        x:'center'
	  		    },
	  		    tooltip : {
	  		        trigger: 'item',
	  		        formatter: "{a} <br/>{b} : {c} ({d}%)"
	  		    },
	  		    legend: {
	  		        orient: 'vertical',
	  		        left: 'left',
	  		        data: nameArray2
	  		    },
	  		    series : [
	  		        {
	  		            name: '利润统计',
	  		            type: 'pie',
	  		            radius : '55%',
	  		            center: ['50%', '60%'],
	  		            data:[],
	  		            itemStyle: {
	  		                emphasis: {
	  		                    shadowBlur: 10,
	  		                    shadowOffsetX: 0,
	  		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	  		                }
	  		            }
	  		        }
	  		    ]
	  		};
	      for(var i =0 ; i<nameArray2.length;i++){
	    	 option3.series[0].data.push({
	    		name:nameArray2[i],value:moneyArray[i]
		     })
	      }
	      myChart3.setOption(option3);
	      
	      var myChart4 = echarts.init(document.getElementById('myChart4'));
	      var option4 = {
	    		   color: ['#9FDABF'], 
	              title: {
	                  text: '类别利润销售统计柱状图',
	                  x: 'center',  
	                   textStyle:{
	                	  color:' black',          	  
	                  } 
	              },
	              tooltip : {
	                  trigger: 'axis',
	                  axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                      type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	                  }
	              },
	              legend: {
	                  data:['利润统计'],
	                  selectedMode:false,
	                  align:'left',
	                  left:'left',
	              },
	              xAxis: {
	            	  name:'类别',
	                  data: nameArray2
	              },
	              yAxis: {
	            	  name:'金额/元',
	              },
	              series: [{
	                  name: '利润统计',
	                  type: 'bar',
	                  data: moneyArray
	              }]
	          };
	      // 使用刚指定的配置项和数据显示图表。
	      myChart4.setOption(option4);
  }
  
</script>
</html>