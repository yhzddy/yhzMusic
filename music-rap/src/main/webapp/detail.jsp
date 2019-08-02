<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.rap.bean.UserBean" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>详情页</title>
<% 
pageContext.setAttribute("APP_path",request.getContextPath());
int value=Integer.parseInt(request.getParameter("sId"));//取地址的参数id和歌曲和封面地址
String urrl=request.getParameter("sUrl");
String imgurrl=request.getParameter("sImgUrl");
UserBean userdetail=(UserBean)request.getSession().getAttribute("usersession");

System.out.print(value);
System.out.print(urrl);

%>

    <style>
        .test{
            height: auto;
            margin: 0 auto;
            width:70%;
        }
        
	body{
		background:#fff url(img/otherback.jpg) repeat left top;
  		background-size:100%
		}


    </style>
    <script type="text/javascript" src="${APP_path}/static/js/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" src="${APP_path}/static/js/vue.min.js"></script>
	<link href="${APP_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="${APP_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	
	
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:400,700" />
		<link rel="shortcut icon" href="../favicon.ico">
	
		<link rel="stylesheet" href="detail.css">
			
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
	<body>
	<!-- 导航条begin --------------------------------------->
		<%@ include file="../top.jsp" %>
<!-- 导航条end --------------------------------------->

<!-- 音乐界面--------------------------------------->
	<div id="musicdetail" style="width: 60%; margin: 0 auto; border-left:solid 2px #E5E5E5;border-right:solid 2px #E5E5E5 ;background: #EDEDED">
		<div id="musicdetail-left" style="width:50%; float:left ">
			<p>&nbsp;&nbsp;</p>
			<a href="#">
      <img src="<%=imgurrl%>" class="media-object"  style="margin-left:20px;width: 175px;height: 177px; border:2px solid white" src="<%=imgurrl%>" alt="封面" >
     
    </a>
		</div>
		<div id="musicdetail-right" style="width:50%; float:left" >
		<h3>单曲：{{songdata.sName}}</h3>
		<p style="padding-left: 70px;color: gray;">{{songdata.sIntro}}</p>
			<p><img src="img/icons-musician.png">：<a :href="getSingerDetail(songdata.serName,songdata.sUrl,songdata.sImgUrl)">{{songdata.serName}}</a></p>
			
			<p>专辑：{{songdata.albmName}}</p>
			<p>流派：{{songdata.categoryBean.catName}}</p>
  			
  			<a href="javascript:void(0);" v-on:click="collecSong(<%=userdetail.getuId()%>,<%=value%>)"><img :src="collectimg">收藏</a>
  		</div>
					
			<div id="wrapper" style="display:inline-block;">		
			<div style="float: left;">	
				<audio id="myAudio" controlsList="nodownload" preload="auto" controls onended="myPlay()">
					<source src="<%=urrl%>">
				</audio>
				</div>
			<div style="float: left; padding-top: 15px; margin-left: 20px">
			<a id="down" href="<%=urrl%>" :download="songdata.sName" onclick="myDown()" >
				<span class="glyphicon glyphicon-save" aria-hidden="true"></span> 下载
			</a>
			</div>
			</div>	
		</div>	
			
<!-- comment begin-->


<hr />
<div id="comment">
<div class="test" id="comment-content">
	<div>评论 </div>
    <div lang="en-US" >
        
         <div class="gitment-comment">
                <a class="gitment-comment-avatar">
                    <img class="gitment-comment-avatar-img" src="img/人像icon.jpg">
                </a>
            <div class="gitment-comment-main">
                <div class="gitment-editor-body">
                    <textarea id="comment_insert_textarea" placeholder="发表评论"  v-model="pcontent"></textarea>
                </div>

            </div>
            </div>
        
        <div class="gitment-editor-footer">
            <button id="comment-sumbit" class="gitment-editor-submit" title="Login to Comment" @click="addData(<%=userdetail.getuId()%>)">评论</button>
        </div>
    </div>
    
<!-- comment-list begin-->

    <div id="comment-list" lang="en-US" class="gitment-container gitment-comments-container">
  	<div>精彩评论 </div>
  	<div >
    <table >

        <ul class="gitment-comments-list" v-for="(site,index) in sites":key="site.cmtId" style="background-color: white;" >
       	 <li class="gitment-comment">
                <a class="gitment-comment-avatar">
                    <img class="gitment-comment-avatar-img" src="img/人像icon.jpg">
                </a>
          <div class="gitment-comment-main">
           <div class="gitment-comment-header">  
            	用户：<a class="gitment-comment-name" v-text="site.userBean.uName"></a>
            日期：<span>{{site.cmtDate}}</span>                     		
                    </div>
            
            <div class="gitment-comment-body gitment-markdown" v-text="site.cmtContent" ></div>
            </li>
        </ul>
        
    </table>
 </div>
 
 				<!-- 显示分页信息栏 -->
			<div class="rows">
			<!-- 分页信息 -->
				<div class="col-md-5" id="page_info_area">			
						<p>当前第{{pageinfo.pageNum}}页,总{{pageinfo.pages}}页 ,总{{pageinfo.total}}记录</p>
				</div>
			<!-- 分页条 -->
				<div class="col-md-6" id="page_nav_area" >
				
				<nav aria-label="Page navigation">
						  <ul class="pagination">
						  <li><a href="javascript:void(0);" v-on:click="getList(1)">首页</a></li>
						    <li>
						      <a href="javascript:void(0);" v-on:click="getList(pageinfo.pageNum-1)" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						  
						    <li v-for="(item,index) in navigatepageNums" v-bind:class="item==pageinfo.pageNum?'active':'none'">				
						    		<a href="javascript:void(0);" v-on:click="getList(item)">{{item}}</a>
						    </li>
						  
						    
						    <li>
						      <a href="javascript:void(0);" v-on:click="getList(pageinfo.pageNum+1)" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						     <li><a href="javascript:void(0);" v-on:click="getList(pageinfo.pages)">末页</a></li>
						  </ul>
						</nav>
				</div>
			</div>
    </div>
</div>


</div>

<!-- comment end -->



<script type="text/javascript">
	 //定义歌曲id 播放次数 更新star次数 下载次数 全局变量
	 var sid=<%=Integer.parseInt(request.getParameter("sId"))%>; 
	 var uuid=<%=userdetail.getuId()%>;
	var times;  
	 var start;
	 var downtime;
	 var downtimes;
	 start=times;
	 //更新播放次数
	function myPlay() {
	   		 start=times;
	   		 start++;
	   		    
	   		    $.ajax({
	   				url:"${APP_path}/songtime",
	   				type:"POST",
	   				async:false,
	   				data:{"sPlaytime":start,"sId":sid,"_method": "PUT"},
	   				success:function(result){
	   					console.log("更新播放次数"+start);
	   				}
	   			});
	   		    
	   		    alert("音乐已播放结束");
	   		}
	 
	 //更新下载次数
	 
	 function myDown(){
			downtimes=downtime;
			downtimes++;
			$.ajax({
				url:"${APP_path}/songtime",
				type:"POST",
				data:{"sDownload":downtimes,"sId":sid,"_method": "PUT"},
				success:function(result){
				console.log("更新下载次数"+downtimes);
				}
			});
		alert("开始下载");
	}
	 
	 
	 console.log('歌曲id'+sid);
	 //查询歌曲相关信息
	var songls=new Vue({
		el: '#musicdetail',
		data: {
			//ssid:sid
	        songdata:[],
	        collectimg:'',
	       
	    },
	    created: function () {
	    	
	    	this.getSonglist(sid);//之前报了个错误 函数没引用  少加了this
	    	this.getCollection(uuid,sid)
	    },
	    methods:{
	    	
	    	//跳转歌手详情页
	    	getSingerDetail:function(value,bb,img){
			    return '${APP_path}/singerdetail.jsp?serName='+value+'&'+'sUrl='+bb+'&'+'sImgUrl='+img;
			},
	    	//查询相关id的歌曲信息
	    	getSonglist:function(id){
	    		console.log("huoqu"+id);
	    		var songdetail = this;
	    		$.ajax({
	    			url:"${APP_path}/song/"+id,
	    			type:'get',
	    			async:false,
	    		}).then(function(res){
	    			console.log(res);
	    			songdetail.songdata=res.extend.song;	
	    			times=res.extend.song.sPlaytime;
	    			downtime=res.extend.song.sDownload;
	    			console.log('读取播放次数'+times);
	    			console.log('读取下载次数'+downtime);
	    		}).fail(function(res){
	    			console.log('失败');
	    		})
	    	},
		    	
	    	//查询收藏
	    	getCollection:function(id,sid){
	    		var imgcoll = this;
	    		$.ajax({
	    			url:"${APP_path}/getcollection",
	    			data: {"usercId":id,"songcId":sid},
	    			type:'get',
	    			dataType: 'json',
	    		}).then(function(res){
	    			console.log("ddd"+res);
	    			 if(res.extend.selected==1){
	    				 imgcoll.collectimg=res.extend.imgpath;
	    				 console.log("imgpath"+collectimg);
	    			}else{
	    				imgcoll.collectimg=res.extend.imgpath;
	    				console.log("imgpath"+collectimg);
	    			} 
	    			
	    		}).fail(function(res){
	    			console.log('失败');
	    		})
	    	},
	    	
	    	//添加收藏方法 在收藏表增加
	    	collecSong:function(id,sid){
	    		var that=this;
	    		$.ajax({
	    			url:"${APP_path}/collect",
	    			data: {"usercId":id,"songcId":sid},
	    			type:'post',
	    			dataType: 'json',
	    		}).then(function(res){
	    			console.log(res);
	    			 if(res.extend.mesg==1){
	    				alert("收藏音乐成功");
	    				
	    			}else{
	    				alert("取消收藏成功");
	    				
	    			} 
	    			 that.getCollection(id,sid);
	    			 
	    		}).fail(function(res){
	    			console.log('失败');
	    		})
	    	},
	    	
	    	
	    }
	}) 
 //评论
var comm=new Vue({
    el: '#comment',
    data: {
        sites: [],
        pcontent:"",
        navigatepageNums:[],
        pageinfo:[],
       // uname:[],
    },
    created: function () {
    	
    	this.getList(1);
    	
    },
    methods:{
    	getList:function(pid){
    		//为了在内部函数能使用外部函数的this对象，要给它赋值了一个名叫comments的变量。 
      		var comments = this;
      		
            $.ajax({
                url: "${APP_path}/comments",
                type: 'get',
                data: {"songId":sid,"pnumber":pid},
                dataType: 'json',
            }).then(function (res) {
                console.log(res);
              //把从json获取的数据赋值给数组
                comments.sites = res.extend.pageInfo.list;
                comments.pageinfo = res.extend.pageInfo
                comments.navigatepageNums = res.extend.pageInfo.navigatepageNums;
	             
            }).fail(function () {
                console.log('失败');
            })
    	},
    	
    	addData:function (uid) {
    		var commcontent	=$("#comment_insert_textarea").val();
    		var that=this;
    		var mydate = new Date();
    		$.ajax({
    			url:"${APP_path}/commentadd",
    			type: 'post',
    			data: {"cmtContent":this.pcontent,"songId":sid,"userId":uid,"cmtDate":mydate},
    			dataType: 'json'
    		}).then(function (res) {
    			if(res!=0)
                {
    				
    				that.pcontent="";
    				alert("评论成功");
    				console.log(res);    			
    				that.getList(1);  				   			
                }
                console.log(res);
                //this.pcontent="";
                //this.getList();//局部刷新一下
            }).fail(function () {
            	alert("评论失败");
                console.log('失败');
            	})
    		}
    	} 
})


</script>
	

	</body>
</html>