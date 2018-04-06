<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
     String  path = request.getContextPath();
     String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %> 
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css">
<style type="text/css">
.carousel img{
 width: 100%;
}
*{
  padding:0px;
  margin:0px;
}
#aa img{
  width:200px;
  height: 300px
}
#aa a{
  width: 200px
}

</style>
</head>
<body>
   <iframe scrolling="no" frameborder="0" src="front/header.jsp" width="100%" ></iframe>
     <!-- 图片滚动 -->
   <div id="carousel-example-generic" class="carousel slide " data-ride="carousel" >
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner " role="listbox" >
    <div class="item active ">
      <img src="img/Carousel_1.png" alt="..." style="height:400px;">

    </div>
    <div class="item">
      <img src="img/Carousel_2.png" alt="..." style="height:400px">

    </div>
    <div class="item">
      <img src="img/Carousel_3.png" alt="..." style="height:400px">

    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" >
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" ></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
  </a>
</div>

<div class="col-xs-8 col-xs-offset-2" id="aa" style="margin-top:20px">
   <div class="col-xs-3">
    <a href="front/shoe_searchByType?typeName=板鞋&liActive=7" class="thumbnail">
      <img src="img/p1.png" alt="...">
    </a>
  </div>
  <div class="col-xs-3">
    <a href="front/shoe_searchByType?typeName=凉鞋&liActive=7" class="thumbnail">
      <img src="img/p2.png" alt="...">
    </a>
  </div>
  <div class="col-xs-3">
    <a href="front/shoe_searchByType?typeName=皮鞋&liActive=7" class="thumbnail">
      <img src="img/p3.png" alt="...">
    </a>
  </div>
  <div class="col-xs-3">
    <a href="front/shoe_searchByType?typeName=休闲皮鞋&liActive=7" class="thumbnail">
      <img src="img/p4.png" alt="...">
    </a>
  </div>
</div>

<iframe scrolling="no" frameborder="0" src="front/footer.jsp" width="100%" height="140px" ></iframe>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/layer/2.4/layer.js"></script>
<script type="text/javascript">
$(function(){
    $('#carousel-example-generic').carousel({
      interval: 3000
    });
});
</script>
</html>