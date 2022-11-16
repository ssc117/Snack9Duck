package com.snack9duck.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.snack9duck.domain.ProductVO;
import com.snack9duck.mapper.ProductMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductMapperTests {
	@Setter(onMethod = @__({ @Autowired }))
	private ProductMapper mapper;

	@Test
	public void testGetList() {
		mapper.getList().forEach(product -> log.info(product));
	}
	@Test
	public void testGetProductKindList() {
		log.info("testGetProductKindList + "+ mapper.listKindProduct("2") );
		
	}
	@Test
	public void testInsert() {
		ProductVO product = new ProductVO();
		product.setName("test mapper 아이템111");
		product.setKind(1);
		product.setPrice(1234);
		product.setContent("새로 추가되는 작성글 내용");
		product.setDetail_image("detail.jpg");
		product.setImage("image.jpg");
		mapper.insert(product);
		log.info(product);
		log.info("after insert : " + product.getProdnum());
	}
	@Test
	public void testInsertSelectKey() {
		ProductVO product = new ProductVO();
		product.setName("test mapper 아이템");
		product.setKind(1);
		product.setPrice(1234);
		product.setContent("새로 추가되는 작성글 내용");
		product.setDetail_image("detail.jpg");
		product.setImage("image.jpg");
		mapper.insertSelectKey(product);
		log.info(product);
		log.info("after insert selectKey : " + product.getProdnum());
	}
	@Test
	public void testRead() {
		ProductVO product = mapper.read(21L);
		log.info(product);
	}
	@Test
	public void testDelete() {
		log.info("DELETE count + "+ mapper.delete(21L) );
	}
	@Test
	public void testUpdate() {
		ProductVO product = new ProductVO();
		product.setProdnum(22L);
		product.setName("test mapper 아이템");
		product.setKind(1);
		product.setPrice(1234);
		product.setContent("새로 추가되는 작성글 내용");
		product.setDetail_image("detail.jpg");
		product.setImage("image.jpg");
		int count = mapper.update(product);
		log.info("Update count : " + count );
	}
	
}
