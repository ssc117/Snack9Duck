package com.snack9duck.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.snack9duck.domain.CartVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartServiceTests {
	@Setter(onMethod_ = { @Autowired })
	
	private CartService service;
	
	@Test
	public void testExist() {
		log.info("service*****");
		log.info(service);
		assertNotNull(service);
	}
	@Test //pname unread으로 출력됨.
	public void testlistCart() {
		service.listCart("1234").forEach(cart -> log.info(cart));
	}
	
	@Test //pname unread으로 출력됨.
	public void testselectCartByuserid() {
		service.selectCartByuserid("1234");
		
	}
	
	@Test // 성공 카트에 담기
	public void testCartInsert() {
		CartVO cart = new CartVO();
		cart.setId("1234");
		cart.setProdnum(104);
		cart.setQuantity(30);
		service.insertCart(cart);
		log.info(cart);
		log.info("after insert : " + cart.getCartnum());
	}
	
	
	@Test //동작됨.  카트 번호로 삭제 
	public void testdeleteCart() {
		log.info("DELETE count + "+ service.deleteCart(118L));
	}
	@Test//동작됨. 아이디 정보로 카트  전체 삭제
	public void testdeleteCart_All() {
		log.info("DELETE count + "+ service.deleteCart_All("asd"));
	}
	@Test //동작됨. 장바구니 수량 수정
	public void testmodifyCount() {
		CartVO cart = new CartVO();
		cart.setCartnum(201);
		cart.setQuantity(10);
		int count = service.modifyCount(cart);
		log.info("Update count : " + count );
	}
}
