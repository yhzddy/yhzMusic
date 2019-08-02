<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.rap.bean.UserBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% 
pageContext.setAttribute("APP_path",request.getContextPath());
UserBean user1=(UserBean)request.getSession().getAttribute("usersession");
%>
 <script type="text/javascript" src="${APP_path}/static/js/jquery-3.0.0.min.js"></script>
 <script type="text/javascript" src="${APP_path}/static/js/vue.min.js"></script>
 <script type="text/javascript" src="${APP_path}/static/js/jquery.vm-carousel.js"></script>
 
  <script src="${APP_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="${APP_path}/static/js/modernizr.js"></script>
	
	<link rel="stylesheet" type="text/css" href="${APP_path}/static/css/jquery.vm-carousel.css">	
	<link rel="stylesheet" type="text/css" href="${APP_path}/static/css/zzsc.css">
 <link href="${APP_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">





</head>
<body>
<%    
      if(user1 == null) {      
   %>    
          <script type="text/javascript" language="javascript">        
            alert("您还没有登录，请登录...");   
           location.href="userlogin.jsp";  
           </script>   
   <%    
       }    
   %> 

<%System.out.print("APP_path" );%>
     

<!-- 导航条begin --------------------------------------->
<%@ include file="top.jsp" %>
<!-- 导航条end --------------------------------------->

<!-- 轮播begin --------------------------------------->

<div id="myCarousel" class="carousel slide" style="height:400px">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner">
		<div class="item active">
		
			<img src="img/1.jpg" alt="First slide">
		</div>
		<div class="item">
			<img  src="img/2.jpg" alt="Second slide">
		</div>
		<div class="item">
			<img  src="img/4.jpg" alt="Third slide">
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div> 

