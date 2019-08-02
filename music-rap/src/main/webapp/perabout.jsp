<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.rap.bean.UserBean" %>
<%@ page import="com.rap.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息界面</title>
<% 
pageContext.setAttribute("APP_path",request.getContextPath());
UserBean user1=(UserBean)request.getSession().getAttribute("usersession");
%>
<!-- 不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出现问题
	以/开始的相对路径。找资源，以服务器的路径为标准(http://localhost:3306);需要加上项目名
		http://localhost:3306/music-rap
 -->

<script type="text/javascript" src="${APP_path}/static/js/jquery-3.0.0.min.js"></script>
<link href="${APP_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 导航条begin --------------------------------------->
<%@ include file="top.jsp" %>
<!-- 导航条end --------------------------------------->
	
	<div id="middle" style="width: 70%; margin: 0 auto; border-left:solid 2px #E5E5E5;border-right:solid 2px #E5E5E5 ;background: #EDEDED" >
	<div class="panel panel-default">
				<h3 style="padding-left: 10px">个人信息</h3>
		 		 <div class="panel-heading" style="height: 45px;padding-left: 10px; padding-top: 20px">用户:"<%=user1.getuName() %>"</div>
			</div>
	<form id="perinfo">
		<div class="form-group">
           <label for="exampleInputEmail1" class="col-sm-2 control-label">用户编号：</label>
            <div class="col-sm-9" style="margin-bottom: 15px">             
              <p class="form-control-static" id="userid" name="uId"><%=user1.getuId() %></p>
            </div>
          </div>
	
		<div class="form-group">
           <label for="exampleInputEmail1" class="col-sm-2 control-label">账号：</label>
            <div class="col-sm-9" style="margin-bottom: 15px">
              <input type="text" class="form-control" id="username" name="uName" value="<%=user1.getuName() %>">
            </div>
          </div>
          
        <div class="form-group">
           <label for="exampleInputEmail1" class="col-sm-2 control-label">原密码：</label>
            <div class="col-sm-9" style="margin-bottom: 15px">
              <input type="password" class="form-control" id="starpassword" name="starpassword">
            </div>
          </div>  
          <% %>
          
        <div class="form-group">
           <label for="exampleInputEmail1" class="col-sm-2 control-label">修改密码：</label>
            <div class="col-sm-9" style="margin-bottom: 15px">
              <input type="password" class="form-control" id="password" name="uPassword" >
            </div>
          </div>
          
          <div class="form-group">
           <label for="exampleInputEmail1" class="col-sm-2 control-label">确认密码：</label>
            <div class="col-sm-9" style="margin-bottom: 15px">
              <input type="password" class="form-control" id="password2" name="uPassword2" >
            </div>
          </div>
			
		<div class="form-group">
           <label for="exampleInputEmail1" class="col-sm-2 control-label" >电话</label>
            <div class="col-sm-9" style="margin-bottom: 20px">
              <input type="text" class="form-control" id="phone" name="uPhone" value=<%=user1.getuPhone() %>>
            </div>
          </div>
          
         <div class="form-group">
         <label for="exampleInputEmail1" class="col-sm-8 control-label"></label>
            <div class=" col-sm-3">
              <button type="submit" class="btn btn-primary btn-block" id="login" onclick="editPerson();return false;">保存</button>
            </div>
          </div>
	</form>
	</div>
	<script type="text/javascript">
	var uId=<%=user1.getuId() %>
	var star_uPassword='<%=user1.getuPassword() %>'
	
	function editPerson(){
        var sUserName =  $("#username").val();
      	var starpassword=$("#starpassword").val();
        var sPassword =  $("#password").val();
        var sPassword2 =  $("#password2").val();
        var sPhone =  $("#phone").val();
        
        if(starpassword==""){
       	 alert("请确认原密码!");            
            return false ;
       }
        
        if (sPassword =="" ){
            alert("请输入要修改的密码!");            
            return false ;
        }
        
      
       
        if (sPassword2 ==""||sPassword!=sPassword2){
            alert("请确认再次修改的密码!");
            return false ;
        }
        
        if (phone ==""){
            alert("请确认要修改的电话!");
            return false ;
        }
        
       
        
            $.ajax({
                type: "POST",
                url: "${APP_path}/peruser/"+uId,
                data: $("#perinfo").serialize()+"&_method=PUT",
                //dataType: 'json',
                success:function(result) {
                	if(result==1)
                		{alert("用户信息修改成功,请重新登录");
                		window.location.href = "${APP_path}/userlogin.jsp";}
                else{
                		{alert("原密码输入错误修改失败");}
                	}
                    	
                      

                },
           
            });
    }
	
	
	</script>
	
</body>
</html>