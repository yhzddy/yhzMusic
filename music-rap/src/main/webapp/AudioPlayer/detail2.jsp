<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>详情页</title>
<% 
pageContext.setAttribute("APP_path",request.getContextPath());

%>

    <style>
        .test{
            height: auto;
            margin: 0 30%;
        }
    </style>
     <script type="text/javascript" src="${APP_path}/static/js/jquery-3.0.0.min.js"></script>
 <script type="text/javascript" src="${APP_path}/static/js/vue.min.js"></script>
  
  <script type="text/javascript" src="${APP_path}/static/js/jquery.vm-carousel.js"></script>
	<link rel="stylesheet" type="text/css" href="${APP_path}/static/css/jquery.vm-carousel.css">	
	<link rel="stylesheet" type="text/css" href="${APP_path}/static/css/zzsc.css">
	<script src="${APP_path}/static/js/modernizr.js"></script>
	
	<link href="${APP_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="${APP_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	
	
		
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
	<body>
	<!-- 导航条begin --------------------------------------->
		
<!-- 导航条end --------------------------------------->
		<div style="height:200px;text-align: center; background-color:red;padding-top:160px;padding-right:550px">
		
			<div id="wrapper" style="margin: 0 auto;width:500px"">
			<audio id="myAudio" preload="auto" controls="controls">
				<source src="audio/horse.ogg" type="audio/ogg">
				
			</audio>
			
			<a id="down" href="audio/horse.ogg" download="音乐">
				阿发发发
			</a>
			</div>	
		</div>	
			
<div class="container">
 


 /music-rap/src/main/webapp/img/1.jpg

   <ul class="vmcarousel-normal">
	  <li><img src="${APP_path}//img/1.jpg" alt="" width="200"></li>
	  <li><img src="${APP_path}//img/3.jpg" alt="" width="200"></li>
	  <li><img src="${APP_path}//img/2.jpg" alt="" width="200"></li>
	  <li><img src="${APP_path}//img/4.jpg" alt="" width="200"></li>
	  <li><img src="${APP_path}//img/2.jpg" alt="" width="200"></li>
	  <li><img src="${APP_path}//img/rap.jpg" alt="" width="200"></li>
   </ul>

<h3>日期格式化:</h3>
<c:set var="now" value="<%=new java.util.Date()%>" />

<p>日期格式化 (1): <fmt:formatDate type="time" 
            value="${now}" /></p>
<p>日期格式化 (2): <fmt:formatDate type="date" 
            value="${now}" />${now}</p>
<p>日期格式化 (3): <fmt:formatDate type="both" 
            value="${now}" /></p>
<p>日期格式化 (4): <fmt:formatDate type="both" 
            dateStyle="short" timeStyle="short" 
            value="${now}" /></p>
<p>日期格式化 (5): <fmt:formatDate type="both" 
            dateStyle="medium" timeStyle="medium" 
            value="${now}" /></p>
<p>日期格式化 (6): <fmt:formatDate type="both" 
            dateStyle="long" timeStyle="long" 
            value="${now}" /></p>
<p>日期格式化 (7): <fmt:formatDate pattern="yyyy-MM-dd" 
            value="${now}" /></p>


<script type="text/javascript">


	  $('.vmcarousel-normal').vmcarousel({
		 centered: false,
		 start_item: 0,
		 autoplay: false,
		 infinite: false
	  });
	  
$('.vmcarousel-normaldd').vmcarousel({
	 centered: false,
	 start_item: 0,
	 autoplay: false,
	 infinite: false
 });


var start=0;
var aud = document.getElementById("myAudio");
aud.onended = function() 
{
	
    start++;
    
    $.ajax({
		url:"${APP_path}/songtime",
		type:"POST",
		data:{"sPlaytime":start,"sId":3,"_method": "PUT"},
		success:function(result){
			console.log(result);
		}
	});
    alert(start);
};

var downtime=0;
var dow = document.getElementById("down");
dow.onclick = function(){
	downtime++;
	$.ajax({
		url:"${APP_path}/songtime",
		type:"POST",
		data:{"sDownload":downtime,"sId":3,"_method": "PUT"},
		success:function(result){
			console.log(result);
		}
	});
	alert(downtime);
}





 

</script>
	

	</body>
</html>