<!-- 轮播end --------------------------------------->




		
		
		
		
	<div id="songRank" style="margin:20px auto;width:70%" >
	
	<!-- 缩略图1 begin -->
		
		<div class="row">
		    <div class="col-sm-6 col-md-3">
		        <div class="thumbnail">
		           <a :href="getSongDetail(songlist[0].sId,songlist[0].sUrl,songlist[0].sImgUrl)"> 
		           <img :src="songlist[0].sImgUrl" alt="封面" style="height:180px"></a>
		            <div class="caption">
		               <h4>{{songlist[0].sName}}</h4>
		                <p>{{songlist[0].sIntro}}</p>
	
		            </div>
		        </div>
		    </div>
		    <div class="col-sm-6 col-md-3">
		        <div class="thumbnail">
		        <a :href="getSongDetail(songlist[1].sId,songlist[1].sUrl,songlist[1].sImgUrl)"> 
		            <img :src="songlist[1].sImgUrl"
		                 alt="封面" style="height:180px"	>
		                 </a>
		            <div class="caption">
		                <h4>{{songlist[1].sName}}</h4>
		                <p>{{songlist[1].sIntro}}</p>
		     
		            </div>
		        </div>
		    </div>
		    <div class="col-sm-6 col-md-3">
		        <div class="thumbnail">
		        <a :href="getSongDetail(songlist[2].sId,songlist[2].sUrl,songlist[2].sImgUrl)"> 
		            <img :src="songlist[2].sImgUrl"
		                 alt="封面" style="height:180px"	>
		                 </a>
		            <div class="caption">
		               <h4>{{songlist[2].sName}}</h4>
		                <p>{{songlist[2].sIntro}}</p>
		     
		            </div>
		        </div>
		    </div>
		    <div class="col-sm-6 col-md-3">
		        <div class="thumbnail">
		        <a :href="getSongDetail(songlist[3].sId,songlist[3].sUrl,songlist[3].sImgUrl)"> 
		            <img :src="songlist[3].sImgUrl"
		                 alt="封面" style="height:180px"	>
		                 </a>
		            <div class="caption">
		                <h4>{{songlist[3].sName}}</h4>
		                <p>{{songlist[3].sIntro}}</p>
		     
		            </div>
		        </div>
		    </div>
		</div>
		<!-- 缩略图1end ---------------------------------------------->
	
	
	<div style="border-bottom:1.5px solid #C10D0C;"><h4>热歌排行榜</h4></div>
		<!-- 排行榜1begin --------------------------------------->
		<div class="panel panel-default">
		  <!-- Default panel contents -->
		  
		</div>
		<div id="rank1">
		  <!-- Table -->  
		<table class="table">
		        <thead>
		          <tr>
		            <th>排名</th>
		            <th>歌名</th>
		       		<th>歌手</th>
		       		<th>收听次数</th>
		          </tr>
		        </thead>
		        <tbody>
		          <tr v-for="(item,index) in songlist":key="item.sId">
		            <th scope="row">{{index+1}}</th>
		            <td><a :href="getSongDetail(item.sId,item.sUrl,item.sImgUrl)">{{item.sName}}</a></td>
		            <td><a :href="getSingerDetail(item.serName,item.sUrl,item.sImgUrl)">{{item.serName}}</a></td>
		            <td>{{item.sPlaytime}}</td>
		          </tr>
		 
		        </tbody>
		      </table>
		   </div> 
		
		<!-- 排行榜1end --------------------------------------->
		   
		   
		 <!-- 缩略图2 begin -->
		
		<div class="row">
		    <div class="col-sm-6 col-md-3">
		        <div class="thumbnail">
		        <a :href="getSongDetail(songlist2[0].sId,songlist2[0].sUrl,songlist2[0].sImgUrl)"> 
		            <img :src="songlist2[0].sImgUrl"
		                 alt="封面" style="height:180px"	>
		                 </a>
		            <div class="caption">
		                <h4>{{songlist2[0].sName}}</h4>
		                <p>{{songlist2[0].sIntro}}</p>
	
		            </div>
		        </div>
		    </div>
		    <div class="col-sm-6 col-md-3">
		        <div class="thumbnail">
		        <a :href="getSongDetail(songlist2[1].sId,songlist2[1].sUrl,songlist2[1].sImgUrl)"> 
		            <img :src="songlist2[1].sImgUrl"
		                 alt="封面" style="height:180px"	>
		                 </a>
		            <div class="caption">
		                <h4>{{songlist2[1].sName}}</h4>
		                <p>{{songlist2[1].sIntro}}</p>
		     
		            </div>
		        </div>
		    </div>
		    <div class="col-sm-6 col-md-3">
		        <div class="thumbnail">
		        <a :href="getSongDetail(songlist2[2].sId,songlist2[2].sUrl,songlist2[2].sImgUrl)"> 
		            <img :src="songlist2[2].sImgUrl"
		                 alt="封面" style="height:180px"	>
		                 </a>
		            <div class="caption">
		               <h4>{{songlist2[2].sName}}</h4>
		                <p>{{songlist2[2].sIntro}}</p>
		     
		            </div>
		        </div>
		    </div>
		    <div class="col-sm-6 col-md-3">
		        <div class="thumbnail">
		        <a :href="getSongDetail(songlist2[3].sId,songlist2[3].sUrl,songlist2[3].sImgUrl)"> 
		            <img :src="songlist2[3].sImgUrl"
		                 alt="封面" style="height:180px"	>
		                 </a>
		            <div class="caption">
		                <h4>{{songlist2[3].sName}}</h4>
		                <p>{{songlist2[3].sIntro}}</p>
		     
		            </div>
		        </div>
		    </div>
		</div>
		<!-- 缩略图2end ---------------------------------------------->  
		
		<div style="border-bottom:1.5px solid #C10D0C;"><h4>下载排行榜</h4></div>
		<!-- 排行榜2begin --------------------------------------->
		<div class="panel panel-default">
		  <!-- Default panel contents -->
		  
		</div>
		
		<div id="rank2">
		  <!-- Table -->  
		<table class="table">
		        <thead>
		          <tr>
		            <th>排名</th>
		            <th>歌名</th>
		       		<th>歌手</th>
		       		<th>下载次数</th>
		          </tr>
		        </thead>
		        <tbody>
		          <tr v-for="(item2,index) in songlist2":key="item2.id">
		            <th scope="row">{{index+1}}</th>
		            <td><a :href="getSongDetail(item2.sId,item2.sUrl,item2.sImgUrl)">{{item2.sName}}</a></td>
		            <td><a :href="getSingerDetail(item2.serName,item2.sUrl,item2.sImgUrl)">{{item2.serName}}</a></td>
		            <td>{{item2.sDownload}}</td>
		          </tr>
		 
		        </tbody>
		      </table>
		      </div>
		
		<!-- 排行榜2end --------------------------------------->
		
		 <!-- 缩略图3 begin -->
		
		<div class="row">
		    <div class="col-sm-6 col-md-3">
		        <div class="thumbnail">
		        <a :href="getSongDetail(songlist3[0].sId,songlist3[0].sUrl,songlist3[0].sImgUrl)"> 
		            <img :src="songlist3[0].sImgUrl"
		                 alt="封面" style="height:180px"	>
		                 </a>
		            <div class="caption">
		                <h4>{{songlist3[0].sName}}</h4>
		                <p>{{songlist3[0].sIntro}}</p>
	
		            </div>
		        </div>
		    </div>
		    <div class="col-sm-6 col-md-3">
		        <div class="thumbnail">
		        <a :href="getSongDetail(songlist3[1].sId,songlist3[1].sUrl,songlist3[1].sImgUrl)"> 
		            <img :src="songlist3[1].sImgUrl"
		                 alt="封面" style="height:180px"	>
		                 </a>
		            <div class="caption">
		                <h4>{{songlist3[1].sName}}</h4>
		                <p>{{songlist3[1].sIntro}}</p>
		     
		            </div>
		        </div>
		    </div>
		    <div class="col-sm-6 col-md-3">
		        <div class="thumbnail">
		        <a :href="getSongDetail(songlist3[2].sId,songlist3[2].sUrl,songlist3[2].sImgUrl)"> 
		            <img :src="songlist3[2].sImgUrl"
		                 alt="封面" style="height:180px"	>
		                 </a>
		            <div class="caption">
		               <h4>{{songlist3[2].sName}}</h4>
		                <p>{{songlist3[2].sIntro}}</p>
		     
		            </div>
		        </div>
		    </div>
		    <div class="col-sm-6 col-md-3">
		        <div class="thumbnail">
		        <a :href="getSongDetail(songlist3[3].sId,songlist3[3].sUrl,songlist3[3].sImgUrl)"> 
		            <img :src="songlist3[3].sImgUrl"
		                 alt="封面" style="height:180px"	>
		                 </a>
		            <div class="caption">
		                <h4>{{songlist3[3].sName}}</h4>
		                <p>{{songlist3[3].sIntro}}</p>
		     
		            </div>
		        </div>
		    </div>
		</div>
		<!-- 缩略图3end ----------------------------------------------> 
		
		<!-- 排行榜3begin --------------------------------------->
		<div style="border-bottom:1.5px solid #C10D0C;"><h4>新歌排行榜</h4></div>
		<div class="panel panel-default">
		  <!-- Default panel contents -->
		  
		</div>
		
		<div id="rank3">
		  <!-- Table -->  
		<table class="table">
		        <thead>
		          <tr>
		            <th>排名</th>
		            <th>歌名</th>
		       		<th>歌手</th>
		       		<th>发布时间</th>
		          </tr>
		        </thead>
		        <tbody>
		          <tr v-for="(item3,index) in songlist3":key="item3.id">
		            <th scope="row">{{index+1}}</th>
		            <td><a :href="getSongDetail(item3.sId,item3.sUrl,item3.sImgUrl)">{{item3.sName}}</a></td>
		            <td><a :href="getSingerDetail(item3.serName,item3.sUrl,item3.sImgUrl)">{{item3.serName}}</a></td>
		            <td>{{item3.sIssuetime}}</td>
		          </tr>
		          
		        </tbody>
		      </table>
		</div>
		<!-- 排行榜3end --------------------------------------->
		
	</div>	
	
	<!-- footer --------------------------------------->
	<div style="margin-top:100px ">
