package com.snack9duck.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.snack9duck.domain.NoticeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeServiceTests {
	@Setter(onMethod_ = { @Autowired })
	private NoticeService service;
	@Test
	public void testNoticeRegister() {
		log.info("notice Register***");
		NoticeVO notice = new NoticeVO();
		notice.setTitle("Service 공지사항 테스트");
		notice.setWriter("admin");
		notice.setContent("service공지사항 업로드 테스트");
		service.register(notice);
		log.info("추가한 이벤트의 번호 : " + notice.getNoticeno());
		
	}
	@Test
	public void testExist() {
		log.info("service*****");
		log.info(service);
		assertNotNull(service);
	}
	@Test
	public void testGetList() {
		service.getList().forEach(notice -> log.info(notice));
	}
	@Test
	public void testGet() {
		log.info(service.get(1L));
	
	}
	
	@Test
	public void testDelete() {
		log.info("******remove result : " + service.delete(4L));
		
	}
	@Test
	public void testModify() {
		NoticeVO notice = service.get(3L);
		if(notice == null) {return;}
		notice.setTitle("service notice 수정 테스트!!");
		notice.setContent("서비스로notice 수정 테스트 내용");
		
		log.info("*****testModify result : " + service.modify(notice));
	}
}
