package com.rap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rap.bean.CollectionBean;
import com.rap.bean.Msg;
import com.rap.service.CollectionService;

@Controller
public class CollectionController {

	@Autowired
	CollectionService collectionService;
	
	/*查询该页面是否被收藏
	
	*/
	@ResponseBody
	@RequestMapping(value="/getcollection",method=RequestMethod.GET)
	public Msg getCollection(@RequestParam(value="usercId")Integer usercId,@RequestParam(value="songcId")Integer songcId) {
		CollectionBean collectionBean=new CollectionBean();
		List<CollectionBean> clist =collectionService.getAllByUid(usercId);
		int selected = 0;
		String imgpath="img/icons-hcollect.png";
		
		if(clist!=null) {
			for(int i=0;i<clist.size();i++) {
				if(songcId==clist.get(i).getSongcId()) {
					selected = 1;  //给黑图
					break;
				}else {
					selected = 0;				}//白图
			}
		}else {//如果该用户收藏版一条都没有 执行收藏			
			selected = 0;			
		}
		
		if(selected==1) {
			 imgpath="img/icons-hcollect.png";
		}
		
		if(selected==0) {
			 imgpath="img/icons-collect.png";
		}
		
		
		return Msg.success().add("imgpath", imgpath).add("selected", selected);
	}
	
	
	
	/*向收藏表添加纪录 并判断是否已存在
	
	*/
	@ResponseBody
	@RequestMapping(value="/collect",method=RequestMethod.POST)
	public Msg saveCollection(@RequestParam(value="usercId")Integer usercId,@RequestParam(value="songcId")Integer songcId) {
		System.out.println(usercId);
		CollectionBean collectionBean=new CollectionBean();
		int message = 1;
		int repeatcId=0;
		List<CollectionBean> clist =collectionService.getAllByUid(usercId);
		if(clist!=null) {
			for(int i=0;i<clist.size();i++) {
				if(songcId==clist.get(i).getSongcId()) {//如果收藏表已存在 取消收藏
					message = 0;
					repeatcId=clist.get(i).getCollId();
					break;
				}else {//如果都判断与歌曲id不相等 执行收藏  不等于就插入了一次 有多条等于就插入了多次
					message = 1;				}
			}
		}else {//如果该用户收藏版一条都没有 执行收藏			
			message = 1;			
		}
		//循环结束再进行判断
		if(message==1) {
			collectionBean.setSongcId(songcId);
			collectionBean.setUsercId(usercId);
			collectionService.saveCollection(collectionBean);
		}
		
		if(message==0) {
			collectionService.deletCollection(repeatcId);
		}
		
		
		
		return Msg.success().add("mesg", message);
	}
	
	
	/*查询个人收藏表
	
	*/
	
	@ResponseBody
	@RequestMapping(value="/collects",method=RequestMethod.GET)
	public Msg getAllByUid(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber,@RequestParam(value="ucid")Integer usercId) {
		PageHelper.startPage(pnumber, 20);
		List<CollectionBean> clist=collectionService.getAllByUid(usercId);
		PageInfo page = new PageInfo(clist,5);//5是传入连续显示的页数
		return Msg.success().add("pageInfo", page);
		
	}
}
