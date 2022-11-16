package com.snack9duck.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.snack9duck.domain.EventVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class EventServiceTests {
	@Setter(onMethod_ = { @Autowired })
	private EventService service;
	@Test
	public void testEventRegister() {
		log.info("event Register***");
		EventVO event = new EventVO();
		event.setSubject("서비스 업로드 테스트");
		event.setContent("이벤트 기간~~~~");
		event.setImg("mapper img.jpg");
		event.setMainimg("mainimg.jpg");
		service.register(event);
		log.info("추가한 이벤트의 번호 : " + event.getEventno());
		
	}
	@Test
	public void testExist() {
		log.info("service*****");
		log.info(service);
		assertNotNull(service);
	}
	@Test
	public void testGetList() {
		service.getList().forEach(event -> log.info(event));
	}
	@Test
	public void testGetEndEventList() {
		service.endEventList().forEach(event -> log.info(event));
	}
	
	@Test
	public void testGet() {
		log.info(service.get(1L));
	
	}
	
	@Test
	public void testDelete() {
		log.info("******remove result : " + service.delete(41L));
		
	}
	@Test
	public void testModify() {
		EventVO event = service.get(32L);
		if(event == null) {return;}
		event.setSubject("서비스 수정 테스트");
		event.setContent("수정된이벤트 기간!!!~~~~");
		event.setImg("서비스 img.jpg");
		event.setMainimg("서비스mainimg.jpg");
		
		log.info("*****testModify result : " + service.modify(event));
	}
}
