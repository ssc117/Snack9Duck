package com.snack9duck.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.snack9duck.domain.CartVO;
import com.snack9duck.domain.MemberVO;
import com.snack9duck.domain.OrderVO;
import com.snack9duck.service.CartService;
import com.snack9duck.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cart")
@AllArgsConstructor
public class CartController {
	
	private CartService service;
	private OrderService orderService;
	
	//장바구니 진입 
	@RequestMapping(value ="cart", method = { RequestMethod.GET, RequestMethod.POST })
	public void cartListGet(HttpServletRequest request, Model model, CartVO cart) {
		HttpSession session = request.getSession();
		String id =  ((MemberVO)session.getAttribute("loginUser")).getId();
		model.addAttribute("cartList",service.selectCartByuserid(id));
		log.info("장바구니 진입 id:"+id);
	} //장바구니 단일 삭제
	@RequestMapping(value="/cart_delete", method=RequestMethod.GET)
	public String cartDelete(@RequestParam("cartnum")long cartnum,
			RedirectAttributes rttr) {
		service.deleteCart(cartnum);
		rttr.addFlashAttribute("result", "delete success");
		log.info("장바구니 삭제 완료 " + cartnum);
		return "redirect:/cart/cart";
	}//장바구니 선택 삭제
	@RequestMapping(value="/cart_select_delete", method = { RequestMethod.GET, RequestMethod.POST })
	public String cartSelectDelete(@RequestParam(value="cartnum",
		required=false)int[] cartnum) throws Exception{
		log.info("장바구니 선택 삭제 완료 " + cartnum);
		 service.selectDelete(cartnum);
		return "redirect:/cart/cart";
	}
	//***********************장바구니 선택 구독하기 버튼*************************
	@PostMapping("/order_insert")
	public String orderInsert(HttpServletRequest request, OrderVO order, CartVO cart, 
			@RequestParam(value="cartnum", required=false)int[] cartnum) throws Exception {
		HttpSession session = request.getSession();
		orderService.insertOrder(((MemberVO) session.getAttribute("loginUser")).getId());
		
		OrderVO orderVO = orderService.orderDesc(); //방금 
		
		
		order.setId(orderVO.getId());
		order.setOseq(orderVO.getOseq());

		
		order.setResult("1");
		for(int i=0; i<cartnum.length; i++) {
			order.setProdnum(service.cartSelectOrder(cartnum[i]).getProdnum());
			order.setQuantity(service.cartSelectOrder(cartnum[i]).getQuantity());
			orderService.insertOrderDetail(order);
		}
		session.setAttribute("cartnum", cartnum);
		session.setAttribute("order", order);
//		return "redirect:/cart/cart";
		return "redirect:/order/order";
	}
	//장바구니 비우기
		@RequestMapping(value="/cart_all_delete", 
				method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteCart_All(String id) throws Exception{
			service.deleteCart_All(id);
			log.info(id +"계정의 장바구니 전체 삭제 완료 " );
			return "redirect:/cart/cart";
		}
		
	//장바구니 수량 수정
	@RequestMapping(value = "/cart_quantity", method = { RequestMethod.GET, RequestMethod.POST })
	public String cartQuantityUpdown(CartVO cart, String updown, @RequestParam("cartnum") int cartnum, int quantity) {
		if (updown.equals("up")) {
			cart.setCartnum(cartnum);
			cart.setQuantity(quantity + 1);
			service.modifyCount(cart);
		} else {
			cart.setCartnum(cartnum);
			cart.setQuantity(quantity - 1);
			service.modifyCount(cart);
		}
		log.info("장바구니 번호" + cartnum);
		return "redirect:/cart/cart";
	}
}
