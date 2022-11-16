package com.snack9duck.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.snack9duck.domain.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTests {
	@Setter(onMethod_ = { @Autowired })
	private ProductService service;
	@Test
	public void testProductRegister() {
		log.info("product Register***");
		ProductVO product = new ProductVO();
		product.setName("TEST Spring 상품");
		product.setKind(1) ;
		product.setPrice(1000);
		product.setContent("TEST 상품설명");
		product.setImage("test.jpg");
		product.setDetail_image("test_detail.jpg");
		service.register(product);
		log.info("추가한 상품의 번호 : " + product.getProdnum());
		
	}
	@Test
	public void testExist() {
		log.info("service*****");
		log.info(service);
		assertNotNull(service);
	}
	@Test
	public void testGetList() {
		service.getList().forEach(product -> log.info(product));
	}
	@Test
	public void testGet() {
		log.info(service.get(1L));
	
	}
	
	@Test
	public void testDelete() {
		log.info("******remove result : " + service.delete(43L));
		
	}
	@Test
	public void testModify() {
		ProductVO product = service.get(34L);
		if(product == null) {return;}
		product.setName("수정테스트");
		product.setKind(3);
		product.setContent("수정테스트");
		product.setPrice(4567);
		product.setImage("이미지.jpg");
		product.setDetail_image("상세이미지.asd");
		log.info("*****testModify result : " + service.modify(product));
	}
}
