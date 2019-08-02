package com.rap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rap.bean.CategoryBean;
import com.rap.bean.Msg;
import com.rap.service.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	CategoryService categoryService;
	
	/*
	 * 删除 value="/delcat/{Id}"
	 * */
	@ResponseBody
	@RequestMapping(value="/cat/{Id}",method=RequestMethod.DELETE)
	public Msg delCat(@PathVariable("Id")Integer id) {
		categoryService.delCat(id);
		return Msg.success();
		
	}
	
	/*
	 * 修改 更新
	 * */
	@ResponseBody
	@RequestMapping(value="/cat/{catId}",method=RequestMethod.PUT)
	public Msg editCat(CategoryBean categoryBean) {
		//System.out.println("将要更新的数据:"+categoryBean);
		categoryService.editCat(categoryBean);
		return Msg.success();
	}
	
	
	/*
	 * 根据编辑中id查询
	 * */
	@ResponseBody
	@RequestMapping(value="/cat/{id}",method=RequestMethod.GET)
	public Msg getCat(@PathVariable("id")Integer id) {
		CategoryBean categoryBean=categoryService.getCat(id);
		return Msg.success().add("cat", categoryBean);
		
	}
	
	
	/*
	 * 校验分类名是否重复
	 * */
	@ResponseBody
	@RequestMapping("/checkcatname")
	public Msg checkCatName(String catName) {
		//先判断类名是否合法
		String regx="(^[\\u2E80-\\u9FFF]{2,6})|(^[a-zA-Z_-]{3,16}$)";
		if(!catName.matches(regx)) {
			return Msg.fail().add("va_msg", "分类名必须是2-6位中文或者3-16位英文组合");
		}
		//数据库类名校验
		boolean c=categoryService.checkCatName(catName);
		if(c) {
			return Msg.success();
		}else {
			return Msg.fail().add("va_msg", "类名不可用");
		}
		
	}
	
	/*
	 * 新增保存分类数据
	 * */
	@RequestMapping(value="/catadd",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveCat(CategoryBean categoryBean) {
		
		categoryService.saveCat(categoryBean);
		return Msg.success();
	}
	
	@RequestMapping(value="/songwithcat")
	@ResponseBody
	public Msg getCats() {
		List<CategoryBean> list= categoryService.getAll();
		return Msg.success().add("cats", list);
	}
	/*
	 * 查询分类的数据(分页查询)
	 * 导入jackson包
	 * @ResponseBody 直接将返回类型转化为json类型   json适合多种不同终端
	 * */
	@RequestMapping("/cats")
	@ResponseBody
	public Msg getCatWithJson(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber) {
		
		//引入PageHelper分页插件
		//在查询之前只需要调用 传入页码 以及分页大小
		PageHelper.startPage(pnumber, 5);
		//startpage后面紧跟的这个查询就是分页查询
		List<CategoryBean> cats =categoryService.getAll();
		//使用pageinfo包装查询的结果，只需要将pageinfo交给页面就行了
		//封装了详细的分页信息，包括了我们查询出来的数据
		//增加一个model类型  保存在model的数据都会给带给页面 放在请求域中
		PageInfo page = new PageInfo(cats,5);//5是传入连续显示的页数
		return Msg.success().add("pageInfo", page);
		
	}
	

}
