package com.rap.test;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

/* spring模块测试请求功能 测试crud的正确性*/
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MvcTest {
				//传入SpringMvc的容器
				@Autowired
				WebApplicationContext context;
				//虚拟请求，获取处理结果
				MockMvc mockMvc;
				
				@Before
				public void initMockMvc() {
					mockMvc=MockMvcBuilders.webAppContextSetup(context).build();
				}
				
				@Test
				public void testPage() {
					
					//模拟请求的拿回值
					//MvcResult result=mockMvc.perform(MockMvcRequestBuilders.get(/cats))
				}
				
}
