<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索详情页</title>
<% 
pageContext.setAttribute("APP_path",request.getContextPath());

%>
 <script type="text/javascript" src="${APP_path}/static/js/jquery-3.0.0.min.js"></script>
 <script type="text/javascript" src="${APP_path}/static/js/vue.min.js"></script>
 <link href="${APP_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="${APP_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%
   // request.setCharacterEncoding("utf-8");//当页面一传递的值是中文时，在页面二可能显示乱码，加上这段代码以后可以正常显示中文。
    //String songName = request.getParameter("songName");
    String songName=request.getParameter("songName");
    System.out.print(songName);
%>
<!-- 导航条begin --------------------------------------->
<%@ include file="top.jsp" %>
            			 
 <!-- 详情页begin --------------------------------------->           			 
         
		<div id="selectdetail" style="width: 70%; margin: 0 auto; border-left:solid 2px #E5E5E5;border-right:solid 2px #E5E5E5 ;background: #EDEDED" >
			<div class="panel panel-default">
				<h3 style="padding-left: 10px">搜索结果</h3>
		 		 <div class="panel-heading" style="height: 45px;padding-left: 10px; padding-top: 20px">搜索:"<%=songName %>"</div>
			</div>
		  <!-- Table -->  
		<table class="table">
		        <thead>
		          <tr>
		          <th></th>	
		            <th>歌名</th>
		            <th>歌手</th>
		       		<th>专辑</th>
		       		<th>收听次数</th>
		          </tr>
		        </thead>
		        <tbody>
		          <tr v-for="(item,index) in songlist":key="item.sId">
		            <th scope="row">{{index+1}}</th>
		            <td><a :href="getSongDetail(item.sId,item.sUrl,item.sImgUrl)">{{item.sName}}</a></td>
		            <td><a :href="getSingerDetail(item.serName,item.sUrl,item.sImgUrl)">{{item.serName}}</a></td>
		            <td><a :href="getAlbmDetail(item.serName,item.albmName,item.sImgUrl)">{{item.albmName}}</a></td>
		            <td>{{item.sPlaytime}}</td>
		          </tr>
		 
		        </tbody>
		      </table>
		   </div> 	 
            			 
            			 <script type="text/javascript">
            			 
            			
            			 var sname='<%=request.getParameter("songName")%>';
            			 
            			 
            			 
            			 console.log(sname);
            			 
            			 var songss=new Vue({
            					el:'#selectdetail',
            					data:{
            							songlist:[],
            							

            					},
            					created: function (){
            						this.getSongList(sname);
            						
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
            						getSongList:function(name){
            							//为了在内部函数能使用外部函数的this对象，要给它赋值了一个名叫comments的变量。 
            				      		var songs = this;
            				            $.ajax({
            				                url: "${APP_path}/songSelect",
            				                type: 'get',
            				                data: {"pnumber":1,"sName":name},
            				                dataType: 'json'
            				            }).then(function (res) {
            				                console.log(res);
            				              //把从json获取的数据赋值给数组
            				                songs.songlist = res.extend.pageInfo.list;
            					             
            				            }).fail(function () {
            				                console.log('失败');
            				            })
            						},
            						
 
            						
            					}
            				})
            			 
            			 </script>
</body>


</html>