<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
pageContext.setAttribute("APP_path",request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>底部</title>
<head>
    <style type="text/css">
      html,body{margin:0;padding: 0;}
      .footer{background-color: #FFF5EE;
      			color: #48D1CC;
      }
      div p{
      	margin:0 auto;
      	text-align: center;
      }

      /* 动态为footer添加类fixed-bottom */
      .fixed-bottom {position: fixed;bottom: 0;width:100%;}
    </style>

     <script type="text/javascript" src="${APP_path}/static/js/jquery-3.0.0.min.js"></script>
    <script type="text/javascript">
      $(function(){
          function footerPosition(){
              $("footer").removeClass("fixed-bottom");
              var contentHeight = document.body.scrollHeight,//网页正文全文高度
                  winHeight = window.innerHeight;//可视窗口高度，不包括浏览器顶部工具栏
              if(!(contentHeight > winHeight)){
                  //当网页正文高度小于可视窗口高度时，为footer添加类fixed-bottom
                  $("footer").addClass("fixed-bottom");
              } else {
                  $("footer").removeClass("fixed-bottom");
              }
          }
          footerPosition();
          $(window).resize(footerPosition);
      });
    </script>
  </head>


  <body>
    
    <div class="footer">
	<p>关于Rap | About Rap | 服务条款 | 用户服务协议 | 隐私政策 | 权利声明 | 广告服务 | rap招聘 | 客服中心 | 网站导航</p>

<p>Copyright © 1998 - 2019 rap音乐. All Rights Reserved.<p>

<p>RAP音乐公司 版权所有 rap音乐网络文化经营许可证</p>

	</div>
  </body>
</body>

</html>