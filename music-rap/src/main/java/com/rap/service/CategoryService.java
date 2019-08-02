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
	 * 查询分类所有数据
	 * */
	public List<CategoryBean> getAll() {
		// TODO Auto-generated method stub
		return categoryBeanMapper.selectByExample(null);
		//System.out.println(categoryBeanMapper.selectByExample());
	}

	/*
	 * 员工保存
	 * */
	public void saveCat(CategoryBean categoryBean) {
		// TODO Auto-generated method stub
		categoryBeanMapper.insertSelective(categoryBean);
		
		
	}
	/*
	 * 校验分类名
	 * 0代表没有重复
	 * 返回true 代表可以用  false 不可用
	 * */
	public boolean checkCatName(String catName) {
		
		
		CategoryBeanExample example=new CategoryBeanExample();
		Criteria criteria = example.createCriteria();
		criteria.andCatNameEqualTo(catName);
		long count =categoryBeanMapper.countByExample(example);
		return count==0;
		// TODO Auto-generated method stub
		
	}

	/*根据ID查询分类名
	 * 
	 * */
	public CategoryBean getCat(Integer id) {
		// TODO Auto-generated method stub
		CategoryBean categoryBean=categoryBeanMapper.selectByPrimaryKey(id);
		return categoryBean;
	}

	/*修改类名 更新
	 * 
	 * */
	public void editCat(CategoryBean categoryBean) {
		// TODO Auto-generated method stub
		categoryBeanMapper.updateByPrimaryKeySelective(categoryBean);
		
	}
	/*删除
	 * 
	 * */
	public void delCat(Integer id) {
		// TODO Auto-generated method stub
		categoryBeanMapper.deleteByPrimaryKey(id);
	}

}
