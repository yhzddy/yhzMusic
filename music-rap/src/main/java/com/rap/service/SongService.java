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
	 * ��ѯ���а��������
	 * */
	public List<SongBean> getByRank() {
		// TODO Auto-generated method stub
		SongBeanExample example=new SongBeanExample();
		example.setOrderByClause("s_playtime DESC");//�������� ��㴫һ��ֵֻ��������mapper
		return songBeanMapper.selectByExampleWithRankOne(example);  //orderbbyclause�е�����
	}
	
	public List<SongBean> getByRankTwo() {
		// TODO Auto-generated method stub
		SongBeanExample example=new SongBeanExample();
		example.setOrderByClause("s_download DESC");//�������� ��㴫һ��ֵֻ��������mapper
		return songBeanMapper.selectByExampleWithRankTwo(example);  //orderbbyclause�е�����
	}
	
	public List<SongBean> getByRankThree() {
		// TODO Auto-generated method stub
		SongBeanExample example=new SongBeanExample();
		example.setOrderByClause("s_issuetime DESC");//�������� ��㴫һ��ֵֻ��������mapper
		return songBeanMapper.selectByExampleWithRankThree(example);  //orderbbyclause�е�����
	}
	
	/*
	 * ��ѯ���и�����Ϣ
	 * */
	public List<SongBean> getAllSong() {
		// TODO Auto-generated method stub
		return songBeanMapper.selectByExampleWithCat(null);
	}
	/*
	 *�ϴ����� 
	 * */
	public void uploadSong(SongBean songbean) {
		// TODO Auto-generated method stub
		 songBeanMapper.insertSelective(songbean);
	}
	/*ɾ�����������Ϣ
	 * 
	 * */
	public void delSong(Integer id) {
		// TODO Auto-generated method stub
		songBeanMapper.deleteByPrimaryKey(id);
		
	}
	/*�༭��ť��ʱ�����ID����ѯ�����Ϣ
	 * 
	 * */
	
	public SongBean getSongById(Integer id) {
		// TODO Auto-generated method stub
		SongBean songBean=songBeanMapper.selectByPrimaryKeyWithCat(id);
		return songBean;
	}
	/*�༭���� ����
	 * 
	 * */
	public void editSong(SongBean songBean) {
		// TODO Auto-generated method stub
		songBeanMapper.updateByPrimaryKeySelective(songBean);
		
	}

	/*ģ����ѯ
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

	/*���ݸ�������ѯ
	 * 
	 * */
	public List<SongBean> getSongBySerName(String serName) {
		// TODO Auto-generated method stub
		SongBeanExample example=new SongBeanExample();
		Criteria criteria=example.createCriteria();
		criteria.andSerNameEqualTo(serName);
		List<SongBean> list=songBeanMapper.selectByExampleWithCat(example);
		System.out.println("����"+list.toString());
		return list;
	}
	
	/*����ר������ѯ
	 * 
	 * */
	public List<SongBean> getSongByAlbmName(String albmName) {
		// TODO Auto-generated method stub
		SongBeanExample example=new SongBeanExample();
		Criteria criteria=example.createCriteria();
		criteria.andAlbmNameEqualTo(albmName);
		List<SongBean> list=songBeanMapper.selectByExampleWithCat(example);
		System.out.println("ר��"+list.toString());
		return list;
	}

	/*��ѯ����ר��
	 * 
	 * */
	public List<SongBean> getAblmlist() {
		// TODO Auto-generated method stub
		return  songBeanMapper.selectByExampleWithAblm(null);
		
	}

	
	
	
}
