package com.rap.test;

import java.sql.Date;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.aspectj.weaver.GeneratedReferenceTypeDelegate;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rap.bean.CategoryBean;
import com.rap.bean.SongBean;
import com.rap.mapper.CategoryBeanMapper;
import com.rap.mapper.SongBeanMapper;
import com.rap.mapper.UserBeanMapper;




/*
 * 
 * 1导入spring test测试模块
 * 2@ContextConfiguration指定spring配置文件的位置
 * 3直接autowired要使用的组件即可
 * */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {

//	@Autowired
//	SongBeanMapper songBeanMapper; 
//	@Autowired
//	CategoryBeanMapper categoryBeanMapper;
//	@Autowired
//	SqlSession sqlSession;
//	
//	@Test
//	public void testCRUD() {
//		
//		System.out.println(categoryBeanMapper);
//		
//		//插入分类
//		//categoryBeanMapper.insertSelective(new CategoryBean(null, "抒情hip"));
//		//categoryBeanMapper.insertSelective(new CategoryBean(null, "Kpop"));
//		
//		
//		//批量插入
//		Date ad=Date.valueOf("1992-12-1");
//		SongBeanMapper mapper=sqlSession.getMapper(SongBeanMapper.class);
//		for(int i=0;i<5;i++) {
//			String uid=UUID.randomUUID().toString().substring(0, 2)+i;
//			//mapper.insertSelective(new SongBean(null, uid, uid, ad, uid, uid, uid, uid, uid, 1));
//			
//		}
//		
//		System.out.println("批量完成");
//		
//	}
}