<%@ include file="bottom.jsp" %>
</div>




	  
	  
	
<script type="text/javascript">
	//var newsong:[],
	
	
	
	
	var song=new Vue({
		el:'#songRank',
		data:{
				songlist:[],
				songlist2:[],
				songlist3:[],

		},
		created: function (){
			this.getSongList();
			this.getSongList2();
			this.getSongList3();
		},
		methods:{
			
			
			//跳转歌曲详情页
			getSongDetail:function(value,bb,img){
			    return '${APP_path}/detail.jsp?sId='+value+'&'+'sUrl='+bb+'&'+'sImgUrl='+img;
			    
			},
			getSingerDetail:function(value,bb,img){
			    return '${APP_path}/singerdetail.jsp?serName='+value+'&'+'sUrl='+bb+'&'+'sImgUrl='+img;
			},
			
			//获取歌曲相关信息
			getSongList:function(){
				//为了在内部函数能使用外部函数的this对象，要给它赋值了一个名叫comments的变量。 
	      		var songs = this;
	            $.ajax({
	                url: "${APP_path}/songRank",
	                type: 'get',
	                data: "pnumber="+1,
	                dataType: 'json'
	            }).then(function (res) {
	                console.log(res);
	              //把从json获取的数据赋值给数组
	                songs.songlist = res.extend.pageInfo.list;
		             
	            }).fail(function () {
	                console.log('失败');
	            })
			},
			getSongList2:function(){
				//为了在内部函数能使用外部函数的this对象，要给它赋值了一个名叫comments的变量。 
	      		var songs = this;
	            $.ajax({
	                url: "${APP_path}/songRankTwo",
	                type: 'get',
	                data: "pnumber="+1,
	                dataType: 'json'
	            }).then(function (res) {
	                console.log(res);
	              //把从json获取的数据赋值给数组
	                songs.songlist2 = res.extend.pageInfo.list;
		             
	            }).fail(function () {
	                console.log('失败');
	            })
			},
			getSongList3:function(){
				//为了在内部函数能使用外部函数的this对象，要给它赋值了一个名叫comments的变量。 
	      		var songs = this;
	            $.ajax({
	                url: "${APP_path}/songRankThree",
	                type: 'get',
	                data: "pnumber="+1,
	                dataType: 'json'
	            }).then(function (res) {
	                console.log(res);
	              //把从json获取的数据赋值给数组
	                songs.songlist3 = res.extend.pageInfo.list;
		             
	            }).fail(function () {
	                console.log('失败');
	            })
			},
			
			
		}
		
	})

</script>
</body>
</html>