package com.snack9duck.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.snack9duck.domain.OrderVO;
import com.snack9duck.mapper.OrderMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderMapperTests {
	@Setter(onMethod = @__({ @Autowired }))
	private OrderMapper mapper;
	
	@Test //pname unread으로 출력됨.
	public void testInsertOrder() {
		
		mapper.insertOrder("hoho");
		
	}
	
	@Test
	public void insertOrderDetail() {
		OrderVO order = new OrderVO();
		order.setOseq(74);
		order.setProdnum(9);
		order.setQuantity(3);
		mapper.insertOrderDetail(order);
	}
	
	@Test
	public void testListOrderById() {
		OrderVO order = new OrderVO();
		order.setId("1234");
		order.setResult("1");
		order.setOseq(22);
		mapper.listOrderById(order);
		
	}
	@Test
	public void testSelectSeqOrdering() {
		mapper.selectSeqOrdering("asd");
	}
	
	@Test
	public void listOrder(){
		
		mapper.listOrder("");
	}
	
	@Test
	public void testUpdateOrderResult() {
		OrderVO order = new OrderVO();
		order.setId("1234");
		order.setResult("1");
		order.setOseq(115);
		
		List<OrderVO> orderList = mapper.listOrderById(order);
		log.info("-----------orderList = "+orderList);
		for(OrderVO orderVO :orderList){
			mapper.updateOrderResult(orderVO.getOdseq());//result 1 -> 2
			
	    }
		order.setResult("1");
		log.info("-----------orderList = "+orderList);
	}
	
	@Test
	public void testOrderDesc() {
		
		mapper.orderDesc();
		log.info(mapper.orderDesc());
	}
	
	@Test
	public void testOrderId() {
		mapper.orderSession(66);
		mapper.orderSession(67);
		mapper.orderSession(68);
		mapper.orderSession(69);
		mapper.orderSession(70);
		mapper.orderSession(71);
		
	}
	
	@Test
	public void testOrderTotalPrice() {
		OrderVO order = new OrderVO();
		order.setId("1234");
		order.setResult("1");
		order.setOseq(22);
		int totalPrice=0;
		List<OrderVO> orderList = mapper.listOrderById(order);
		for(OrderVO orderVO :orderList){
			totalPrice += orderVO.getPrice()*orderVO.getQuantity();
			log.info("-----------total price = "+totalPrice);
	    }
		log.info("-----------total price = "+totalPrice);
	}
}