<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.rap.bean.UserBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
pageContext.setAttribute("APP_path",request.getContextPath());
UserBean user=(UserBean)request.getSession().getAttribute("usersession");
%>
 <script type="text/javascript" src="${APP_path}/static/js/jquery-3.0.0.min.js"></script>
 <script type="text/javascript" src="${APP_path}/static/js/vue.min.js"></script>
 <link href="${APP_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="${APP_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="static/js/vue-resource.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>导航页</title>
</head>
<body>
   
   <%    
             if(session.getAttribute("username") == null) {      
   %>    
          <script type="text/javascript" language="javascript">        
            alert("您还没有登录，请登录...");   
           location.href="userlogin.jsp";  
           </script>   
   <%    
       }    
   %>  
<!-- 导航条begin --------------------------------------->


  <div class="container-fluid" style="background: #242424 ">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" style="padding-left: 200px">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp" style="color:white;">首页</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li ><a href="index.jsp" style="color:white;">音乐地带 <span class="sr-only">(current)</span></a></li>
        <li><a href="index.jsp#songRank" style="color:white;">排行榜</a></li>
          <li><a href="albmlist.jsp" style="color:white;">专辑</a></li>
             <li><a href="collection.jsp" style="color:white;">我的收藏</a></li>
      </ul>
      <form class="navbar-form navbar-left" action="seldetail.jsp" method="get">
        <div class="form-group">
          <input type="text" name="songName" class="form-control" value="" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
      </form>
      <ul class="nav navbar-nav navbar-right" style="padding-top: 10px">
        <font color="white">用户:</font><a href="perabout.jsp" style="color:white;"><%=session.getAttribute("username") %></a>
  		<font color="white"></font><a href="logout.jsp" style="color:white;">注销</a>
      </ul>
    </div>
  </div>
<div style="border-bottom:3px solid #FF3030 "></div>

<!-- 导航条end --------------------------------------->
</body>
</html>