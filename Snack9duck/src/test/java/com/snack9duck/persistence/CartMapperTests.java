package com.snack9duck.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.snack9duck.domain.CartVO;
import com.snack9duck.mapper.CartMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartMapperTests {
	@Setter(onMethod = @__({ @Autowired }))
	private CartMapper mapper;
	//장바구니 선택 삭제 추가해서 테스트 해야함!!! 화면 구현 이후 테스트
	@Test //pname unread으로 출력됨.
	public void testlistCart() {
		mapper.listCart("1234").forEach(cart -> log.info(cart));
	}
	@Test // 성공 카트에 담기
	public void testCartInsert() {
		CartVO cart = new CartVO();
		cart.setId("asd");
		cart.setProdnum(2);
		cart.setQuantity(20);
		mapper.insertCart(cart);
		log.info(cart);
		log.info("after insert : " + cart.getCartnum());
	}
	
	@Test // 동작되지않음. 추가확인 필요.
	public void selectCartByuserid() {
		CartVO cart = new CartVO();
		cart.setId("1234");
		mapper.selectCartByuserid("1234");
		log.info(cart);
	}
	@Test //동작됨.  카트 번호로 삭제 
	public void testdeleteCart() {
		log.info("DELETE count + "+ mapper.deleteCart(141L));
	}
	@Test//동작됨. 아이디 정보로 카트  전체 삭제
	public void testdeleteCart_All() {
		log.info("DELETE count + "+ mapper.deleteCart_All("asd"));
	}
	@Test //동작됨. 장바구니 수량 수정
	public void testmodifyCount() {
		CartVO cart = new CartVO();
		cart.setCartnum(144);
		cart.setQuantity(300);
		int count = mapper.modifyCount(cart);
		log.info("Update count : " + count );
	}
	@Test //선택 삭제 기능 구현 
	public void testdeleteCart_Select() {
		//int[] cartnum = {165,167};
		 //mapper.selectDelete(cartnum);
	}

	
}
