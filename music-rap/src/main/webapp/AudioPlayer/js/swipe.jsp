<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>自写jquery轮播图带左右箭头</title>
<style type="text/css">
*{
	margin:0 auto;
	padding:0;
}
ul{
	list-style-type:none;
	}
img{
	border:0;
	}
.branch_bar{
	width:550px;
	height:220px;
	overflow:hidden;
	position:relative;
	}
.branch_bar .branch{
	width:3000px;
	}
.branch_bar .branch li{
	float:left;
	}
.branch_bar .branch li img{
	width:550px;
	height:220px;
	}
.prev{
	position:absolute;
	top:100px;
	left:10px;
	color:#fff;
	cursor:pointer;
	}
.next{
	position:absolute;
	top:100px;
	right:10px;
	color:#fff;
	cursor:pointer;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.0.0.min.js"></script>//温情提示：在IE8及以下的版本可能加载延迟导致错误，请更换自己下载的jquery版本
<script type="text/javascript">
	$(function(){
		var timer = '';
		var branch_len = $('.branch li').length;
		var branch_img_len = $('.branch img').width();
		var branch_img_count_len = parseInt(branch_len * branch_img_len);
		
		$(".next").click(function(){
			if(!$(".branch li:first").is(":animated")){
				$(".branch li:first").animate({'marginLeft':'-=550px'},500,function(){
					$(".branch li:first").css('marginLeft',0);
					$('.branch').append($(".branch li:first"));
				});
			}
		});
		
		$(".prev").click(function(){
			if(!$(".branch li:first").is(":animated")){
				$('.branch').prepend($(".branch li:last"));
				$('.branch li:first').css({'marginLeft':'-550px'});
				$(".branch li:first").animate({'marginLeft':'+=550px'},500,function(){
					$(".branch li:first").css('marginLeft','0px');
				});
			}
		});
		
		timer = setInterval(function(){
			$(".next").click();
		},2000);
		
		$(".branch_bar").mouseenter(function(){
			clearInterval(timer);
		});
		
		$(".branch_bar").mouseleave(function(){
			timer = setInterval(function(){
				$(".next").click();
			},2000)
		});
	});
</script>
</head>
 
<body>
<div class="branch_bar">
    <ul class="branch">
        <li><a href="#" title="">dd<img src="images/banner_small_1.png"></a></li>
        <li><a href="#" title="">dddd<img src="images/banner_small_2.png"></a></li>
        <li><a href="#" title="">ssxx<img src="images/banner_small_3.png"></a></li>
        <li><a href="#" title="">dd<img src="images/banner_small_4.png"></a></li>
    </ul>
    <span class="prev">«向左滚动</span>
    <span class="next">向右滚动»</span>
</div>
</body>
</html>
