<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.rap.bean.UserBean"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录注册</title>
<% 
pageContext.setAttribute("APP_path",request.getContextPath());
Object user=request.getSession().getAttribute("usersession");

%>
<!-- 不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出现问题
	以/开始的相对路径。找资源，以服务器的路径为标准(http://localhost:3306);需要加上项目名
		http://localhost:3306/music-rap
 -->

<script type="text/javascript" src="${APP_path}/static/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${APP_path}/static/js/vue.min.js"></script>
<link href="${APP_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<style type="text/css">
body{
background:#fff url(img/logback.jpg) no-repeat left top;
  background-size:100%
}
label{
color: white;
}
</style>

</head>
<body>
<div id="left" style="width:40%; float:left">
 

</div>
  <div class="container" style="width:60%; float:right; margin-top: 100px">
 
    <h2 style="text-align:center">用户登录</h2>
    <div class="row">
      <div class="col-md-5 col-md-offset-3">
        <form class="form-horizontal" id="userlogin">
          <div class="form-group">
            <label for="exampleInputEmail1" class="col-sm-3 control-label">账号</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" id="username" name="uName" placeholder="请输入账号">
            </div>
          </div>

          <div class="form-group">
            <label for="exampleInputPassword1" class="col-sm-3 control-label">密码</label>
            <div class="col-sm-9">
              <input type="password" class="form-control" id="password" name="uPassword" placeholder="请输入密码">
            </div>
          </div>
 
          <div class="form-group">
           <div class="col-md-offset-3 col-md-3">
              <button type="submit" class="btn btn-primary btn-block"onclick="register();return false;"> 注册</button>
            </div>
            <div class="col-md-offset-3 col-md-3">
              <button type="submit" class="btn btn-primary btn-block" id="login" onclick="validataLogin();return false;">登录</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- UserBean user = "<%=session.getAttribute("usersession")%>"; -->
<script type="text/javascript">

 
  function register(){
	  
	  window.location.href = "${APP_path}/register.jsp";
  }
  
  function validataLogin(){
            var sUserName =  $("#username").val();
            var sPassword =  $("#password").val();
            if (sUserName =="" ){
                alert("请输入用户名!");
                return false ;
            }
            if (sPassword ==""){
                alert("请输入密码!");
                return false ;
            }
                $.ajax({
                    type: "POST",
                    url: "${APP_path}/validuser",
                    data: $("#userlogin").serialize(),
                    //dataType: 'json',
                    success:function(result) {
                    	if (result == -1) {
                    		alert("用户不存在,请先注册!");
                    		window.location.href = "${APP_path}/register.jsp";
                    	}else if(result == 0){
                            alert("用户名或者密码错误!");
                        }else{
                        	alert("登录成功");
                    		window.location.href = "${APP_path}/index.jsp";
                        }                                      	                                                             
                    },
               
                });
        }
         </script>
         </body>
         </html>
