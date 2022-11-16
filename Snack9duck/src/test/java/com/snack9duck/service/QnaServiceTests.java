package com.snack9duck.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.snack9duck.domain.QnaVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnaServiceTests {
	@Setter(onMethod_ = { @Autowired })
	private QnaService service;
	@Test
	public void testQnaRegister() {
		log.info("Qna Register***");
		QnaVO qna = new QnaVO();
		qna.setType("그냥 문의");
		qna.setSubject("테스트 제목임11");
		qna.setContent("제곧내");
		qna.setReply("");
		qna.setEmail("test@test.com");
		qna.setId("1234");
		service.register(qna);
		log.info("추가한 이벤트의 번호 : " + qna.getQseq());
		
	}
	@Test
	public void testExist() {
		log.info("service*****");
		log.info(service);
		assertNotNull(service);
	}
	@Test
	public void testGetList() {
		service.getList().forEach(qna -> log.info(qna));
	}
	@Test
	public void testGet() {
		log.info(service.get(2L));
	
	}
	
	@Test
	public void testDelete() {
		log.info("******remove result : " + service.delete(22L));
		
	}
	@Test
	public void testModify() {
		QnaVO qna = service.get(25L);
		if(qna == null) {return;}
		qna.setType("배송 문의");
		qna.setSubject("테스트 제목이에요");
		qna.setContent("질문은 이런거에요");
		qna.setReply("답장~");
		qna.setEmail("test@test.com");
		qna.setId("1234");
		
		log.info("*****testModify result : " + service.modify(qna));
	}
}
