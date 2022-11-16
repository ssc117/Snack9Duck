package com.snack9duck.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.snack9duck.domain.CartVO;
import com.snack9duck.domain.OrderVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderServiceTests {
	@Setter(onMethod_ = { @Autowired })
	
	private OrderService service;
	
	@Test
	public void testExist() {
		log.info("service*****");
		log.info(service);
		assertNotNull(service);
	}
	@Test //pname unread으로 출력됨.
	public void testInsertOrder() {
		
		service.insertOrder("1234");
		
	}
	
	@Test
	public void insertOrderDetail() {
		OrderVO order = new OrderVO();
		order.setOseq(22);
		order.setProdnum(1);
		order.setQuantity(2);
		service.insertOrderDetail(order);
	}
	
	@Test
	public void testListOrderById() {
		OrderVO order = new OrderVO();
		order.setId("1234");
		order.setResult("1");
		order.setOseq(22);
		service.listOrderById(order);
		
	}
	@Test
	public void testSelectSeqOrdering() {
		service.selectSeqOrdering("asd");
	}
	
	@Test
	public void listOrder(){
		
		service.listOrder("");
	}
	
	
	@Test
	public void testOrderDesc() {
		
		service.orderDesc();
		log.info(service.orderDesc());
	}
	
	@Test
	public void testUpdateOrderList() {
		OrderVO order = new OrderVO();
		order.setId("1234");
		order.setResult("1");
		order.setOseq(22);
		
		List<OrderVO> orderList = service.listOrderById(order);
		service.updateOrderList(orderList);
	}
}
