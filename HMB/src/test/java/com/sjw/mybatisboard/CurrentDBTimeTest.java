package com.sjw.mybatisboard;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.sjw.mybatisboard.mapper.CurrentDBTime;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
/**
 * Lombok관련 어노테이션 - @Setter, @Data, @Log4j 
 * Spring관련 어노테이션 - @Autowired, @Component 
 * 테스트관련 어노테이션 - @RunWith, @ContextConfiguration, @Test 
 */
@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(classes = {com.sjw.mybatisboard.config.RootConfig.class})
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CurrentDBTimeTest {
	@Setter(onMethod_ = {@Autowired})
	private CurrentDBTime currentDBTime;
	
	@Test
	public void testGetTime() {
		log.info(currentDBTime.getClass().getName());
		log.info(currentDBTime.getTime());
	}
}
