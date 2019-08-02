<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="com.rap.bean.UserBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>歌手详情页</title>
<% 
pageContext.setAttribute("APP_path",request.getContextPath());
//取地址的参数id和歌曲和封面地址
String serr=request.getParameter("serName");
String urrl=request.getParameter("sUrl");
String imgurrl=request.getParameter("sImgUrl");
UserBean userdetail=(UserBean)request.getSession().getAttribute("usersession");

System.out.print(serr);
System.out.print(urrl);
//String urrl="audio/浪漫手机.mp3";
%>
<style>
        .test{
            height: auto;
            margin: 0 30%;
        }
    </style>
    <script type="text/javascript" src="${APP_path}/static/js/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" src="${APP_path}/static/js/vue.min.js"></script>
	<link href="${APP_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="${APP_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:400,700" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/demo.css" />
		   <link rel="stylesheet" href="detail.css">
		<link rel="stylesheet" href="css/audioplayer.css" />
				<script>
			/*
				VIEWPORT BUG FIX
				iOS viewport scaling bug fix, by @mathias, @cheeaun and @jdalton
			*/
			(function(doc){var addEvent='addEventListener',type='gesturestart',qsa='querySelectorAll',scales=[1,1],meta=qsa in doc?doc[qsa]('meta[name=viewport]'):[];function fix(){meta.content='width=device-width,minimum-scale='+scales[0]+',maximum-scale='+scales[1];doc.removeEventListener(type,fix,true);}if((meta=meta[meta.length-1])&&addEvent in doc){fix();scales=[.25,1.6];doc[addEvent](type,fix,true);}}(document));
		</script>
</head>
<body>
<!-- 导航条begin --------------------------------------->
		<%@ include file="../top.jsp" %>
<!-- 导航条end --------------------------------------->

<div id ="serbody">
<!-- 音乐界面--------------------------------------->
	<div id="musicdetail" style="width: 60%; margin: 0 auto; border-left:solid 2px #E5E5E5;border-right:solid 2px #E5E5E5 ;background: #EDEDED">
		<div id="musicdetail-left" style="width:50%; float:left ">
			
			<p>&nbsp;&nbsp;</p>
      <img v-bind:src="simgurl" class="media-object"  style="padding-left:20px;width: 175px;height: 177px; border:2px solid white" alt="封面" >
     
    
		</div>
		<div id="musicdetail-right" style="width:50%; float:left" >
		
		<h3>歌手信息栏：</h3>
		<p>歌手:{{ser}}</p>
		<p style="padding-left: 25px;color: gray;">最新简介：{{sintro}}</p>
			<p> </p>
			
			<p> </p>
			<p> </p>
  			
  		</div>
		
		</div>
		
		 <!-- 详情页begin --------------------------------------->           			 
         
		<div id="serdetail" style="width: 70%; margin: 0 auto; padding-top:222px; border-left:solid 2px #E5E5E5;border-right:solid 2px #E5E5E5 ;background: #EDEDED" >
			<div class="panel panel-default">
				<h3 style="padding-left: 10px">热门曲目</h3>
		 		 <div class="panel-heading" style="height: 45px;padding-left: 10px; padding-top: 20px">搜索</div>
			</div>
		  <!-- Table -->  
		<table class="table">
		        <thead>
		          <tr>
		          <th></th>	
		            <th>歌名</th>
		            <th>歌手</th>
		       		<th>专辑</th>
		       		
		          </tr>
		        </thead>
		        <tbody>
		          <tr v-for="(item,index) in serlist":key="item.sId">
		            <th scope="row">{{index+1}}</th>
		            <td><a :href="getSongDetail(item.sId,item.sUrl,item.sImgUrl)">{{item.sName}}</a></td>
		            <td><a :href="getSingerDetail(item.serName,item.sUrl,item.sImgUrl)">{{item.serName}}</a></td>
		            <td><a :href="getAlbmDetail(item.serName,item.albmName,item.sImgUrl)">{{item.albmName}}</a></td>
		            
		          </tr>
		 
		        </tbody>
		      </table>
		   </div> 
		  </div> 
		   
		<script type="text/javascript">
			var sername='<%=serr%>'
			let ser=new Vue({
				el: '#serbody',
				data:{
					serlist:[],
					ser:'',
					sintro:'',
					simgurl:'',
				},
				created: function () {
			    	
			    	this.getSerlist(sername);
			    },
			    methods:{
			    	//跳转歌曲详情页
					getSongDetail:function(value,bb,img){
						return '${APP_path}/detail.jsp?sId='+value+'&'+'sUrl='+bb+'&'+'sImgUrl='+img;
					    
					},
					getSingerDetail:function(serName,bb,img){
					    return '${APP_path}/singerdetail.jsp?serName='+serName+'&'+'sUrl='+bb+'&'+'sImgUrl='+img;
					},
					
					getAlbmDetail:function(value,bb,img){
					    return '${APP_path}/albmdetail.jsp?serName='+value+'&'+'albmName='+bb+'&'+'sImgUrl='+img;
					},
			    	//查询相关歌手信息
			    	getSerlist:function(name){
			    		var serdet = this;
			    		$.ajax({
			    			url:"${APP_path}/sername",
			    			data: {"serName":name},
			    			type:'get',
			    			dataType: 'json',
			    		}).then(function(res){
			    			console.log(res);
			    			serdet.serlist=res.extend.pageInfo.list;	
			    			serdet.ser=res.extend.pageInfo.list[0].serName;
			    			serdet.sintro=res.extend.pageInfo.list[0].sIntro;
			    			serdet.simgurl=res.extend.pageInfo.list[0].sImgUrl;
			    		}).fail(function(res){
			    			console.log('失败');
			    		})
			    	}
			    }
			})

		</script>

</body>
</html>