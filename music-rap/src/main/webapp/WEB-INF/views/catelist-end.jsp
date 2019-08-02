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
		<!-- 类名编辑模态块 -->
<!-- Modal -->
<div class="modal fade" id="catEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" >类名修改</h4>
      </div>
      <div class="modal-body">
		<form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">分类名</label>
			    <div class="col-sm-10">
			      <input type="text" name="catName" class="form-control" id="cat_edit_input" placeholder="例：美式RAP">
			      <span class="help-block"></span>
			    </div>
			  </div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="cat_edit_btn">修改</button>
      </div>
    </div>
  </div>
</div>
		




		<!-- 分类添加的模态块 -->
<!-- Modal -->
<div class="modal fade" id="catAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">分类添加</h4>
      </div>
      <div class="modal-body">
		<form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">分类名</label>
			    <div class="col-sm-10">
			      <input type="text" name="catName" class="form-control" id="cat_add_input" placeholder="例：美式RAP">
			      <span class="help-block"></span>
			    </div>
			  </div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="cat_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>
		
		
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
				<div class="col-md-4 col-md-offset-10">
					<button class="btn btn-success" id="cat_add_modal_btn">新增</button>
					<button class="btn btn-danger">删除</button>
				</div>
			</div>
			<!-- 显示表格数据-->
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover" id="cats_table">
						<thead>
						   <tr>
							<th class="col-md-4">分类ID</th>
							<th class="col-md-5">类名</th>
							<th class="col-md-3">操作</th>
						  </tr>
						</thead>
						<tbody>
						
						</tbody>
						
					</table>
				</div>
			</div>
			<!-- 显示分页信息栏 -->
			<div class="row">
			<!-- 分页信息 -->
				<div class="col-md-7" id="page_info_area">
					
				</div>
			<!-- 分页条 -->
				<div class="col-md-5" id="page_nav_area">
					
				</div>
			</div>
		
		</div>
		
		<script type="text/javascript">
		
		var backNumPage;
			//页面加载完 执行ajax请求 查询分类数据 json
			$(function(){
				//去首页
				goto_page(1);
			});
			
			function goto_page(pnumber){
				$.ajax({
					url:"${APP_path}/cats",
					data:"pnumber="+pnumber,
					type:"GET",
					success:function(result){
						
						build_cats_table(result);
						
						build_page_info(result);
						
						build_page_nav(result);
					}
				});
				
			}
			//显示分类数据（解析json）
			function build_cats_table(result) {
				//每次执行查询前 将上次的查询结果清空
				$("#cats_table tbody").empty();
				
				var cats=result.extend.pageInfo.list;
				$.each(cats,function(index,items){
					var catIdTd=$("<td></td>").append(items.catId);
					var catNameTd=$("<td></td>").append(items.catName);
					var editBtn=$("<button></button>").addClass("btn-success btn_sm edit_btn").append("<span></span>")
								.addClass("glyphicon glyphicon-pencil").append("编辑");
					//每次创建 增加一个属性赋值一个id
					editBtn.attr("edit-id",items.catId);
					var editDel=$("<button></button>").addClass("btn-danger btn_sm delete_btn").append("<span></span>")
								.addClass("glyphicon glyphicon-remove").append("删除");
					//每次创建 增加一个属性赋值一个id
					editDel.attr("delete-id",items.catId);					
					var btnTd=$("<td></td>").append(editBtn).append(" ").append(editDel);
					$("<tr></tr>").append(catIdTd)
								.append(catNameTd)
								.append(btnTd)
								.appendTo("#cats_table tbody");
					
				});
			}
			
			function build_page_info(result) {
				//每次执行查询前 将上次的查询结果清空
				$("#page_info_area").empty();
				
				$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总页"+
						result.extend.pageInfo.pages+"页，总"+
						result.extend.pageInfo.total+"条记录");
				
				backNumPage=result.extend.pageInfo.pageNum;
				
			}
			//分页导航
			function build_page_nav(result) {
				//每次执行查询前 将上次的查询结果清空
				$("#page_nav_area").empty();
				//构建元素
				var ul=$("<ul></ul>").addClass("pagination");
				
				var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
				var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
				if(result.extend.pageInfo.hasPreviousPage == false){
					firstPageLi.addClass("disabled");
					prePageLi.addClass("disabled");
				}else{
					//元素的点击事件
					firstPageLi.click(function(){
						goto_page(1);
					});
					prePageLi.click(function(){
						goto_page(result.extend.pageInfo.pageNum-1);
					});
				}

				
				//构建元素
				var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
				var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
				
				if(result.extend.pageInfo.hasNextPage == false){
					nextPageLi.addClass("disabled");
					prePageLi.addClass("disabled");
				}else{
					//元素的点击事件
					nextPageLi.click(function(){
						goto_page(result.extend.pageInfo.pageNum+1);
					});
					lastPageLi.click(function(){
						goto_page(result.extend.pageInfo.pages);
					});
				}

				ul.append(firstPageLi).append(prePageLi);
				$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
	
					var numLi=$("<li></li>").append($("<a></a>").append(item));
					if(result.extend.pageInfo.pageNum == item){
						numLi.addClass("active");
					}
					numLi.click(function(){
						goto_page(item);
					});
					
					ul.append(numLi);
				});
				ul.append(nextPageLi).append(lastPageLi);
				
				var nav=$("<nav></nav>").append(ul);
				nav.appendTo("#page_nav_area");//找到指定Dom前 要加#+id
			}
			//新增分类按钮
			$("#cat_add_modal_btn").click(function(){
				//每次新增 清除上一次表单数据以及样式
				$("#catAddModal form")[0].reset();
				$("#catAddModal form").find("*").removeClass("has-success has-error");
				$("#catAddModal form").find(".help-block").text("");
				
				$("#catAddModal").modal({
					backdrop:"static"
				});
			});
		
			//校验表单数据
			function validate_add_form(){	
			var catName	=$("#cat_add_input").val();
			var regName =/(^[\u2E80-\u9FFF]{2,6})|(^[a-zA-Z_-]{3,16}$)/
			//1.校验格式
				if(!regName.test(catName)){
					//alert("分类名是2-6位中文或者3-16位英文组合")
					show_validate_msg("#cat_add_input","error","分类名必须是2-6位中文或者3-16位英文组合");
					return false;
				}else{
					show_validate_msg("#cat_add_input","success","");
				};
				return true;
			}
			//展示校验的提示信息
			function show_validate_msg(ele,status,msg){
				//清楚当前元素的校验状态
				$(ele).parent().removeClass("has-success has-error");
				$(ele).next("span").text("");
				if(status=="success"){
					$(ele).parent().addClass("has-success");
					$(ele).next("span").text(msg);
				}else if(status="error"){
					$(ele).parent().addClass("has-error");
					$(ele).next("span").text(msg);
				}
			}
			
			//校验有无重复名
			$("#cat_add_input").change(function(){
				//发送ajax请求校验分类名是否重复
				var catName=this.value;
				$.ajax({
					url:"${APP_path}/checkcatname",
					data:"catName="+catName,
					type:"POST",
					success:function(result){
						if(result.code==101){
							show_validate_msg("#cat_add_input","success","命名可用");
							$("#cat_save_btn").attr("ajax_val","success");
						}else{
							show_validate_msg("#cat_add_input","error",result.extend.va_msg);
							$("#cat_save_btn").attr("ajax_val","error");
						}
						
					}
				});
			});
			
			
			//点击保存按钮分类
			$("#cat_save_btn").click(function(){
				//将模态框的表单数据交给服务器进行保存
				if(!validate_add_form()){
					return false;
				}
				//判断分类名校验是否成功，如果成功，继续保存按钮可用，否则不可用。
				if($(this).attr("ajax_val")=="error"){
					return false;
				}
				
				//发送ajax请求保存
				//alert($("#catAddModal form").serialize());
					$.ajax({
						url:"${APP_path}/catadd",
						data:$("#catAddModal form").serialize(),
						type:"POST",
						success:function(result){
							$("#catAddModal").modal('hide');
							//alert(result.msg);
							goto_page(99999);
						}
					});
			});
			
			//编辑按钮 编辑弹出模态框
			$(document).on("click",".edit_btn",function(){
				//查询分类信息
				getCat($(this).attr("edit-id"));
				//把员工id传递给模态框修改按钮
				
				$("#cat_edit_btn").attr("edit-id",$(this).attr("edit-id"));
				
				$("#catEditModal").modal({
					backdrop:"static"
				});
			});
			
			function getCat(id){
				$.ajax({
					url:"${APP_path}/cat/"+id,
					type:"GET",
					success:function(result){
						var catDate=result.extend.cat;
						$("#cat_edit_input").val(catDate.catName);
					}
				});
			}
			//修改保存按钮
			$("#cat_edit_btn").click(function(){
				var catName	=$("#cat_edit_input").val();
				var regName =/(^[\u2E80-\u9FFF]{2,6})|(^[a-zA-Z_-]{3,16}$)/
				//1.校验格式
					if(!regName.test(catName)){
						//alert("分类名是2-6位中文或者3-16位英文组合")
						show_validate_msg("#cat_edit_input","error","分类名必须是2-6位中文或者3-16位英文组合");
						return false;
					}else{
						show_validate_msg("#cat_edit_input","success","");
					}
				
				$.ajax({
					url:"${APP_path}/cat/"+$(this).attr("edit-id"),
					type:"POST",
					data:$("#catEditModal form").serialize()+"&_method=PUT",
					success:function(result){
						$("#catEditModal").modal('hide');
						goto_page(backNumPage);
					}
				});

			});
			
			
			//删除按钮
			$(document).on("click",".delete_btn",function(){
				if(confirm("确认删除吗")){
					
					//deleteCat($(this).attr("delete-id"));
					$.ajax({
						url:"${APP_path}/cat/"+$(this).attr("delete-id"),
						data:{"_method": "DELETE"},
						type:"POST",
						success:function(result){
							goto_page(backNumPage);
						}
					});
				}
			
			});
			
			//function deleteCat(id){

			//}
			
		</script>
</body>
</html>