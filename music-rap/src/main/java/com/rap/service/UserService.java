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
	 * ע����֤�û��Ƿ����
	 * */
	
	
	public UserBean findUserByUname(UserBean userBean) {
		 return userBeanMapper.selectByUserName(userBean.getuName());
	}
	
	/*ע��
	 * 
	 */
	public boolean register(UserBean userBean) {
		
		return userBeanMapper.insertSelective(userBean);
	}
	
	
	/*
	 * ��ѯ�û���������
	 * */
	public List<UserBean> getAll() {
		// TODO Auto-generated method stub
		return userBeanMapper.selectByExample(null);
		
	}
	
	/*
	 * �����û�����
	 * */

	public void saveUser(UserBean userBean) {
		// TODO Auto-generated method stub
		userBeanMapper.insertSelective(userBean);
	}
	/*
	 * ɾ���û�
	 * */
	public void delUser(Integer id) {
		// TODO Auto-generated method stub
		userBeanMapper.deleteByPrimaryKey(id);
	}

	/*
	 * ����id��ѯ�û�����
	 * */
	public UserBean getUserById(Integer id) {
		// TODO Auto-generated method stub
		UserBean userBean=userBeanMapper.selectByPrimaryKey(id);
		return userBean;
	}

	/*
	 * �޸�����
	 * */
	public void editUser(UserBean userBean) {
		// TODO Auto-generated method stub
		userBeanMapper.updateByPrimaryKeySelective(userBean);
	}
	/*
	 * ��¼
	 * */

	public UserBean login(String uName) {
		// TODO Auto-generated method stub
	
		UserBean userBean =userBeanMapper.selectByUserName(uName);
		return userBean;
		
	}

}
