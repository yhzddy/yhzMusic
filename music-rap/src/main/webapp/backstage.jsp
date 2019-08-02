<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.rap.bean.UserBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台界面</title>
<% 
pageContext.setAttribute("APP_path",request.getContextPath());
UserBean adminname=(UserBean)request.getSession().getAttribute("adminsession");
%>
<!-- 不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出现问题
	以/开始的相对路径。找资源，以服务器的路径为标准(http://localhost:3306);需要加上项目名
		http://localhost:3306/music-rap
 -->

<script type="text/javascript" src="${APP_path}/static/js/jquery-3.0.0.min.js"></script>
<link href="${APP_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<style type="text/css">
body{
background:#fff url(img/stage.jpg) repeat left top;
  background-size:100%
}
label{
color: white;
}
</style>

</head>
<body>
<body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <nav class="navbar navbar-fixed-top" role="navigation">
                        <div class="container">
                            <div class="navbar-header">
                                <a class="navbar-brand " href="javascript:void(0);">后台管理系统</a>
                            </div>
                            <div id="navbar" class="navbar-right">
                                <a class="navbar-brand" href="#">当前用户：<%=adminname.getuName() %></a>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
            <div class="row" style="padding-top: 45px;">
                <div class="col-md-2">
                    <div class="list-group " >
                   		 <ul >
                        <!--激活，作为标题-->
                        <a href="#" class="list-group-item active ">
                            		系统菜单
                        </a>
                        <a href="javascript:void(0);"><li id="li-one" class="list-group-item">分类管理</li></a>
                       <a href="javascript:void(0);"> <li id="li-two" class="list-group-item">用户管理</li></a>
                        <a href="javascript:void(0);"><li id="li-three" class="list-group-item">音乐管理</li></a>
						</ul>
                    </div>
                </div>
                <div class="col-md-10">
                    <div style="background-color: white;"><span class="glyphicon glyphicon-home"></span>&nbsp;
                                <a href="#">主页</a>
                    </div>
                    <div align="center" >
                            <div class="content">
        			<div id="matter1" >
        			
            			<!--引入外部文件，即需要在右侧加载的内容-->
            		<iframe id="if1" src="catelist.jsp" name="cateFrame" frameborder="0" marginheight="0" marginwidth="0" height="480" width="100%">
            			 </iframe>
        				</div>

        		<div id="matter2" style="display: none">
            		<iframe src="userlist.jsp" name="userFrame" frameborder="0" marginheight="0" marginwidth="0" height="480" width="100%">
            			 </iframe>
        				</div>
       			<div id="matter3" style="display: none">
       				<iframe src="songlist.jsp" name="songFrame" frameborder="0" marginheight="0" marginwidth="0" height="480" width="100%">
            			 </iframe>
           				
				        </div>
				        <!--
				            ...........中间的都一样的，只不过加载的文件不一样而已
				        -->
				  
				    </div>
                    </div>
                </div>
            </div>
            </div>
          
    </body>

     
		     <script>
		     
  /*    function setIframeHeight(iframe) {
		    		iframe.onload=function(){
		    			var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow; 
		    			var iframeHeight=iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
		    			iframe.height = iframeHeight+10; 
		    		}
		    	};
		    	setIframeHeight(document.getElementById('if1'));  */
		     
		     
		$(document).ready(function() {
		    var temp = "none";
		
		    $("#li-one").click(function () {
		        openMatter(1);
		    });
		    $("#li-two").click(function () {
		        openMatter(2);
		    });
		    $("#li-three").click(function () {
		        openMatter(3);
		    });
		    $("#li-four").click(function () {
		        openMatter(4);
		    });
		    $("#li-five").click(function () {
		        openMatter(5);
		    });
		    $("#li-six").click(function () {
		        openMatter(6);
		    });
		    $("#li-seven").click(function () {
		        openMatter(7);
		    });
		    $("#li-eight").click(function () {
		        openMatter(8);
		    });
		    $("#li-nine").click(function () {
		        openMatter(9);
		    });
		    $("#li-ten").click(function () {
		        openMatter(10);
		    });
		    $("#li-eleven").click(function () {
		        openMatter(11);
		    });
		    function openMatter(obj) {
		        for (var i = 1; i < 12; i++) {
		            if (i == obj) {
		                temp = "block";
		            } else {
		                temp = "none";
		            }
		            document.getElementById("matter" + i).style.display = temp;
		
		        }
		    }
		});
		</script>

    </body>


</html>