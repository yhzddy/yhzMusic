package com.rap.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rap.bean.CategoryBean;
import com.rap.bean.CommentBean;
import com.rap.bean.Msg;
import com.rap.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
	/*
	 * 查询评论的数据(分页查询)
	 * 导入jackson包
	 * @ResponseBody 直接将返回类型转化为json类型   json适合多种不同终端
	 * */
	
	@RequestMapping("/comments")
	@ResponseBody
	public Msg getCommentWithJson(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber,@RequestParam("songId") Integer songId) {
		
		//引入PageHelper分页插件
		//在查询之前只需要调用 传入页码 以及分页大小
		PageHelper.startPage(pnumber, 5);
		//startpage后面紧跟的这个查询就是分页查询
		List<CommentBean> comments =commentService.getAllComment(songId);
		//使用pageinfo包装查询的结果，只需要将pageinfo交给页面就行了
		//封装了详细的分页信息，包括了我们查询出来的数据
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 //for( int i = 0; i < comments.size(); i++){  
         	//sites[i].cmtContent=sdf.format(sites[i].cmtContent);
			 
			// comments.get(i).getCmtDate()=sdf.format(comments.get(i).getCmtDate());
         	
        // } 
		PageInfo page = new PageInfo(comments,5);//5是传入连续显示的页数
		return Msg.success().add("pageInfo", page);
		
	}
	
	/*
	 * 用户添加评论
	 * */
	@RequestMapping(value="/commentadd",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveComment(CommentBean commentBean) {
		
		commentService.saveComment(commentBean);
		return Msg.success();
	}
}
