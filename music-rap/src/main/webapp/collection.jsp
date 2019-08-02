<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.rap.bean.UserBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收藏页面</title>
<% 
pageContext.setAttribute("APP_path",request.getContextPath());
UserBean user1=(UserBean)request.getSession().getAttribute("usersession");
%>
 <script type="text/javascript" src="${APP_path}/static/js/jquery-3.0.0.min.js"></script>
 <script type="text/javascript" src="${APP_path}/static/js/vue.min.js"></script>
 <link href="${APP_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="${APP_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="static/js/vue-resource.min.js"></script>
</head>
<body>
<!-- 导航条begin --------------------------------------->

	<%@ include file="top.jsp" %>
	
	<div id="middle">
		
		<div id="collection_song" style="width: 70%; margin: 0 auto; border-left:solid 2px #E5E5E5;border-right:solid 2px #E5E5E5 ;background: #EDEDED" >
		  <div class="panel panel-default">
				<h3 style="padding-left: 10px">收藏列表</h3>
		 		 <div class="panel-heading" style="height: 45px;padding-left: 10px; padding-top: 20px">收藏</div>
			</div>
		<table class="table">
		        <thead>
		          <tr>
		          	<th>操作</th>
		            <th>歌名</th>
		            <th>歌手</th>
		       		<th>专辑</th>
		       		
		          </tr>
		        </thead>
		        <tbody>
		          <tr v-for="(item,index) in collectionlist":key="item.songBean.sId">
		            <th scope="row">{{index+1}}&nbsp;&nbsp;<a href="javascript:void(0);" v-on:click="collecSong(<%=user1.getuId()%>,item.songBean.sId)"><img src="img/icons-hcollect.png" alt="收藏"></a></th>
		            <td><a :href="getSongDetail(item.songBean.sId,item.songBean.sUrl,item.songBean.sImgUrl)">{{item.songBean.sName}}</a></td>
		            <td><a :href="getSingerDetail(item.songBean.serName,item.songBean.sUrl,item.songBean.sImgUrl)">{{item.songBean.serName}}</a></td>
		            <td>{{item.songBean.albmName}}</td>
		            
		          </tr>
		 
		        </tbody>
		      </table>
		   </div> 	 
		
	</div>
	
	 <script type="text/javascript">
            			 //查找用户id的收藏表
            			
            			 
            			 var uid=<%=user1.getuId()%>
            			 
            			 
            			 
            			 
            			 var songss=new Vue({
            					el:'#collection_song',
            					data:{
            							collectionlist:[],
            							collectimg:'',

            					},
            					created: function (){
            						this.getCollectionList(uid);
            						
            					},
            					methods:{
            						//跳转歌曲详情页
            						getSongDetail:function(value,bb,img){
            							return '${APP_path}/detail.jsp?sId='+value+'&'+'sUrl='+bb+'&'+'sImgUrl='+img;
            						    
            						},
            						getSingerDetail:function(value,bb,img){
            							return '${APP_path}/singerdetail.jsp?serName='+value+'&'+'sUrl='+bb+'&'+'sImgUrl='+img;
            						},
            						
            						//查询收藏表歌曲相关信息
            						getCollectionList:function(id){
            							
            				      		var songs = this;
            				            $.ajax({
            				                url: "${APP_path}/collects",
            				                type: 'get',
            				                data: {"pnumber":1,"ucid":id},
            				                dataType: 'json'
            				            }).then(function (res) {
            				                console.log(res);
            				              //把从json获取的数据赋值给数组
            				                songs.collectionlist = res.extend.pageInfo.list;
            					             
            				            }).fail(function () {
            				                console.log('失败');
            				            })
            						},
            						
            						
            						//添加收藏方法 在收藏表增加
            				    	collecSong:function(uid,sid){
            				    		var that=this;
            				    		$.ajax({
            				    			url:"${APP_path}/collect",
            				    			data: {"usercId":uid,"songcId":sid},
            				    			type:'post',
            				    			dataType: 'json',
            				    		}).then(function(res){
            				    			console.log(res);
            				    			 if(res.extend.mesg==1){
            				    				alert("收藏音乐成功");
            				    				
            				    			}else{
            				    				alert("取消收藏成功");
            				    				
            				    			} 
            				    			 that.getCollectionList(uid,);
            				    			 
            				    		}).fail(function(res){
            				    			console.log('失败');
            				    		})
            				    	},
 
            						
            					}
            				})
            			 
            			 </script>
</body>
</html>