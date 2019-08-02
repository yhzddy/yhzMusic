package com.rap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rap.bean.CategoryBean;
import com.rap.bean.CategoryBeanExample;
import com.rap.bean.CategoryBeanExample.Criteria;
import com.rap.mapper.CategoryBeanMapper;

@Service
public class CategoryService {
	
	@Autowired
	CategoryBeanMapper categoryBeanMapper;
	
	/*
	 * ��ѯ������������
	 * */
	public List<CategoryBean> getAll() {
		// TODO Auto-generated method stub
		return categoryBeanMapper.selectByExample(null);
		//System.out.println(categoryBeanMapper.selectByExample());
	}

	/*
	 * Ա������
	 * */
	public void saveCat(CategoryBean categoryBean) {
		// TODO Auto-generated method stub
		categoryBeanMapper.insertSelective(categoryBean);
		
		
	}
	/*
	 * У�������
	 * 0����û���ظ�
	 * ����true ���������  false ������
	 * */
	public boolean checkCatName(String catName) {
		
		
		CategoryBeanExample example=new CategoryBeanExample();
		Criteria criteria = example.createCriteria();
		criteria.andCatNameEqualTo(catName);
		long count =categoryBeanMapper.countByExample(example);
		return count==0;
		// TODO Auto-generated method stub
		
	}

	/*����ID��ѯ������
	 * 
	 * */
	public CategoryBean getCat(Integer id) {
		// TODO Auto-generated method stub
		CategoryBean categoryBean=categoryBeanMapper.selectByPrimaryKey(id);
		return categoryBean;
	}

	/*�޸����� ����
	 * 
	 * */
	public void editCat(CategoryBean categoryBean) {
		// TODO Auto-generated method stub
		categoryBeanMapper.updateByPrimaryKeySelective(categoryBean);
		
	}
	/*ɾ��
	 * 
	 * */
	public void delCat(Integer id) {
		// TODO Auto-generated method stub
		categoryBeanMapper.deleteByPrimaryKey(id);
	}

}
