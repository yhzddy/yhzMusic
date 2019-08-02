<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户列表</title>
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
<style type="text/css">
body{
background:#fff url(img/otherback.jpg) repeat left top;
  background-size:100%
}

</style>

</head>
<body>
		<!-- 用户编辑模态块 -->
<!-- Modal -->
<div class="modal fade" id="userEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" >用户修改</h4>
      </div>
      <div class="modal-body">
		<form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">用户名</label>
			    <div class="col-sm-10">
			      <input type="text" name="uName" class="form-control" id="userName_edit_input" placeholder="例：2-6位">
			      <span class="help-block"></span>
			    </div>			    
			   <label class="col-sm-2 control-label">性别</label>
			   <div class="col-sm-10">			   
				<div class="radio">
  					<label>
   						 <input type="radio" name="uSex" id="userSexM_edit_radio" value="男" checked>
    						男
  					</label>
  					<label>
   						 <input type="radio" name="uSex" id="userSexW_edit_radio" value="女">
    						女
 					 </label>
				</div>
				 </div>
			    
			    
			    
			    <label class="col-sm-2 control-label">电话号码</label>
			    <div class="col-sm-10">
			      <input type="text" name="uPhone" class="form-control" id="userPhone_edit_input" placeholder="例：135****5678">
			      <span class="help-block"></span>
			    </div>
			    <label class="col-sm-2 control-label">密码</label>
			    <div class="col-sm-10">
			      <input type="text" name="uPassword" class="form-control" id="userPassword_edit_input" placeholder="例：6-12位">
			      <span class="help-block"></span>
			    </div>
			    			    
			    <label class="col-sm-2 control-label">用户权限</label>
			    <div class="col-sm-10">
			      <div class="radio">
  					<label>
   						 <input type="radio" name="uRight" id="userRightVip_edit_radio" value="1" checked>
    						管理员
  					</label>
  					
  					<label>
   						 <input type="radio" name="uRight" id="userRightNoVip_edit_radio" value="0">
    						普通用户
 					 </label>
 					 
				</div>
			    </div>
			    			   	    
			  </div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="user_edit_btn">修改</button>
      </div>
    </div>
  </div>
</div>
		




		<!-- 用户添加的模态块 -->
