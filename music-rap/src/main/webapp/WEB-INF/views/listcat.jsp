<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>分类列表</title>
<% 
pageContext.setAttribute("APP_path",request.getContextPath());

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
		<!-- 搭建显示页面 -->
		
		<div class="container">
		<!-- 标题行-->
			<div class="row"> 
				<div class="col-md-12">
					<h1>分类</h1>
				</div>
			</div>
			<!-- 按钮-->
			<div class="row">
				<div class="col-md-4 col-md-offset-8">
					<button class="btn btn-success">新增</button>
					<button class="btn btn-danger">删除</button>
				</div>
			</div>
			<!-- 显示表格数据-->
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover">
						<tr>
							<th>分类ID</th>
							<th>类名</th>
							<th>操作</th>
						</tr>
						
					 <c:forEach items="${pageInfo.list}" var="cat">
							<tr>
							<th>${cat.catId}</th>
							<th>${cat.catName}</th>
							<th>
								<button class="btn-success">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
								</button>
								<button class="btn-danger">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
								</button>
							</th>
						</tr>
					  </c:forEach>
					  
					</table>
				</div>
			</div>
			<!-- 显示分页信息栏 -->
			<div class="row">
			<!-- 分页信息 -->
				<div class="col-md-6">
					当前${pageInfo.pageNum}页,总页${pageInfo.pages}页，总${pageInfo.total}条记录
				</div>
			<!-- 分页条 -->
				<div class="col-md-6">
					<nav aria-label="Page navigation">
  						<ul class="pagination">
  							<li><a href="${APP_path}/cats?pnumber=1">首页</a></li>
  							<c:if test="${pageInfo.hasPreviousPage}">
  								<li>
     							 <a href="${APP_path}/cats?pnumber=${pageInfo.pageNum-1}" aria-label="Previous">
        						   <span aria-hidden="true">&laquo;</span>
      							 </a>
   								</li>
  							</c:if>

   							<c:forEach items="${pageInfo.navigatepageNums}" var="page_Num"> 
   								<c:if test="${page_Num==pageInfo.pageNum}">
   									<li class="active"><a href="#">${page_Num}</a></li>
   								</c:if>
								<c:if test="${page_Num!=pageInfo.pageNum}">
   									<li><a href="${APP_path}/cats?pnumber=${page_Num}">${page_Num}</a></li>
   								</c:if>			
   							</c:forEach>
							
							<c:if test="${pageInfo.hasNextPage}">
								<li>
     							 <a href="${APP_path}/cats?pnumber=${pageInfo.pageNum+1}" aria-label="Next">
       							   <span aria-hidden="true">&raquo;</span>
     							 </a>
    						   </li>
							</c:if>

    						<li><a href="${APP_path}/cats?pnumber=${pageInfo.pages}">末页</a></li>
 						 </ul>
					</nav>
				</div>
			</div>
		
		</div>
</body>
</html>