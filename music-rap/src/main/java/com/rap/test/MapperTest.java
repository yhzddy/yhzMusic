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
 * 1����spring test����ģ��
 * 2@ContextConfigurationָ��spring�����ļ���λ��
 * 3ֱ��autowiredҪʹ�õ��������
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
//		//�������
//		//categoryBeanMapper.insertSelective(new CategoryBean(null, "����hip"));
//		//categoryBeanMapper.insertSelective(new CategoryBean(null, "Kpop"));
//		
//		
//		//��������
//		Date ad=Date.valueOf("1992-12-1");
//		SongBeanMapper mapper=sqlSession.getMapper(SongBeanMapper.class);
//		for(int i=0;i<5;i++) {
//			String uid=UUID.randomUUID().toString().substring(0, 2)+i;
//			//mapper.insertSelective(new SongBean(null, uid, uid, ad, uid, uid, uid, uid, uid, 1));
//			
//		}
//		
//		System.out.println("�������");
//		
//	}
}