<!-- Modal -->
<div class="modal fade" id="userAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">用户添加</h4>
      </div>
      <div class="modal-body">
		<form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">用户名</label>
			    <div class="col-sm-10">
			      <input type="text" name="uName" class="form-control" id="userName_add_input" placeholder="例：2位-6位">
			      <span class="help-block"></span>
			    </div>
			    <label class="col-sm-2 control-label">性别</label>
			   <div class="col-sm-10">			   
				<div class="radio">
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
			    <label class="col-sm-2 control-label">电话号码</label>
			    <div class="col-sm-10">
			      <input type="text" name="uPhone" class="form-control" id="userPhone_add_input" placeholder="例：135****5678">
			      <span class="help-block"></span>
			    </div>
			    <label class="col-sm-2 control-label">密码</label>
			    <div class="col-sm-10">
			      <input type="text" name="uPassword" class="form-control" id="userPassword_add_input" placeholder="例：6-12位">
			      <span class="help-block"></span>
			    </div>
			    <label class="col-sm-2 control-label">用户权限</label>
			    <div class="col-sm-10">
			      <div class="radio">
  					<label>
   						 <input type="radio" name="uRight" id="optionsRadios3" value="1" checked>
    						Vip用户
  					</label>
  					
  					<label>
   						 <input type="radio" name="uRight" id="optionsRadios4" value="0">
    						普通用户
 					 </label>
 					 
				</div>
			    </div>
			   
			    
			  </div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="user_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>
		
		
		<!-- 搭建显示页面 -->
		
		<div class="container" style="margin-left: 50px; width: 900px">
		<!-- 标题行-->
			<div class="row"> 
				<div class="col-md-12">
					<h3>用户列表</h3>
				</div>
			</div>
			<!-- 按钮-->
			<div class="row">
				<div class="col-md-4 col-md-offset-10">
					<button class="btn btn-success" id="user_add_modal_btn">新增</button>
					
				</div>
			</div>
			<!-- 显示表格数据-->
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover" id="users_table">
						<thead>
						   <tr>
							<th class="col-md-1">用户ID</th>
							<th class="col-md-2">用户名</th>
							<th class="col-md-2">性别</th>
							<th class="col-md-2">电话</th>
							<th class="col-md-2">创建日期</th>
							<th class="col-md-1">权限</th>
							<th class="col-md-2">操作</th>
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
					url:"${APP_path}/users",
					data:"pnumber="+pnumber,
					type:"GET",
					success:function(result){
						
						build_users_table(result);
						
						build_page_info(result);
						
						build_page_nav(result);
					}
				});
				
			}
			//显示分类数据（解析json）
			function build_users_table(result) {
				//每次执行查询前 将上次的查询结果清空
				$("#users_table tbody").empty();
				
				var users=result.extend.pageInfo.list;
				$.each(users,function(index,items){
					var userIdTd=$("<td></td>").append(items.uId);
					var userSexTd=$("<td></td>").append(items.uSex);
					var userPhoneTd=$("<td></td>").append(items.uPhone);
					var userNameTd=$("<td></td>").append(items.uName);	
					
					var userDateTd=$("<td></td>").append(items.uDate);
					var userRightTd=$("<td></td>").append(items.uRight);
					var editBtn=$("<button></button>").addClass("btn-success btn_sm edit_btn").append("<span></span>")
								.addClass("glyphicon glyphicon-pencil").append("编辑");
					//每次创建 增加一个属性赋值一个id
					editBtn.attr("edit-id",items.uId);
					var editDel=$("<button></button>").addClass("btn-danger btn_sm delete_btn").append("<span></span>")
								.addClass("glyphicon glyphicon-remove").append("删除");
					//每次创建 增加一个属性赋值一个id
					editDel.attr("delete-id",items.uId);					
					var btnTd=$("<td></td>").append(editBtn).append(" ").append(editDel);
					$("<tr></tr>").append(userIdTd)
								.append(userNameTd)
								.append(userSexTd)
								.append(userPhoneTd)
								.append(userDateTd)
								.append(userRightTd)
								.append(btnTd)
								.appendTo("#users_table tbody");
					
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
			//新增用户按钮
			$("#user_add_modal_btn").click(function(){
				//每次新增 清除上一次表单数据以及样式
				$("#userAddModal form")[0].reset();
				$("#userAddModal form").find("*").removeClass("has-success has-error");
				$("#userAddModal form").find(".help-block").text("");
				
				$("#userAddModal").modal({
					backdrop:"static"
				});
			});
		
			//校验表单数据
			function validate_add_form(){	
			var userName	=$("#user_add_input").val();
			var regName =/(^[\u2E80-\u9FFF]{2,6})|(^[a-zA-Z_-]{3,16}$)/
			//1.校验格式
				if(!regName.test(userName)){
					//alert("分类名是2-6位中文或者3-16位英文组合")
					show_validate_msg("#user_add_input","error","分类名必须是2-6位中文或者3-16位英文组合");
					return false;
				}else{
					show_validate_msg("#user_add_input","success","");
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
			$("#user_add_input").change(function(){
				//发送ajax请求校验分类名是否重复
				var userName=this.value;
				$.ajax({
					url:"${APP_path}/checkusername",
					data:"userName="+userName,
					type:"POST",
					success:function(result){
						if(result.code==101){
							show_validate_msg("#user_add_input","success","命名可用");
							$("#user_save_btn").attr("ajax_val","success");
						}else{
							show_validate_msg("#user_add_input","error",result.extend.va_msg);
							$("#user_save_btn").attr("ajax_val","error");
						}
						
					}
				});
			});
			
			
			//点击保存按钮分类
			$("#user_save_btn").click(function(){
				//将模态框的表单数据交给服务器进行保存
				if(!validate_add_form()){
					return false;
				}
				//判断分类名校验是否成功，如果成功，继续保存按钮可用，否则不可用。
				if($(this).attr("ajax_val")=="error"){
					return false;
				}
				
				//发送ajax请求保存
				//alert($("#userAddModal form").serialize());
					$.ajax({
						url:"${APP_path}/useradd",
						data:$("#userAddModal form").serialize(),
						type:"POST",
						success:function(result){
							$("#userAddModal").modal('hide');
							//alert(result.msg);
							goto_page(99999);
						}
					});
			});
			
			//编辑按钮 编辑弹出模态框
			$(document).on("click",".edit_btn",function(){
				//查询分类信息
				getuser($(this).attr("edit-id"));
				//把员工id传递给模态框修改按钮
				
				$("#user_edit_btn").attr("edit-id",$(this).attr("edit-id"));
				
				$("#userEditModal").modal({
					backdrop:"static"
				});
			});
			//编辑框中查询
			function getuser(id){
				$.ajax({
					url:"${APP_path}/user/"+id,
					type:"GET",
					success:function(result){
						var userDate=result.extend.user;
						$("#userName_edit_input").val(userDate.uName);
						$("#userEditModal input[name=uSex]").val([userDate.uSex]);
						$("#userPhone_edit_input").val(userDate.uPhone);
						$("#userPassword_edit_input").val(userDate.uPassword);
						$("#userEditModal input[name=uRight]").val([userDate.uRight]);
						
					}
						
				});
			}
			//修改保存按钮
			$("#user_edit_btn").click(function(){
				var userName	=$("#user_edit_input").val();
				var regName =/(^[\u2E80-\u9FFF]{2,6})|(^[a-zA-Z_-]{3,16}$)/
				//1.校验格式
					if(!regName.test(userName)){
						//alert("分类名是2-6位中文或者3-16位英文组合")
						show_validate_msg("#user_edit_input","error","分类名必须是2-6位中文或者3-16位英文组合");
						return false;
					}else{
						show_validate_msg("#user_edit_input","success","");
					}
				
				$.ajax({
					url:"${APP_path}/user/"+$(this).attr("edit-id"),
					type:"POST",
					data:$("#userEditModal form").serialize()+"&_method=PUT",
					success:function(result){
						$("#userEditModal").modal('hide');
						goto_page(backNumPage);
					}
				});

			});
			
			
			//删除按钮
			$(document).on("click",".delete_btn",function(){
				if(confirm("确认删除吗")){
					
					//deleteuser($(this).attr("delete-id"));
					$.ajax({
						url:"${APP_path}/user/"+$(this).attr("delete-id"),
						data:{"_method": "DELETE"},
						type:"POST",
						success:function(result){
							goto_page(backNumPage);
						}
					});
				}
			
			});
			
			//function deleteuser(id){

			//}
			
		</script>
</body>
</html>