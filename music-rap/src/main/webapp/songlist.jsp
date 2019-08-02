<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>歌曲列表</title>
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
		<!-- 类名编辑模态块 -->
<!-- Modal -->
<div class="modal fade" id="songEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" >歌曲修改</h4>
      </div>
      <div class="modal-body">
		<form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">歌曲名</label>
			    <div class="col-sm-10">
			      <input type="text" name="sName" class="form-control" id="songName_edit_input" placeholder="例：歌名">
			      <span class="help-block"></span>
			    </div>
				<label class="col-sm-2 control-label">歌曲简介</label>
			    	 <div class="col-sm-10">
			      <input type="text" name="sIntro" class="form-control" id="songIntro_edit_input" placeholder="例：歌手">
			      <span class="help-block"></span>
			    </div>
			     <label class="col-sm-2 control-label">歌手</label>
			    	<div class="col-sm-10">
			      <input type="text" name="serName" class="form-control" id="singer_edit_input" placeholder="例：歌名">
			      <span class="help-block"></span>
			    </div>
			     <label class="col-sm-2 control-label">专辑名</label>
			    <div class="col-sm-10">
			      <input type="text" name="albmName" class="form-control" id="albmName_edit_input" placeholder="专辑名" data-show-upload="false" data-show-caption="true">
			      <span class="help-block"></span>
			    </div>
			    <label class="col-sm-2 control-label">类名</label>
			    <div class="col-sm-5">
			      <select class="form-control" name="cId" id="cat_edit_select"> </select>
			    </div>
			  </div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="song_edit_btn">修改</button>
      </div>
    </div>
  </div>
</div>
		




		<!-- 音乐添加的模态块 -->
