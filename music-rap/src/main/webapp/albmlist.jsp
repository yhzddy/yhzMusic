<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>专辑页面</title>
<% 
pageContext.setAttribute("APP_path",request.getContextPath());

%>
	<script type="text/javascript" src="${APP_path}/static/js/jquery-3.0.0.min.js"></script>
	<script type="text/javascript" src="${APP_path}/static/js/vue.min.js"></script>
	<link href="${APP_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="${APP_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<style>

#middle{
	margin-top: 30px;
}

.ui{
                 
                 height:266px;
                 list-style: none;
                 margin:0 80px;
                 padding:0;
                 
             }
        .ui li{
           
               margin:0 10px;
              
              
               padding-bottom: 44px;
               display:inline-block;     
        }
        a{
        color: gray;
        text-decoration:none;
        }
        
        .item_box{
        position: relative;
    	margin-right: 20px;
    	
    	
    	}
    	.playlist__title {
    		overflow: hidden;
		}
		.playlist__title_txt {
    	float: left;
    	max-width: 100%;
   	 	font-weight: 400;
    	overflow: hidden;
    	text-overflow: ellipsis;
    	line-height: 22px;
    	max-height: 44px;
}
		
 .playlist__author {
    color: #999;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    height: 22px;
}	
 .playlist__other {
    color: #999;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    height: 22px;
}
		.rows{
		
		margin-left: 80px;
		}
		
</style>
	
</head>
<body>
	<!-- 导航条begin --------------------------------------->
	<%@include file="top.jsp" %>
	<!-- 导航条end --------------------------------------->
	<div id="selectdetail" style="width: 90%; margin: 0 auto; border-left:solid 2px #E5E5E5;border-right:solid 2px #E5E5E5 ;background: #EDEDED" >
			<div class="panel panel-default">
				<h3 style="padding-left: 10px">全部专辑</h3>
		 		 <div class="panel-heading" style="height: 45px;padding-left: 10px; padding-top: 20px">显示</div>
			</div>
	
	<div id="middle">
	
		<ul class="ui" v-for="(row,i) in listTemp">
			<li v-for="(cell,j) in row">
			
				<div id="'T_'+(i*5+j)" class="item_box">
					<a href="#">
						<img v-bind:src="cell.sImgUrl" style="width: 164px;height: 164" alt="封面">
					</a>
					<h4 class="playlist__title">
						<span class="playlist__title_txt">
							<a :href="getAlbmDetail(cell.serName,cell.albmName,cell.sImgUrl)" style="color:black;">{{cell.albmName}}</a>
						</span>
					</h4>
					<div class="playlist__author">
						<a :href="getSingerDetail(cell.serName,cell.sUrl,cell.sImgUrl)">{{cell.serName}}</a>
					</div>
					<div class="playlist__other">{{cell.sIssuetime}}</div>
				</div>
			</li>			
		</ul>
	
		<!-- 显示分页信息栏 -->
			<div class="rows">
			<!-- 分页信息 -->
				<div class="col-md-7" id="page_info_area">			
						<p>当前第{{pageinfo.pageNum}}页,总{{pageinfo.pages}}页 ,总{{pageinfo.total}}记录</p>
				</div>
			<!-- 分页条 -->
				<div class="col-md-5" id="page_nav_area" >
				
				<nav aria-label="Page navigation">
						  <ul class="pagination">
						  <li><a href="javascript:void(0);" v-on:click="getAblmList(1)">首页</a></li>
						    <li>
						      <a href="javascript:void(0);" v-on:click="getAblmList(pageinfo.pageNum-1)" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						  
						    <li v-for="(item,index) in navigatepageNums" v-bind:class="item==pageinfo.pageNum?'active':'none'">				
						    		<a href="javascript:void(0);" v-on:click="getAblmList(item)">{{item}}</a>
						    </li>
						  
						    
						    <li>
						      <a href="javascript:void(0);" v-on:click="getAblmList(pageinfo.pageNum+1)" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						     <li><a href="javascript:void(0);" v-on:click="getAblmList(pageinfo.pages)">末页</a></li>
						  </ul>
						</nav>
				</div>
			</div>
	
	</div>
	</div>
	
	
	<script type="text/javascript">
	
	var abl=new Vue({
		el:'#middle',
		data:{
			
				albmlist:[],
				navigatepageNums:[],
				pageinfo:[],
		
		},
		created: function (){
			this.getAblmList(1);
			
		},
		methods:{
			//跳转歌曲详情页
			getSongDetail:function(value,bb,img){
			    return '${APP_path}/detail.jsp?sId='+value+'&'+'sUrl='+bb+'&'+'sImgUrl='+img;
			    
			},
			getSingerDetail:function(value,bb,img){
			    return '${APP_path}/singerdetail.jsp?serName='+value+'&'+'sUrl='+bb+'&'+'sImgUrl='+img;
			},
			
			getAlbmDetail:function(value,bb,img){
			    return '${APP_path}/albmdetail.jsp?serName='+value+'&'+'albmName='+bb+'&'+'sImgUrl='+img;
			},
		
			
			//获取歌曲相关信息
			getAblmList:function(id){
				//为了在内部函数能使用外部函数的this对象，要给它赋值了一个名叫comments的变量。 
	      		var songs = this;
				
	      		var arrTemp = [];
	      		 var sectionCount = 5;
	            $.ajax({
	                url: "${APP_path}/ablmlist",
	                type: 'get',
	                data: "pnumber="+id,
	                dataType: 'json'
	            }).then(function (res) {
	                console.log(res);
	              //把从json获取的数据赋值给数组
	                songs.albmlist = res.extend.pageInfo.list;
	              	songs.pageinfo = res.extend.pageInfo
	                songs.navigatepageNums = res.extend.pageInfo.navigatepageNums;
		             
	            }).fail(function () {
	                console.log('失败');
	            })
			},
		
			
		},
		
		computed:{ 
			listTemp: function () {  
                var list = this.albmlist;  
                var arrTemp = [];  
                var index = 0;  
                var sectionCount = 5;  
                for (var i = 0; i < list.length; i++) {  
                    index = parseInt(i / sectionCount);  
                    if (arrTemp.length <= index) {  
                        arrTemp.push([]);  
                    }  
                    arrTemp[index].push(list[i]);  
                }  
                return arrTemp;  
            }  
		}
	})
	
	</script>
</body>
</html>