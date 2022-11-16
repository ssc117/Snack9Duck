package com.snack9duck.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.snack9duck.domain.Criteria;
import com.snack9duck.domain.NoticeVO;
import com.snack9duck.mapper.NoticeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTests {
	@Setter(onMethod = @__({ @Autowired }))
	private NoticeMapper mapper;

	@Test
	public void testGetList(Criteria cri) {
		mapper.getListWithPaging(cri).forEach(notice -> log.info(notice));
	}
	@Test
	public void testInsert() {
		NoticeVO notice = new NoticeVO();
		notice.setTitle("Mapper 공지사항 테스트");
		notice.setWriter("admin");
		notice.setContent("공지사항 업로드 테스트");
		mapper.insert(notice);
		log.info(notice);
		log.info("after insert : " + notice.getNoticeno());
	}
	@Test
	public void testInsertSelectKey() {
		NoticeVO notice = new NoticeVO();
		notice.setTitle("Mapper 공지사항 테스트");
		notice.setWriter("admin");
		notice.setContent("공지사항 업로드 테스트");
		mapper.insertSelectKey(notice);
		log.info(notice);
		log.info("after insert selectKey : " + notice.getNoticeno());
	}
	@Test
	public void testRead() {
		NoticeVO notice = mapper.read(3L);
		log.info(notice);
	}
	@Test
	public void testDelete() {
		log.info("DELETE count + "+ mapper.delete(25L) );
	}
	@Test
	public void testUpdate() {
		NoticeVO notice = new NoticeVO();
		notice.setNoticeno(2L);
		notice.setTitle("mapper 수정 테스트");
		notice.setContent("mapper 수정 테스트 내용");
		int count = mapper.update(notice);
		log.info("Update count : " + count );
	}
	
}