<!-- Modal -->
<div class="modal fade" id="songAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">歌曲添加</h4>
      </div>
      <div class="modal-body">
		<form id="musicInfo" class="form-horizontal" enctype="multipart/form-data" method="post">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">歌曲名</label>
			    <div class="col-sm-10">
			      <input type="text" name=sName class="form-control" id="songName_add_input" placeholder="歌名">
			      <span class="help-block"></span>
			    </div>
				 <label class="col-sm-2 control-label">歌曲简介</label>
			    <div class="col-sm-10">
			      <input type="text" name="sIntro" class="form-control" id="songIntro_add_input" placeholder="歌曲简介">
			      <span class="help-block"></span>
			    </div>
			     <label class="col-sm-2 control-label">歌曲上传</label>
			    <div class="col-sm-10">
			      <input type="file" name="songfile"  class="file" id="songUrl_add_input" placeholder="歌曲上传" data-show-upload="false" data-show-caption="true">
			     
			      <span class="help-block"></span>
			    </div>
			    <label class="col-sm-2 control-label">封面上传</label>
			    <div class="col-sm-10">
			      <input type="file" name="imgfile"  class="file" id="imgUrl_add_input" placeholder="封面上传" data-show-upload="false" data-show-caption="true">
			     
			      <span class="help-block"></span>
			    </div>
			    
			     <label class="col-sm-2 control-label">歌手名</label>
			    <div class="col-sm-10">
			      <input type="text" name="serName" class="form-control" id="singerName_add_input" placeholder="歌手名" data-show-upload="false" data-show-caption="true">
			      <span class="help-block"></span>
			    </div>
			     <label class="col-sm-2 control-label">专辑名</label>
			    <div class="col-sm-10">
			      <input type="text" name="albmName" class="form-control" id="albmName_add_input" placeholder="专辑名" data-show-upload="false" data-show-caption="true">
			      <span class="help-block"></span>
			    </div>
			    <label class="col-sm-2 control-label">类名</label>
			    <div class="col-sm-5">
			      <select class="form-control" name="cId" id="cat_add_select"> </select>
			    </div>
			  
			  </div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="song_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>
		
		
		<!-- 搭建显示页面 -->
		
		<div class="container" style="margin-left: 50px; width:900px; " >
		<!-- 标题行-->
			<div class="row"> 
				<div class="col-md-12">
					<h3>歌曲列表</h3>
				</div>
			</div>
			<!-- 按钮-->
			<div class="row">
				<div class="col-md-4 col-md-offset-10">
					<button class="btn btn-success" id="song_add_modal_btn">新增</button>
					
				</div>
			</div>
			<!-- 显示表格数据-->
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover" id="songs_table" >
						<thead>
						   <tr>
							<th class="col-md-1">歌曲ID</th>
							<th class="col-md-1">歌名</th>
							
							<th class="col-md-1">发布时间</th>
							<th class="col-md-1">播放次数</th>
							<th class="col-md-1">下载次数</th>
							<th class="col-md-1">歌手名</th>
							<th class="col-md-1">专辑名</th>
							<th class="col-md-1">所属类</th>
							<th class="col-md-1">歌曲地址</th>
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
					url:"${APP_path}/songs",
					data:"pnumber="+pnumber,
					type:"GET",
					success:function(result){
						
						build_songs_table(result);
						
						build_page_info(result);
						
						build_page_nav(result);
					}
				});
				
			}
			//显示分类数据（解析json）
			function build_songs_table(result) {
				//每次执行查询前 将上次的查询结果清空
				$("#songs_table tbody").empty();
				/*
											<th class="col-md-1">歌曲ID</th>
							<th class="col-md-1">歌名</th>
							<th class="col-md-1">歌曲简介</th>
							<th class="col-md-1">发布时间</th>
							<th class="col-md-1">播放次数</th>
							<th class="col-md-1">下载次数</th>
							<th class="col-md-1">歌手名</th>
							<th class="col-md-1">专辑名</th>
							<th class="col-md-1">所属类</th>*/
				var songs=result.extend.pageInfo.list;
				$.each(songs,function(index,items){
					var songIdTd=$("<td></td>").append(items.sId);
					var songNameTd=$("<td></td>").append(items.sName);
					
					var songIssuetimeTd=$("<td></td>").append(items.sIssuetime);
					var songPlaytimeTd=$("<td></td>").append(items.sPlaytime);
					var songDownloadTd=$("<td></td>").append(items.sDownload);
					var singerNameTd=$("<td></td>").append(items.serName);
					var albmNameTd=$("<td></td>").append(items.albmName);
					var catNameTd=$("<td></td>").append(items.categoryBean.catName);
					var songUrlTd=$("<td></td>").append(items.sUrl);
					var editBtn=$("<button></button>").addClass("btn-success btn_sm edit_btn").append("<span></span>")
								.addClass("glyphicon glyphicon-pencil").append("编辑");
					//每次创建 增加一个属性赋值一个id
					editBtn.attr("edit-id",items.sId);
					var editDel=$("<button></button>").addClass("btn-danger btn_sm delete_btn").append("<span></span>")
								.addClass("glyphicon glyphicon-remove").append("删除");
					//每次创建 增加一个属性赋值一个id
					editDel.attr("delete-id",items.sId);					
					var btnTd=$("<td></td>").append(editBtn).append(" ").append(editDel);
					$("<tr></tr>").append(songIdTd)
								.append(songNameTd)
								.append(songIssuetimeTd)
								.append(songPlaytimeTd)
								.append(songDownloadTd)
								.append(singerNameTd)
								.append(albmNameTd)
								.append(catNameTd)
								.append(songUrlTd)
								.append(btnTd)
								.appendTo("#songs_table tbody");
					
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
			
			//新增歌曲按钮弹出模态框
			$("#song_add_modal_btn").click(function(){
				//每次新增 清除上一次表单数据以及样式
				$("#songAddModal form")[0].reset();
				$("#songAddModal form").find("*").removeClass("has-success has-error");
				$("#songAddModal form").find(".help-block").text("");
				
				getSongCat("#cat_add_select");
				
				$("#songAddModal").modal({
					backdrop:"static"
				});
			});
				//查询音乐下的分类 select 在cate控制器
			function getSongCat(ele){
				$(ele).empty();
				$.ajax({
					url:"${APP_path}/songwithcat",
					type:"GET",
					success:function(result){
						$.each(result.extend.cats,function(){
							var optionEle =$("<option></option>").append(this.catName).attr("value",this.catId);
							optionEle.appendTo(ele);
						});
						
					}
				});
			}
			
			//校验表单数据
			function validate_add_form(){	
			var songName	=$("#songName_add_input").val();
			var regName =/(^[\u2E80-\u9FFF]{2,6})|(^[a-zA-Z_-]{3,16}$)/
			//1.校验格式
				if(!regName.test(songName)){
					//alert("分类名是2-6位中文或者3-16位英文组合")
					show_validate_msg("#songName_add_input","error","歌名必须是2-6位中文或者3-16位英文组合");
					return false;
				}else{
					show_validate_msg("#songName_add_input","success","");
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
			$("#songName_add_input").change(function(){
				//发送ajax请求校验分类名是否重复
				var songName=this.value;
				$.ajax({
					url:"${APP_path}/checksongname",
					data:"songName="+songName,
					type:"POST",
					success:function(result){
						if(result.code==100){
							show_validate_msg("#songName_add_input","success","命名可用");
							$("#song_save_btn").attr("ajax_val","success");
						}else{
							show_validate_msg("#songName_add_input","error",result.extend.va_msg);
							$("#song_save_btn").attr("ajax_val","error");
						}
						
					}
				});
			});
		
			//上传歌曲 songUrl_add_input			$("#songUrl_add_input").change(function(){}	
			//upload=function upload(){
			$("#song_save_btn").click(function(){
				//将模态框的表单数据交给服务器进行保存
            var form = new FormData(document.getElementById("musicInfo"));
            $.ajax({
                url:"${APP_path}/songadd",
                type:"post",
                data:form,
                dataType: 'json',
                enctype:'multipart/form-data',
                processData:false,
                contentType:false,
                success:function(result){
                  //  window.clearInterval(timer);
                  $("#songAddModal").modal('hide');
                    console.log("over..");
                    goto_page(99999);
                },
                error: function (e)//服务器响应失败处理函数  
                {  
                    alert("上传失败");  
                } 
                
            });        
		});
        //}
			
			
			
		
			
			//编辑按钮 编辑弹出模态框
			$(document).on("click",".edit_btn",function(){
				//查询分类信息
				getsong($(this).attr("edit-id"));
				//把员工id传递给模态框修改按钮
				
				$("#song_edit_btn").attr("edit-id",$(this).attr("edit-id"));
				
				getSongCat("#cat_edit_select");
				
				$("#songEditModal").modal({
					backdrop:"static"
				});
			});
			//编辑框中查询歌曲信息
			function getsong(id){
				$.ajax({
					url:"${APP_path}/song/"+id,
					type:"GET",
					success:function(result){
						var songDate=result.extend.song;
						$("#songName_edit_input").val(songDate.sName);
						$("#songIntro_edit_input").val(songDate.sIntro);
						$("#singer_edit_input").val(songDate.serName);
						$("#albmName_edit_input").val(songDate.albmName);
						$("#cat_edit_select").val([songDate.cId]);
					}
				});
			}
			//修改保存按钮
			$("#song_edit_btn").click(function(){
				var songName	=$("#songName_edit_input").val();
				/* var regName =/(^[\u2E80-\u9FFF]{2,6})|(^[a-zA-Z_-]{3,16}$)/
					
				//1.校验格式
					if(!regName.test(songName)){
						//alert("分类名是2-6位中文或者3-16位英文组合")
						show_validate_msg("#songName_edit_input","error","歌名必须是2-6位中文或者3-16位英文组合");
						return false;
					}else{
						show_validate_msg("#songName_edit_input","success","");
					} */
				
				$.ajax({
					url:"${APP_path}/song/"+$(this).attr("edit-id"),
					type:"POST",
					data:$("#songEditModal form").serialize()+"&_method=PUT",
					success:function(result){
						$("#songEditModal").modal('hide');
						goto_page(backNumPage);
					}
				});

			});
			
			
			//删除按钮
			$(document).on("click",".delete_btn",function(){
				if(confirm("确认删除吗")){
					
					//deletesong($(this).attr("delete-id"));
					$.ajax({
						url:"${APP_path}/song/"+$(this).attr("delete-id"),
						data:{"_method": "DELETE"},
						type:"POST",
						success:function(result){
							goto_page(backNumPage);
						}
					});
				}
			
			});
			
			//function deletesong(id){

			//}
			
		</script>
</body>
</html>