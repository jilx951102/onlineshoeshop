var totalSize = $("#totalSize").val();
var currentPage = $("#currentPage").val();
var totalPage = $("#totalPage").val();
var count = $("#count").val();

function open(title,width,height,url){
  layer.open({
	  type: 2,
	  title: title,
	  shadeClose: true,
	  shade: 0.8,
	  area: [width, height],
	  content: url //iframe的url
	});
} 
/*减少的判断*/
function cut(obj){
	  $(obj).next().val(parseInt($(obj).next().val())-1)
	  if($(obj).next().val()<=0){
		  $(obj).next().val(1) 
	  }
}
//增加的判断
function add(obj,shoeStock){
	  console.log($(shoeStock).val());
	  $(obj).prev().val(parseInt($(obj).prev().val())+1);
	  if(parseInt($(obj).prev().val())>$(shoeStock).val()){
		  $(obj).prev().val($(shoeStock).val()); 
	  }
}
//直接输入值得判断
function checkNum(obj,shoeStock){
	  if($(obj).val()==""){
		  $(obj).val(1) 
	  }else{
		  if(isNaN($(obj).val()[$(obj).val().length-1])){
			  if($(obj).val().length ===1){
				  $(obj).val(1); 
			  }else{
				  $(obj).val($(obj).val().substring(0,$(obj).val().length-1))
			  }			  
		  }else{
			  if(parseInt($(obj).val())>$(shoeStock).val()){
				  $(obj).val($(shoeStock).val()); 
			  } 
		  }  
	  }	  
}
function checkNum2(obj){
	 if(isNaN($(obj).val())){
	   layer.msg("请输入数字!",{
		   time:1000
	   },function(){
		   $(obj).val(1)  
	   })
	 }
}


/**购物车的js**/
/*减少的判断*/
function cartcut(obj){
	  $(obj).next().val(parseInt($(obj).next().val())-1)
	  if($(obj).next().val()<=0){
		  $(obj).next().val(1) 
	  }else{
		  var cartId = $(obj).parent().siblings(":last").children(":eq(1)").val()
		  addCount($(obj).next().val(), cartId);
	  }
	  jsxj(obj)
}
//购物车直接输入值得判断
function cartcheckNum(obj,shoeStock){
	  if($(obj).val()==""){
		  $(obj).val(1) 
	  }else{
		  if(isNaN($(obj).val()[$(obj).val().length-1])){
			  if($(obj).val().length ===1){
				  $(obj).val(1); 
			  }else{
				  $(obj).val($(obj).val().substring(0,$(obj).val().length-1))
			  }			  
		  }else{
			  if(parseInt($(obj).val())>shoeStock){
				  $(obj).val(shoeStock); 
			  } 
		  }  
	  }	  
}
//增加的判断
function cartadd(obj,shoeStock){
	  if($(obj).prev().val()>=shoeStock){
		  $(obj).prev().val(shoeStock)  
	  }else{
		  $(obj).prev().val(parseInt($(obj).prev().val())+1);
		  var cartId = $(obj).parent().siblings(":last").children(":eq(1)").val()
		  addCount($(obj).prev().val(), cartId);
		  jsxj(obj) 
	  }
}

//计算每一个小计
function jsxj(obj){
	var count = $(obj).parent().children(":eq(1)").val();
	var cut = $(obj).parent().next().next().next().html();
	var price1 = $(obj).parent().next().next().html();
	var price = price1.substring(1);
	$(obj).parent().next().next().next().next().html("￥"+(count*cut*price).toFixed(2));
	jszj()
}
//购物车数量改变的监听
function cartcheckNum2(obj){
	 if(isNaN($(obj).val())){
	   layer.msg("请输入数字!",{
		   time:1000
	   },function(){
		   $(obj).val(1);
		   jsxj(obj) 
	   })
	 }else{
		 jsxj(obj) 		 
	 }
	 var cartId = $(obj).parent().siblings(":last").children(":eq(1)").val()
	 addCount($(obj).val(), cartId);
}
//计算总价
function jszj(){
	var total = 0;
	if($(".scheck:checked").length>0){
		$(".scheck:checked").each(function(index){
			var price1 = $(this).parent().siblings(":last").prev().html();
			var price = parseFloat(price1.substring(1));
			total+=price;
		})
	}
	$("#allMoney").html(total.toFixed(2))
	
}
//批量的共通
function getArray(){
	var array = new Array();
	  for(var i =0;i<$(".scheck:checked").length;i++){
		  array[i] = $(".scheck:checked").get(i).value;
	  }
	  return array;
}
//ajax数据库改变数量
function addCount(cartCount,cartId){
	$.ajax({
		url:'cart_addCount',
		data:{
		   cartBuynum:cartCount,
		   cartId:cartId
		},
		type:'post',
		success:function(data){
			
		}
	})
}