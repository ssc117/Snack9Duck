package com.snack9duck.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.snack9duck.domain.EventVO;
import com.snack9duck.mapper.EventMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class EventMapperTests {
	@Setter(onMethod = @__({ @Autowired }))
	private EventMapper mapper;

	@Test
	public void testGetList() {
		mapper.getList().forEach(event -> log.info(event));
	}
	@Test
	public void testGetEndEventList() {
		mapper.endEventList().forEach(event -> log.info(event));
	}
	
	@Test
	public void testInsert() {
		EventVO event = new EventVO();
		event.setSubject("Mapper 업로드 테스트");
		event.setContent("이벤트 기간~~~~");
		event.setImg("mapper img.jpg");
		event.setMainimg("mainimg.jpg");
		
		mapper.insert(event);
		log.info(event);
		log.info("after insert : " + event.getEventno());
	}
	@Test
	public void testInsertSelectKey() {
		EventVO event = new EventVO();
		event.setSubject("Mapper 업로드 테스트");
		event.setContent("이벤트 기간~~~~");
		event.setImg("mapper img.jpg");
		event.setMainimg("mainimg.jpg");
		mapper.insertSelectKey(event);
		log.info(event);
		log.info("after insert selectKey : " + event.getEventno());
	}
	@Test
	public void testRead() {
		EventVO event = mapper.read(3L);
		log.info(event);
	}
	@Test
	public void testDelete() {
		log.info("DELETE count + "+ mapper.delete(25L) );
	}
	@Test
	public void testUpdate() {
		EventVO event = new EventVO();
		event.setEventno(27L);
		event.setSubject("Mapper 이벤트 수정 테스트");
		event.setImg("수정mapperimg.jpg");
		event.setMainimg("수정mainimg.jpg");
		event.setContent("수정된이벤트 기간~~~~");
		int count = mapper.update(event);
		log.info("Update count : " + count );
	}
	
}
