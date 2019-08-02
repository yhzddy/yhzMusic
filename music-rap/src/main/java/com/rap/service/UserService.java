package com.rap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rap.bean.CategoryBean;
import com.rap.bean.UserBean;
import com.rap.bean.UserBeanExample;
import com.rap.bean.UserBeanExample.Criteria;
import com.rap.mapper.UserBeanMapper;

@Service
public class UserService {

	@Autowired
	UserBeanMapper userBeanMapper;

	
	/*
	 * 注册验证用户是否存在
	 * */
	
	
	public UserBean findUserByUname(UserBean userBean) {
		 return userBeanMapper.selectByUserName(userBean.getuName());
	}
	
	/*注册
	 * 
	 */
	public boolean register(UserBean userBean) {
		
		return userBeanMapper.insertSelective(userBean);
	}
	
	
	/*
	 * 查询用户所有数据
	 * */
	public List<UserBean> getAll() {
		// TODO Auto-generated method stub
		return userBeanMapper.selectByExample(null);
		
	}
	
	/*
	 * 新增用户数据
	 * */

	public void saveUser(UserBean userBean) {
		// TODO Auto-generated method stub
		userBeanMapper.insertSelective(userBean);
	}
	/*
	 * 删除用户
	 * */
	public void delUser(Integer id) {
		// TODO Auto-generated method stub
		userBeanMapper.deleteByPrimaryKey(id);
	}

	/*
	 * 根据id查询用户数据
	 * */
	public UserBean getUserById(Integer id) {
		// TODO Auto-generated method stub
		UserBean userBean=userBeanMapper.selectByPrimaryKey(id);
		return userBean;
	}

	/*
	 * 修改数据
	 * */
	public void editUser(UserBean userBean) {
		// TODO Auto-generated method stub
		userBeanMapper.updateByPrimaryKeySelective(userBean);
	}
	/*
	 * 登录
	 * */

	public UserBean login(String uName) {
		// TODO Auto-generated method stub
	
		UserBean userBean =userBeanMapper.selectByUserName(uName);
		return userBean;
		
	}

}
