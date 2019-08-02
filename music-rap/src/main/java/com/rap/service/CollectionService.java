package com.rap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rap.bean.CollectionBean;
import com.rap.bean.CollectionBeanExample;
import com.rap.bean.CollectionBeanExample.Criteria;
import com.rap.mapper.CollectionBeanMapper;

@Service
public class CollectionService {

	@Autowired
	CollectionBeanMapper collectionBeanMapper;
	

	
	
	
	//���ղر���Ӽ�¼
	public void saveCollection(CollectionBean collectionBean) {
		// TODO Auto-generated method stub
		collectionBeanMapper.insertSelective(collectionBean);
	}
	 
	
	//��ѯ�����ղر�
	public List<CollectionBean> getAllByUid(Integer usercId) {
	
		
		return collectionBeanMapper.selectByExampleWithUserAndSong(usercId);
		
	}

	//ȡ���ղ�
	public void deletCollection(int repeatcId) {
		// TODO Auto-generated method stub
		collectionBeanMapper.deleteByPrimaryKey(repeatcId);
	}

	



	
}
