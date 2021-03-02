package com.sjw.mybatisboard.dao;

import org.junit.After;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

// spring-test 사용
	@RunWith(SpringJUnit4ClassRunner.class)
	@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
	
	public class SpringTest {

		@Autowired
		private ApplicationContext ctx;
		
		@Before
		public void beforeClass() {
			System.out.println("-----테스트 시작-----");
		}
		
		@After
		public void afterClass() {
			System.out.println("-----테스트 종료-----");
		}

		@org.junit.Test
		public void dbTest() {

			// 컨테이너에서 getBean()
			SqlSessionTemplate session 
			= ctx.getBean("sqlSessoinTemplate",SqlSessionTemplate.class);
			System.out.println(session);
		}
	}