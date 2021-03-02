package com.sjw.mybatisboard;

import static org.junit.Assert.assertNotNull;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.sjw.mybatisboard.dto.MyMember;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * Lombok관련 어노테이션 - @Setter, @Data, @Log4j 
 * Spring관련 어노테이션 - @Autowired, @Component 
 * 테스트관련 어노테이션 - @RunWith, @ContextConfiguration, @Test 
 */

@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//@ContextConfiguration(classes = {com.sjw.mybatisboard.config.RootConfig.class})
@Log4j
public class SampleTests {
	@Setter(onMethod_ = {@Autowired})
	private MyMember myMember;
	@Test
	public void testExists() {
		assertNotNull(myMember);
		log.info(myMember);
	}
}
