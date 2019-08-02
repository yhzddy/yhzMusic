package com.rap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rap.bean.CategoryBeanExample;
import com.rap.bean.CommentBean;
import com.rap.bean.CommentBeanExample;
import com.rap.bean.CommentBeanExample.Criteria;
import com.rap.mapper.CommentBeanMapper;


@Service
public class CommentService {

	@Autowired
	CommentBeanMapper commentBeanMapper;
	
	/*
	 * 查询一首歌id的评论表所有数据
	 * */
	
	public List<CommentBean> getAllComment(Integer songId) {
		// TODO Auto-generated method stub
		CommentBeanExample example=new CommentBeanExample();
		example.setOrderByClause("cmt_id DESC");
		Criteria criteria=example.createCriteria();
		criteria.andSongIdEqualTo(songId);
		return commentBeanMapper.selectByExampleWithUser(example);
	}

	public void saveComment(CommentBean commentBean) {
		// TODO Auto-generated method stub
		commentBeanMapper.insertSelective(commentBean);
		
	}

}
