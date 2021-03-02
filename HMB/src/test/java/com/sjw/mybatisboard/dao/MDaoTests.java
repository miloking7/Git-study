package com.sjw.mybatisboard.dao;

import static org.junit.Assert.fail;
import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.sjw.mybatisboard.dto.MyMember;
import lombok.extern.log4j.Log4j;

/**
 * Lombok관련 어노테이션 - @Setter, @Data, @Log4j 
 * Spring관련 어노테이션 - @Autowired, @Component 
 * 테스트관련 어노테이션 - @RunWith, @ContextConfiguration, @Test 
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MDaoTests {
	@Autowired
	private SqlSessionFactory sqlSessionFactory;

	@Test(expected = Exception.class) //IllegalStateException
	public void testMyBatis() {
		try{
			SqlSession session = sqlSessionFactory.openSession();
			log.info(session);
			MDao dao = session.getMapper(MDao.class);
			ArrayList<MyMember> dtos =  dao.memberList();
			for(MyMember x:dtos) {
				System.out.println(x);
			}
		}catch(Exception e) {
			fail(e.getMessage());
		}
	}
}
