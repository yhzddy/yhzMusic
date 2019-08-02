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
		 * 管理员登录验证
		 * */
		@ResponseBody
		@RequestMapping(value="/validadmin",method=RequestMethod.POST)
		public int validAdmin(@RequestParam("uName")String uName,@RequestParam("uPassword")String uPassword,ModelMap model,
				HttpServletResponse response, HttpSession session) {
			
			String passwordByMd5 = Md5.MD5(uPassword);
			UserBean userBean = userService.login(uName);  //返回只有一条数据的list泛型
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
	 * 用户登录验证
	 * */
	@ResponseBody
	@RequestMapping(value="/validuser",method=RequestMethod.POST)
	public int validUser(@RequestParam("uName")String uName,@RequestParam("uPassword")String uPassword,ModelMap model,
			HttpServletResponse response, HttpSession session) {
		String passwordByMd5 = Md5.MD5(uPassword);
		UserBean userBean = userService.login(uName);  //返回只有一条数据的list泛型
		int message;
		
	            if ( userBean!=null) {	            
	            	
	                if (passwordByMd5.equals(userBean.getuPassword())) {	                  	             
	                    session.setAttribute("usersession", userBean);
	                    session.setAttribute("username", userBean.getuName());
	                    message=1;
	                }else {
	                	//用户密码错误
	                	message=0;
	                }
				} else {
					//用户不存在
					message=-1;
				}   
	                
	          return  message;
	          
	         // System.out.println(Msg.success().add("user", userBean));
		
	}
	/*
	 * 根据编辑中id查询
	 * */
	@ResponseBody
	@RequestMapping(value="/user/{id}",method=RequestMethod.GET)
	public Msg getUserById(@PathVariable("id")Integer id) {
		UserBean userBean=userService.getUserById(id);
		return Msg.success().add("user", userBean);
		
	}
	
	/*
	 * 修改 更新
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
	 *修改 个人
	 * */
	@ResponseBody
	@RequestMapping(value="/peruser/{uId}",method=RequestMethod.PUT)
	public int editPerUser(UserBean userBean,@RequestParam(value="starpassword")String starpassword,HttpSession session) {
		System.out.println("ddddd"+userBean);		
		UserBean user1=(UserBean)session.getAttribute("usersession");//session的信息		
		String starpasswordByMd5=Md5.MD5(starpassword);//原密码
		int message;
		
		if(user1.getuPassword().equals(starpasswordByMd5)) {
			message=1; //原密码输入正确				
		String passwordByMd5 = Md5.MD5(userBean.getuPassword());//修改后的密码
		userBean.setuPassword(passwordByMd5);
		userService.editUser(userBean);		
		}else {
			message=0; 
		}
		
		return message;
	}
	
	
	/*
	 * 删除 value="/delcat/{Id}"
	 * */
	@ResponseBody
	@RequestMapping(value="/user/{Id}",method=RequestMethod.DELETE)
	public Msg delUser(@PathVariable("Id")Integer id) {
		userService.delUser(id);
		return Msg.success();
	}

	/*
	 * 注册用户
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
			message = 0;//用户存在
		}
		System.out.println(userBean);
		

		return message;
	}


	/*
	 * 新增保存用户数据
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
	 * 查询用户的数据(分页查询)
	 * 导入jackson包
	 * @ResponseBody 直接将返回类型转化为json类型   json适合多种不同终端
	 * */
	@RequestMapping("/users")
	@ResponseBody
	public Msg getUserWithJson(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber) {
		
		//引入PageHelper分页插件
		//在查询之前只需要调用 传入页码 以及分页大小
		PageHelper.startPage(pnumber, 5);
		//startpage后面紧跟的这个查询就是分页查询
		List<UserBean> users =userService.getAll();
		//使用pageinfo包装查询的结果，只需要将pageinfo交给页面就行了
		//封装了详细的分页信息，包括了我们查询出来的数据
		//增加一个model类型  保存在model的数据都会给带给页面 放在请求域中
		PageInfo page = new PageInfo(users,5);//5是传入连续显示的页数
		return Msg.success().add("pageInfo", page);
		
	}
}
