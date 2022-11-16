package com.snack9duck.service;

import java.util.List;

import com.snack9duck.domain.CartVO;

public interface CartService {
		//장바구니 리스트 확인
		public List<CartVO> listCart(String userId);
		// 장바구니에 입력
		public void insertCart(CartVO cart);
		
		// 회원 아이디로 전체 제품목록 얻어오기
		public List<CartVO> selectCartByuserid(String userid);
		
		//장바구니 삭제
		public int deleteCart(Long cartnum);
		
		// 장바구니 전체 삭제
		public int deleteCart_All(String userid);
		
		// 장바구니 선택 삭제
		public int selectDelete(int[] cartnum);
		
		// 장바구니 수량 수정
		public int modifyCount(CartVO cart);
		
		public CartVO cartSelectOrder(int cartnum);
		// 탈퇴를 위함
		public int cartviewDrop(String id);
		public int cartDrop(String id);
}
