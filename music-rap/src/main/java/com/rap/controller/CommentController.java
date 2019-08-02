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
	 * ��ѯ���۵�����(��ҳ��ѯ)
	 * ����jackson��
	 * @ResponseBody ֱ�ӽ���������ת��Ϊjson����   json�ʺ϶��ֲ�ͬ�ն�
	 * */
	
	@RequestMapping("/comments")
	@ResponseBody
	public Msg getCommentWithJson(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber,@RequestParam("songId") Integer songId) {
		
		//����PageHelper��ҳ���
		//�ڲ�ѯ֮ǰֻ��Ҫ���� ����ҳ�� �Լ���ҳ��С
		PageHelper.startPage(pnumber, 5);
		//startpage��������������ѯ���Ƿ�ҳ��ѯ
		List<CommentBean> comments =commentService.getAllComment(songId);
		//ʹ��pageinfo��װ��ѯ�Ľ����ֻ��Ҫ��pageinfo����ҳ�������
		//��װ����ϸ�ķ�ҳ��Ϣ�����������ǲ�ѯ����������
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 //for( int i = 0; i < comments.size(); i++){  
         	//sites[i].cmtContent=sdf.format(sites[i].cmtContent);
			 
			// comments.get(i).getCmtDate()=sdf.format(comments.get(i).getCmtDate());
         	
        // } 
		PageInfo page = new PageInfo(comments,5);//5�Ǵ���������ʾ��ҳ��
		return Msg.success().add("pageInfo", page);
		
	}
	
	/*
	 * �û��������
	 * */
	@RequestMapping(value="/commentadd",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveComment(CommentBean commentBean) {
		
		commentService.saveComment(commentBean);
		return Msg.success();
	}
}
