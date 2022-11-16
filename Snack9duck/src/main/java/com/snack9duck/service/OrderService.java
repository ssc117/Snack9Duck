package com.snack9duck.service;

import java.util.List;

import com.snack9duck.domain.Criteria;
import com.snack9duck.domain.OrderVO;

public interface OrderService {
	// 사용자가 장바구니에서 구독 버튼을 눌렀을 때 값을 가져오는거
		public void insertOrder(String id);
		
		// 구매창에서 결제가 완료됐을 때 --> 지금은 주문 상세 페이지에서 값을  보여주는거  
		public void insertOrderDetail(OrderVO order);
		
		// 사용자가 주문 내역 검색 <-- 구매완료된 구독내역 표시 
		public List<OrderVO> listOrderById(OrderVO order);
		// 결제완료된 구독상품 배송 전 상태 조회 
		public List<Integer> selectSeqOrdering(String id);
		//관리자 모드에서 사용되는 메소드 * *
		public List<OrderVO> listOrder(String member_name);
		// 오더 디테일에서 배송 결과 변경하는 내용
		public void updateOrderResult(int oseq);
		
		public OrderVO orderDesc();
		
		public OrderVO orderSession(int odseq);
		
		public int orderTotalPrice(List<OrderVO> orderList);
		
		public void updateOrderList(List<OrderVO> orderList);
		// 구독 관리에서 씀
		public List<OrderVO> orderViewList(String id);
		// 구독관리 > 구독 취소
		public int orderCancel(int odseq);
		// 페이징 처리
		public List<OrderVO> ordergetListWithPaging(Criteria cri);
		public int getTotal(String id);
		
		// 관리자 계정  전체 주문내역 확인
		public List<OrderVO> adminOrderList();
		// 배송완료로 수정
		public void updateOrderResult3(OrderVO order);
		// 요청사항 업데이트
		public void updateRequest(OrderVO order);
		
		public OrderVO adminOrderModify(int odseq);
		
		public int oneorderDelete(String id);
		// 탈퇴를 위함
		public int orderviewDrop(String id);
		public int ordersDrop(String id);
		

}
