package com.snack9duck.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.snack9duck.domain.CartVO;
import com.snack9duck.domain.MemberVO;
import com.snack9duck.domain.OrderVO;
import com.snack9duck.domain.ProductVO;
import com.snack9duck.domain.ReviewVO;
import com.snack9duck.service.CartService;
import com.snack9duck.service.OrderService;
import com.snack9duck.service.ProductService;
import com.snack9duck.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor

public class ProductController {

	private ProductService service;
	private CartService cartService;
	private OrderService orderService;
	private ReviewService reviewService;

	@RequestMapping(value = "/gudok_list", method = RequestMethod.GET)
	public void goduk_list(@RequestParam("kind") String kind, Model model) throws Exception {
		// String listKindProduct = kind;

		model.addAttribute("listKindProduct", service.listKindProduct(kind));

		log.info("gudok_list Kind 요청 번호  : " + kind);
		log.info("gudok_list Kind 요청 상품 리스트  : " + model);
		if (kind.equals("4")) {
			model.addAttribute("listKindProduct",service.getList());
		}

	}

	@GetMapping("/product_detail")
	public void product_detail(@RequestParam("prodnum") long prodnum, Model model, HttpServletRequest request) {
		model.addAttribute("product", service.get(prodnum));
		ProductVO product =  service.get(prodnum);
		HttpSession session = request.getSession();
		List<ReviewVO> reviewList = reviewService.getReview((int) prodnum);
		model.addAttribute("reviewList", reviewList);
		session.setAttribute("reviewList", reviewList);
		session.setAttribute("prodnum", (int) prodnum);
		session.setAttribute("product", product);
		log.info("상품 상세 페이지 진입" + model);
		session.removeAttribute("cartnum");
	}

	//장바구니에 담기
	@PostMapping("/cart_insert")
	public String cartInsert(CartVO cart, RedirectAttributes rttr) throws Exception {
		cartService.insertCart(cart);
		rttr.addFlashAttribute("result", "success");
		log.info("카트 담기 완료" + cart);
		return "redirect:/cart/cart";
	}
	//구독하기 버튼
	@PostMapping("/order_insert")
	public String orderInsert(HttpServletRequest request, OrderVO order, RedirectAttributes rttr) throws Exception {
		HttpSession session = request.getSession();
		orderService.insertOrder(((MemberVO) session.getAttribute("loginUser")).getId());
		OrderVO orderVO = orderService.orderDesc();
		order.setId(orderVO.getId());
		order.setOseq(orderVO.getOseq());
		orderService.insertOrderDetail(order);
		order.setResult("1");

		session.setAttribute("order", order);
		return "redirect:/order/order";
	}
	@GetMapping("/reviewAll")
	public void review_all(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ProductVO product = (ProductVO)session.getAttribute("product");
		
		model.addAttribute("product",product);
		if(product.getProdnum()>0) {
			List<ReviewVO> reviewList = reviewService.getReview((int) product.getProdnum());
			model.addAttribute("reviewList", reviewList);
		}
		else {
			List<ReviewVO> reviewList = reviewService.allReview();
			model.addAttribute("reviewList", reviewList);
		}

	}

	@GetMapping("/reviewwrite")
	public void review_write_get(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("loginUser");
		ProductVO product = (ProductVO) session.getAttribute("product");
		model.addAttribute("product",product);
		model.addAttribute("prodnum",product.getProdnum());
	}
	@PostMapping("/reviewwrite")
	public String review_write_post(ReviewVO review, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("loginUser");
//		ProductVO product = (ProductVO) session.getAttribute("product");
		reviewService.insertReview(review);
		return "redirect:/product/reviewAll";
	}
}
