package com.rap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rap.bean.CategoryBean;
import com.rap.bean.SongBean;
import com.rap.bean.SongBeanExample;
import com.rap.bean.SongBeanExample.Criteria;
import com.rap.mapper.SongBeanMapper;

@Service
public class SongService {
	
	@Autowired
	SongBeanMapper songBeanMapper;
	/*
	 * 查询排行榜排序歌曲
	 * */
	public List<SongBean> getByRank() {
		// TODO Auto-generated method stub
		SongBeanExample example=new SongBeanExample();
		example.setOrderByClause("s_playtime DESC");//降序条件 随便传一个值只用来触发mapper
		return songBeanMapper.selectByExampleWithRankOne(example);  //orderbbyclause中的条件
	}
	
	public List<SongBean> getByRankTwo() {
		// TODO Auto-generated method stub
		SongBeanExample example=new SongBeanExample();
		example.setOrderByClause("s_download DESC");//降序条件 随便传一个值只用来触发mapper
		return songBeanMapper.selectByExampleWithRankTwo(example);  //orderbbyclause中的条件
	}
	
	public List<SongBean> getByRankThree() {
		// TODO Auto-generated method stub
		SongBeanExample example=new SongBeanExample();
		example.setOrderByClause("s_issuetime DESC");//降序条件 随便传一个值只用来触发mapper
		return songBeanMapper.selectByExampleWithRankThree(example);  //orderbbyclause中的条件
	}
	
	/*
	 * 查询所有歌曲信息
	 * */
	public List<SongBean> getAllSong() {
		// TODO Auto-generated method stub
		return songBeanMapper.selectByExampleWithCat(null);
	}
	/*
	 *上传歌曲 
	 * */
	public void uploadSong(SongBean songbean) {
		// TODO Auto-generated method stub
		 songBeanMapper.insertSelective(songbean);
	}
	/*删除歌曲相关信息
	 * 
	 * */
	public void delSong(Integer id) {
		// TODO Auto-generated method stub
		songBeanMapper.deleteByPrimaryKey(id);
		
	}
	/*编辑按钮的时候根据ID来查询相关信息
	 * 
	 * */
	
	public SongBean getSongById(Integer id) {
		// TODO Auto-generated method stub
		SongBean songBean=songBeanMapper.selectByPrimaryKeyWithCat(id);
		return songBean;
	}
	/*编辑内容 更新
	 * 
	 * */
	public void editSong(SongBean songBean) {
		// TODO Auto-generated method stub
		songBeanMapper.updateByPrimaryKeySelective(songBean);
		
	}

	/*模糊查询
	 * 
	 * */
	public List<SongBean> selectLike(String sName) {
		
		// TODO Auto-generated method stub
		System.out.println("huoqu222"+sName);
		SongBeanExample example=new SongBeanExample();
		Criteria criteria=example.createCriteria();
		sName="%"+sName+"%";
		criteria.andSNameLike(sName);
		List<SongBean> list = songBeanMapper.selectByExample(example);
		System.out.println("huoqu33333"+list.toString());
		return list;
	}

	/*根据歌手名查询
	 * 
	 * */
	public List<SongBean> getSongBySerName(String serName) {
		// TODO Auto-generated method stub
		SongBeanExample example=new SongBeanExample();
		Criteria criteria=example.createCriteria();
		criteria.andSerNameEqualTo(serName);
		List<SongBean> list=songBeanMapper.selectByExampleWithCat(example);
		System.out.println("歌手"+list.toString());
		return list;
	}
	
	/*根据专辑名查询
	 * 
	 * */
	public List<SongBean> getSongByAlbmName(String albmName) {
		// TODO Auto-generated method stub
		SongBeanExample example=new SongBeanExample();
		Criteria criteria=example.createCriteria();
		criteria.andAlbmNameEqualTo(albmName);
		List<SongBean> list=songBeanMapper.selectByExampleWithCat(example);
		System.out.println("专辑"+list.toString());
		return list;
	}

	/*查询所有专辑
	 * 
	 * */
	public List<SongBean> getAblmlist() {
		// TODO Auto-generated method stub
		return  songBeanMapper.selectByExampleWithAblm(null);
		
	}

	
	
	
}
