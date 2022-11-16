package com.snack9duck.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.snack9duck.domain.OrderVO;
import com.snack9duck.service.CartService;
import com.snack9duck.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order")
@AllArgsConstructor
public class OrderController {
   private OrderService service;
   private CartService cartService;

   @RequestMapping(value ="order", method = { RequestMethod.GET, RequestMethod.POST })
      public void OrderListGet(HttpServletRequest request, Model model, OrderVO order) {
         HttpSession session = request.getSession();
         order=(OrderVO)session.getAttribute("order");
         List<OrderVO> orderList = service.listOrderById(order);
         model.addAttribute("orderList", orderList);
         model.addAttribute("totalPrice",service.orderTotalPrice(orderList));
      }
   
   @RequestMapping(value="order_submit", method = { RequestMethod.GET, RequestMethod.POST })
      public String OrderSubmitPost(HttpServletRequest request, Model model, OrderVO order){
        HttpSession session = request.getSession();
         order=(OrderVO)session.getAttribute("order");
         int[] cartnum=(int[]) session.getAttribute("cartnum");
         if(cartnum!=null) {
            for(int i=0; i<cartnum.length; i++) {
            	cartService.deleteCart((long) cartnum[i]);
            }
         }
         List<OrderVO> orderList = service.listOrderById(order);
         service.updateOrderList(orderList);
         
      return "redirect:/member/gudok_setting";
   }
}