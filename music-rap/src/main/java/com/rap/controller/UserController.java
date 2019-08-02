package com.rap.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rap.bean.CategoryBean;
import com.rap.bean.Msg;
import com.rap.bean.UserBean;
import com.rap.service.UserService;
import com.rap.util.Md5;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	
	
	
	 /*
		 * ����Ա��¼��֤
		 * */
		@ResponseBody
		@RequestMapping(value="/validadmin",method=RequestMethod.POST)
		public int validAdmin(@RequestParam("uName")String uName,@RequestParam("uPassword")String uPassword,ModelMap model,
				HttpServletResponse response, HttpSession session) {
			
			String passwordByMd5 = Md5.MD5(uPassword);
			UserBean userBean = userService.login(uName);  //����ֻ��һ�����ݵ�list����
			int message;
		            if ( userBean!=null) {	            		      
		                if (passwordByMd5.equals(userBean.getuPassword())&&userBean.getuRight()==1) {
		                	session.setAttribute("adminsession", userBean);
		                	message=1;
		                }else {
		                	message=0;
		                }
					} else {
						message=-1;
					}   
		            	     
		          return  message;
		          		
		}
	 
	/*
	 * �û���¼��֤
	 * */
	@ResponseBody
	@RequestMapping(value="/validuser",method=RequestMethod.POST)
	public int validUser(@RequestParam("uName")String uName,@RequestParam("uPassword")String uPassword,ModelMap model,
			HttpServletResponse response, HttpSession session) {
		String passwordByMd5 = Md5.MD5(uPassword);
		UserBean userBean = userService.login(uName);  //����ֻ��һ�����ݵ�list����
		int message;
		
	            if ( userBean!=null) {	            
	            	
	                if (passwordByMd5.equals(userBean.getuPassword())) {	                  	             
	                    session.setAttribute("usersession", userBean);
	                    session.setAttribute("username", userBean.getuName());
	                    message=1;
	                }else {
	                	//�û��������
	                	message=0;
	                }
				} else {
					//�û�������
					message=-1;
				}   
	                
	          return  message;
	          
	         // System.out.println(Msg.success().add("user", userBean));
		
	}
	/*
	 * ���ݱ༭��id��ѯ
	 * */
	@ResponseBody
	@RequestMapping(value="/user/{id}",method=RequestMethod.GET)
	public Msg getUserById(@PathVariable("id")Integer id) {
		UserBean userBean=userService.getUserById(id);
		return Msg.success().add("user", userBean);
		
	}
	
	/*
	 * �޸� ����
	 * */
	@ResponseBody
	@RequestMapping(value="/user/{uId}",method=RequestMethod.PUT)
	public Msg editUser(UserBean userBean) {
		System.out.println("ddddd"+userBean);
		String passwordByMd5 = Md5.MD5(userBean.getuPassword());
		userBean.setuPassword(passwordByMd5);
		userService.editUser(userBean);
		return Msg.success();
	}
	
	/*
	 *�޸� ����
	 * */
	@ResponseBody
	@RequestMapping(value="/peruser/{uId}",method=RequestMethod.PUT)
	public int editPerUser(UserBean userBean,@RequestParam(value="starpassword")String starpassword,HttpSession session) {
		System.out.println("ddddd"+userBean);		
		UserBean user1=(UserBean)session.getAttribute("usersession");//session����Ϣ		
		String starpasswordByMd5=Md5.MD5(starpassword);//ԭ����
		int message;
		
		if(user1.getuPassword().equals(starpasswordByMd5)) {
			message=1; //ԭ����������ȷ				
		String passwordByMd5 = Md5.MD5(userBean.getuPassword());//�޸ĺ������
		userBean.setuPassword(passwordByMd5);
		userService.editUser(userBean);		
		}else {
			message=0; 
		}
		
		return message;
	}
	
	
	/*
	 * ɾ�� value="/delcat/{Id}"
	 * */
	@ResponseBody
	@RequestMapping(value="/user/{Id}",method=RequestMethod.DELETE)
	public Msg delUser(@PathVariable("Id")Integer id) {
		userService.delUser(id);
		return Msg.success();
	}

	/*
	 * ע���û�
	 * */
	@RequestMapping(value="/registeruser",method=RequestMethod.POST)
	@ResponseBody
	public int registerUser(UserBean userBean) {
		System.out.println(userBean);
		String passwordByMd5 = Md5.MD5(userBean.getuPassword());
		UserBean findUserByUname=userService.findUserByUname(userBean);
		int message;
		if (findUserByUname==null) {
			Date uDate = new Date();
			userBean.setuDate(uDate);
			userBean.setuPassword(passwordByMd5);
			userService.register(userBean);
			message = 1;
		}else {
			message = 0;//�û�����
		}
		System.out.println(userBean);
		

		return message;
	}


	/*
	 * ���������û�����
	 * */
	@RequestMapping(value="/useradd",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveUser(UserBean userBean) {
		String passwordByMd5 = Md5.MD5(userBean.getuPassword());
		Date uDate = new Date();
		userBean.setuPassword(passwordByMd5);
		userBean.setuDate(uDate);
		userService.saveUser(userBean);
		return Msg.success();
	}
	
	/*
	 * ��ѯ�û�������(��ҳ��ѯ)
	 * ����jackson��
	 * @ResponseBody ֱ�ӽ���������ת��Ϊjson����   json�ʺ϶��ֲ�ͬ�ն�
	 * */
	@RequestMapping("/users")
	@ResponseBody
	public Msg getUserWithJson(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber) {
		
		//����PageHelper��ҳ���
		//�ڲ�ѯ֮ǰֻ��Ҫ���� ����ҳ�� �Լ���ҳ��С
		PageHelper.startPage(pnumber, 5);
		//startpage��������������ѯ���Ƿ�ҳ��ѯ
		List<UserBean> users =userService.getAll();
		//ʹ��pageinfo��װ��ѯ�Ľ����ֻ��Ҫ��pageinfo����ҳ�������
		//��װ����ϸ�ķ�ҳ��Ϣ�����������ǲ�ѯ����������
		//����һ��model����  ������model�����ݶ��������ҳ�� ������������
		PageInfo page = new PageInfo(users,5);//5�Ǵ���������ʾ��ҳ��
		return Msg.success().add("pageInfo", page);
		
	}
}
