package com.snack9duck.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.snack9duck.domain.CartVO;
import com.snack9duck.mapper.CartMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class CartServiceImpl implements CartService {

	private CartMapper mapper;
	
	@Override
	public List<CartVO> listCart(String userId) {
		log.info("cart List get.....");
		return mapper.listCart(userId);
	}

	@Override
	public void insertCart(CartVO cart) {
		log.info("cart insert....." + cart);
		mapper.insertCart(cart);

	}

	@Override
	public List<CartVO> selectCartByuserid(String userid) {
		log.info("selectCartByuserid get.....");
		return mapper.selectCartByuserid(userid);
	}

	@Override
	public int deleteCart(Long cartnum) {
		log.info("cart delete....." + cartnum);
		return mapper.deleteCart(cartnum);
	}

	@Override
	public int deleteCart_All(String userid) {
		log.info("cart all delete....." + userid);
		return mapper.deleteCart_All(userid);
	}

	@Override 
	public int selectDelete(int[] cartnum) {
		int count = 0;
		for (int i = 0; i < cartnum.length; i++) {
			mapper.selectDelete(cartnum[i]);
			count++;
		}
		return count;
	}

	@Override
	public int modifyCount(CartVO cart) {
		log.info("cart modifyCount....."+cart);
		return mapper.modifyCount(cart);
	}

	@Override
	public CartVO cartSelectOrder(int cartnum) {
		
		return mapper.cartSelectOrder(cartnum);
	}

}
