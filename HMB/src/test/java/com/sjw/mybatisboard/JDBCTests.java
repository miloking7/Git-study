package com.sjw.mybatisboard;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import jdk.nashorn.internal.runtime.logging.Logger;
/**
 * Lombok관련 어노테이션 - @Setter, @Data, @Log4j 
 * Spring관련 어노테이션 - @Autowired, @Component 
 * 테스트관련 어노테이션 - @RunWith, @ContextConfiguration, @Test 
 */



import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Test
	public void testConnection() {
		try(Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:XE",
				"mvcboard",
				"mvcboard")){
			
		}catch(Exception e) {
			fail(e.getMessage());
		}
	}
}
