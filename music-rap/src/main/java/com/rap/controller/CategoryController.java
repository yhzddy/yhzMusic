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
	 * ɾ�� value="/delcat/{Id}"
	 * */
	@ResponseBody
	@RequestMapping(value="/cat/{Id}",method=RequestMethod.DELETE)
	public Msg delCat(@PathVariable("Id")Integer id) {
		categoryService.delCat(id);
		return Msg.success();
		
	}
	
	/*
	 * �޸� ����
	 * */
	@ResponseBody
	@RequestMapping(value="/cat/{catId}",method=RequestMethod.PUT)
	public Msg editCat(CategoryBean categoryBean) {
		//System.out.println("��Ҫ���µ�����:"+categoryBean);
		categoryService.editCat(categoryBean);
		return Msg.success();
	}
	
	
	/*
	 * ���ݱ༭��id��ѯ
	 * */
	@ResponseBody
	@RequestMapping(value="/cat/{id}",method=RequestMethod.GET)
	public Msg getCat(@PathVariable("id")Integer id) {
		CategoryBean categoryBean=categoryService.getCat(id);
		return Msg.success().add("cat", categoryBean);
		
	}
	
	
	/*
	 * У��������Ƿ��ظ�
	 * */
	@ResponseBody
	@RequestMapping("/checkcatname")
	public Msg checkCatName(String catName) {
		//���ж������Ƿ�Ϸ�
		String regx="(^[\\u2E80-\\u9FFF]{2,6})|(^[a-zA-Z_-]{3,16}$)";
		if(!catName.matches(regx)) {
			return Msg.fail().add("va_msg", "������������2-6λ���Ļ���3-16λӢ�����");
		}
		//���ݿ�����У��
		boolean c=categoryService.checkCatName(catName);
		if(c) {
			return Msg.success();
		}else {
			return Msg.fail().add("va_msg", "����������");
		}
		
	}
	
	/*
	 * ���������������
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
	 * ��ѯ���������(��ҳ��ѯ)
	 * ����jackson��
	 * @ResponseBody ֱ�ӽ���������ת��Ϊjson����   json�ʺ϶��ֲ�ͬ�ն�
	 * */
	@RequestMapping("/cats")
	@ResponseBody
	public Msg getCatWithJson(@RequestParam(value="pnumber",defaultValue="1")Integer pnumber) {
		
		//����PageHelper��ҳ���
		//�ڲ�ѯ֮ǰֻ��Ҫ���� ����ҳ�� �Լ���ҳ��С
		PageHelper.startPage(pnumber, 5);
		//startpage��������������ѯ���Ƿ�ҳ��ѯ
		List<CategoryBean> cats =categoryService.getAll();
		//ʹ��pageinfo��װ��ѯ�Ľ����ֻ��Ҫ��pageinfo����ҳ�������
		//��װ����ϸ�ķ�ҳ��Ϣ�����������ǲ�ѯ����������
		//����һ��model����  ������model�����ݶ��������ҳ�� ������������
		PageInfo page = new PageInfo(cats,5);//5�Ǵ���������ʾ��ҳ��
		return Msg.success().add("pageInfo", page);
		
	}
	

}
