package com.sjw.mybatisboard;

import static org.junit.Assert.fail;
import java.sql.Connection;
import java.util.ArrayList;
import javax.sql.DataSource;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.sjw.mybatisboard.dao.BDao;
import com.sjw.mybatisboard.dto.BDto;
import com.sjw.mybatisboard.service.Constant;

//import com.sjw.mybatisboard.config.RootConfig;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * Lombok관련 어노테이션 - @Setter, @Data, @Log4j 
 * Spring관련 어노테이션 - @Autowired, @Component 
 * 테스트관련 어노테이션 - @RunWith, @ContextConfiguration, @Test 
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//@ContextConfiguration(classes = { RootConfig.class })
@Log4j
public class DataSourceTests {
	@Setter(onMethod_ = { @Autowired })
	private DataSource dataSource;
//	
	@Setter(onMethod_ = { @Autowired })
	private SqlSessionFactory sqlSessionFactory;
//	
	@Test
	public void testConnection() {
		try (Connection conn = dataSource.getConnection()
		) {
			log.info("--------------------------------");
			log.info(conn);
			log.info("--------------------------------");
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
	@Test 
	public void testMyBatis() {
		try{
			SqlSession session = sqlSessionFactory.openSession();
			Connection conn = session.getConnection();
			log.info(session);
			log.info(conn);
			BDao dao = session.getMapper(BDao.class);
			ArrayList<BDto> dtos =  dao.list();
			for(BDto x:dtos) {
				System.out.println(x.getbTitle()+"/writed by "+x.getbName());
			}
		}catch(Exception e) {
			fail(e.getMessage());
		}
		
	}
	
//	@Test //HomeControlloer를 거치지 않은 아래 Constant.sqlSession는 null 이므로 테스트가 안된다. 
//	public void testMyBatis2() {
//		// 
//		SqlSession session=null;
//		try{
//			session = Constant.sqlSession;
//			log.info("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
//			log.info(session);
//			log.info("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
//			BDao dao = session.getMapper(BDao.class);
//			ArrayList<BDto> dtos =  dao.list();
//			for(BDto x:dtos) {
//				System.out.println(x.getbTitle()+":writed by "+x.getbName());
//			}
//		}catch(Exception e) {
//			fail(e.getMessage());
//		}
//		
//	}
	
}
