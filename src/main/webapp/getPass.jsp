<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<title>Insert title here</title>
</head>
<body background="img/bj_zhuce.jpg">
    <p style="margin-top:100px;text-align:center;font-family:STCaiyun;font-size: 30px">找回密码</p>
    <div style="margin-left:525px;margin-top:20px;background-color:white;height:220px;width:330px;padding-top:40px;border:2px solid gray " id="div1">
      <form action="" method="post" style="margin-left:20px" >  
           <table>
              <tr height="40px">
                <td align="right">用户名:</td>
                <td><input type="text" name="userName" id="userName" style="height:32px;width:210px" placeholder="用户名" ></td>
              </tr>
              <tr height="100px">
                <td align="center" colspan="2">
                   <button type="button" onclick="next()" class="btn btn-info" style="width: 210px;margin-left: 46px" >下一步</button>
                </td>           
              </tr>              
           </table>      	 
    </form>
   </div>
   
      <div style="margin-left:525px;margin-top:20px;background-color:white;height:220px;width:350px;padding-top:40px;border:2px solid gray;display: none " id="div2">
      <form action="" method="post" style="margin-left:20px" >  
           <table>
              <tr height="40px">
                <td colspan="2">
                  <p id="phone"></p>                 
                </td>
              </tr>
              <tr height="40px">
                <td colspan="2">
                  <input type="text" name="code" id="code"  style="height:32px;width:210px" placeholder="验证码" >
                  <button type="button" id="getCodes" onclick="getCode()" class="btn btn-info"  >获取验证码</button>
                </td>
              </tr>
               <tr height="30px" style="display: none" id="msg">
                <td colspan="2">
                  <span style="color: red">未获取到验证码?60秒后可重新发送。</span>
                </td>
              </tr>
              <tr height="50px">
                <td align="center" colspan="2">
                   <button type="button" onclick="next2()" class="btn btn-info" style="width: 210px;margin-left: 10px" >下一步</button>
                </td>           
              </tr>              
           </table>      	 
    </form>
   </div>
   
      <div style="margin-left:525px;margin-top:20px;background-color:white;height:220px;width:330px;padding-top:40px;border:2px solid gray;display: none " id="div3">
      <form action="" method="post" style="margin-left:20px" >  
           <table>
              <tr height="40px">
                <td align="right">新密码:</td>
                <td><input type="password" id="new" name="userPassword"  style="height:32px;width:210px" placeholder="新密码" ></td>
              </tr>
              <tr height="40px">
                <td align="right">确认密码:</td>
                <td><input type="password" id="new2" name="rPass"  style="height:32px;width:210px" placeholder="确认密码" ></td>
              </tr>
              <tr height="40px">
                <td align="center" colspan="2">
                   <button type="button" onclick="getPass()" class="btn btn-info" style="width: 210px;margin-left: 60px" >完成</button>
                </td>           
              </tr>              
           </table>      	 
    </form>
   </div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script> 
<script type="text/javascript" src="js/layer/2.4/layer.js"></script> 
<script type="text/javascript">
var userNames ='';
var userPhone ='';
var userId ='';
var a = '';
function next(){
	var userName = $("#userName").val().trim();
	if(userName=="" || userName==null){
		layer.alert("输入用户名",{
			icon:2
		})
	}else{
		$.ajax({
			url:'user_getUserByName',
			data:{
				userName:userName,
			},
			type:'post',
			success:function(data){
				if(data===null){
					layer.msg("用户名不存在",{
						icon:2,
						time:1500
					})
				}else{
					userNames = data.userName;
					var phone = data.userPhone;
					 userPhone = phone;
					 userId = data.userId;
					var p1 = phone.substring(0,3);
					var p2 = phone.substring(7);
					phone = p1+"****"+p2; 
					$("#phone").html("向手机"+phone+"发送验证码");
					$("#div1").css("display","none");
					$("#div2").css("display","block");
				}
			}
		})
	}
};
function getCode(){	
 $.ajax({
		url:'user_getCode',
		data:{
			userPhone:userPhone,
			userId:userId,
		},
		type:'post',
		success:function(data){
			if(data===0){
				layer.msg("获取失败",{
					icon:2,
					time:1500
				})
			}else if (data===1){
				$("#getCodes").html("60s已发送");	
				a = setInterval(timeset, 1000);
				$("#getCodes").attr("disabled",true)
				$("#msg").css("display","block");
			} else{
				layer.msg("今日超过最大获取次数",{
					icon:2,
					time:1500
				})
			}
		}
	})  
}

function timeset(){
	var s = parseInt($("#getCodes").html().substring(0,2))-1;
	if(s<=0){
		clearInterval(a);
		$("#getCodes").html("重新获取");
		$("#getCodes").removeAttr("disabled")
		$("#msg").css("display","none");
	}else{
		$("#getCodes").html(s+"s已发送");
	}
}

function next2(){
	var inputCode = $("#code").val().trim();
	if(inputCode==null || inputCode==""){
		layer.msg("请输入验证码",{
			time:1500,
			icon:3
		})
	}else{
		$.ajax({
			url:'user_checkCode',
			data:{codes:inputCode},
			type:'post',
			success:function(data){
				if(data===1){
					layer.msg("验证通过",{
						icon:1,
						time:1500
					},function(){
						$("#div2").css("display","none");
						$("#div3").css("display","block");
					})
				}else{
					layer.msg("验证码错误",{
						time:1500,
						icon:2
					})
				}
			}
		})
		
	}
}

function getPass(){
	if($("#new").val().trim()=="" || $("#new").val()==null){
		layer.msg("密码必填");
	}else{
		if($("#new").val().trim()===$("#new2").val().trim()){
			$.ajax({
				url:'user_changePass',
				data:{
					userName:userNames,
					userPassword:$("#new").val().trim(),
				},
				type:'post',
				success:function(data){
					if(data===1){
						layer.alert("修改成功",{
							icon:1
						},function(){
							location.href ="login.jsp"
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
			layer.msg("两次输入不一致");
		}
	}
}
</script>
</html>