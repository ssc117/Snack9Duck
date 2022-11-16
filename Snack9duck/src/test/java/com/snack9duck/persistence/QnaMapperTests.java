package com.snack9duck.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.snack9duck.domain.QnaVO;
import com.snack9duck.mapper.QnaMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnaMapperTests {
	@Setter(onMethod = @__({ @Autowired }))
	private QnaMapper mapper;

	@Test
	public void testGetList() {
		mapper.getList().forEach(qna -> log.info(qna));
	}
	@Test
	public void testInsert() {
		QnaVO qna = new QnaVO();
		qna.setType("배송 문의");
		qna.setSubject("테스트 제목이에요");
		qna.setContent("질문은 이런거에요");
		qna.setReply("답장~");
		qna.setEmail("test@test.com");
		qna.setId("1234");
		
		mapper.insert(qna);
		log.info(qna);
		log.info("after insert : " + qna.getQseq());
	}
	@Test
	public void testInsertSelectKey() {
		QnaVO qna = new QnaVO();
		qna.setType("배송 문의");
		qna.setSubject("테스트 제목이에요");
		qna.setContent("질문은 이런거에요");
		qna.setReply("답장~");
		qna.setEmail("test@test.com");
		qna.setId("1234");
		mapper.insertSelectKey(qna);
		log.info(qna);
		log.info("after insert selectKey : " + qna.getQseq());
	}
	@Test
	public void testRead() {
		QnaVO qna = mapper.read(1L);
		log.info(qna);
	}
	@Test
	public void testDelete() {
		log.info("DELETE count + "+ mapper.delete(1L) );
	}
	@Test
	public void testUpdate() {
		QnaVO qna = new QnaVO();
		qna.setQseq(2L);
		qna.setType("배송 문의");
		qna.setSubject("테스트 제목이에요");
		qna.setContent("질문은 이런거에요");
		qna.setReply("답장~");
		qna.setEmail("test@test.com");
		qna.setId("1234");
		int count = mapper.update(qna);
		log.info("Update count : " + count );
	}
	
}
