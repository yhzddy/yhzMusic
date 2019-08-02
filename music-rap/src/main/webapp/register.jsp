<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RAP音乐网站注册界面</title>
<% 
pageContext.setAttribute("APP_path",request.getContextPath());

%>
 <script type="text/javascript" src="${APP_path}/static/js/jquery-3.0.0.min.js"></script>
 <script type="text/javascript" src="${APP_path}/static/js/vue.min.js"></script>
 <link href="${APP_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="${APP_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
body{
background:#fff url(img/backgroud.jpg) no-repeat left top;
  background-size:100%
}

label{
color: black;
}

</style>
 
</head>

<body>

<div id="userRegister" style="width: 60%; position: relative; right:-520px; top: 120px;">

      
		<form class="form-horizontal">
		<div style="padding-left:140px; padding-bottom: 50px;" ><h1>RAP音乐网站用户注册</h1></div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">用户名</label>
			    <div class="col-sm-6">
			      <input type="text" name="uName" class="form-control" id="userName_add_input" placeholder="例：2位-6位">
			      <span class="help-block"></span>
			    </div>
			    </div>
			    
			     <div class="form-group">
			    <label class="col-sm-2 control-label">密码</label>
			    <div class="col-sm-6">
			      <input type="password" name="uPassword" class="form-control" id="userPassword_add_input" placeholder="例：6-12位">
			      <span class="help-block"></span>
			    </div>
			     </div>
			    
			    <div class="form-group">
			    <label class="col-sm-2 control-label">电话号码</label>
			    <div class="col-sm-6">
			      <input type="text" name="uPhone" class="form-control" id="userPhone_add_input" placeholder="例：135****5678">
			      <span class="help-block"></span>
			    </div>
			    </div>
			
			  <div class="form-group">
			    <label class="col-sm-2 control-label" >性别</label>
			   <div class="col-sm-6">			   
				<div class="radio" style="background-color:white;">
  					<label>
   						 <input type="radio" name="uSex" id="optionsRadios1" value="男" checked>
    						男
  					</label>
  					<label>
   						 <input type="radio" name="uSex" id="optionsRadios2" value="女">
    						女
 					 </label>
				</div>
				 </div>
			  </div>
			</form>
			
	<div style="padding-left: 480px">
        <button type="button" class="btn btn-primary" id="user_save_btn">注册</button>
     </div>
 </div>
     



<script type="text/javascript">

$("#user_save_btn").click(function(){
	 var sUserName =  $("#userName_add_input").val();
     var sPassword =  $("#userPassword_add_input").val();
     var sPhone =  $("#userPhone_add_input").val();
     
   
     if (sUserName =="" ){
         alert("请输入用户名!");
         return false ;
     }
     if (sPassword ==""){
         alert("请输入密码!");
         return false ;
     }
     if (sPhone ==""){
         alert("请输入电话号码!");
         return false ;
     }
	
	$.ajax({
		url:"${APP_path}/registeruser",
		data:$("#userRegister form").serialize(),
		type:"POST",
		beforeSend: function () {
            alert("正在提交");
        },
		success:function(result){
			if(result==0){
				alert("用户已存在,请重新注册");
				window.location.href = 'register.jsp';
				
			}else{
				alert("注册成功");
				window.location.href = 'userlogin.jsp';
			}
				
		},
        fail: function () {
            alert("提交失败");
        }
	});
});

</script>
</body>
</html>