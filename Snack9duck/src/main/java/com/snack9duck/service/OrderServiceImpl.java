package com.snack9duck.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.snack9duck.domain.Criteria;
import com.snack9duck.domain.OrderVO;

import com.snack9duck.mapper.OrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {
	
	private OrderMapper mapper;
	
	
	@Override
	public void insertOrder(String id) {
		log.info("Order insertOrder.....");
		mapper.insertOrder(id);
	}

	@Override
	public void insertOrderDetail(OrderVO order) {
		log.info("Order insertOrderDetail.....");
		mapper.insertOrderDetail(order);
	}

	@Override
	public List<OrderVO> listOrderById(OrderVO order) {
		log.info("Order listOrderById.....");
		return mapper.listOrderById(order);
	}

	@Override
	public List<Integer> selectSeqOrdering(String id) {
		log.info("Order selectSeqOrdering.....");
		
		return mapper.selectSeqOrdering(id);
	}

	@Override
	public List<OrderVO> listOrder(String member_name) {
		log.info("Order listOrder.....");
		
		return mapper.listOrder(member_name);
	}

	@Override
	public void updateOrderResult(int oseq) {
		log.info("Order updateOrderResult.....");
		mapper.updateOrderResult(oseq);
		
	}

	@Override
	public OrderVO orderDesc() {
		
		return mapper.orderDesc();
	}

	@Override
	public OrderVO orderSession(int odseq) {
		
		return mapper.orderSession(odseq);
	}

	@Override
	public int orderTotalPrice(List<OrderVO> orderList) {
		int totalPrice = 0;
		for(OrderVO orderVO :orderList){
			totalPrice += orderVO.getPrice()*orderVO.getQuantity();
			log.info("-----------total price = "+totalPrice);
	    }
		return totalPrice;
	}
	//구독 관리에서 씀
	@Override
	public List<OrderVO> orderViewList(String id) {
		
		return mapper.orderViewList(id);
	}

	// 구독 취소
	@Override
	public int orderCancel(int odseq) {
		
		return mapper.orderCancel(odseq);
	}
	//관리자 계정에서 모든 주문내역 확인
	@Override
	public List<OrderVO> adminOrderList() {
		
		return mapper.adminOrderList();
	}
	@Override
	public void updateOrderList(List<OrderVO> orderList) {
	      for(OrderVO orderVO :orderList){
	         mapper.updateOrderResult(orderVO.getOdseq());
	         
	       }
	   }
	//요청사항 업데이트
	@Override
	public void updateRequest(OrderVO order) {
		mapper.updateRequest(order);	
	}
	
	@Override
	public void updateOrderResult3(OrderVO order) {
		mapper.updateOrderResult3(order);
		
	}
	// 페이징 처리
	@Override
	public List<OrderVO> ordergetListWithPaging(Criteria cri) {
		log.info("getList with Criteria: " + cri);
		return mapper.ordergetListWithPaging(cri);
	}

	@Override
	public int getTotal(String id) {
		log.info("get total count");
		return mapper.ordergetTotalCount(id);
	}

	@Override
	public OrderVO adminOrderModify(int odseq) {
		
		return mapper.adminOrderModify(odseq);
	}

	@Override
	public int oneorderDelete(String id) {
		
		return mapper.oneorderDelete(id);
	}

	@Override
	public int orderviewDrop(String id) {
		
		return mapper.orderviewDrop(id);
	}

	@Override
	public int ordersDrop(String id) {
		
		return mapper.ordersDrop(id);
	}

	

	

//	@Override
//	public void cartInsert(List<OrderVO> orderList) {
//		for(OrderVO orderVO :orderList){
//			orderVO.setProdnum(cartMapper.cartSelectOrder(cart).getProdnum());
//			orderVO.setQuantity(cartMapper.cartSelectOrder(cart).getQuantity());
//		}
//
//	}
	

}
