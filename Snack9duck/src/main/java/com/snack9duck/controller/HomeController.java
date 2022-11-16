package com.snack9duck.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class HomeController {
	
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("메인페이지 진입");
		
		return "index";
	}
	@GetMapping("/terms_of_service")
	public void termsOfServiceGET() {

		logger.info("이용약관 페이지 진입");

	}
	@GetMapping("/sign_up_privacy")
	public void signUpPrivacyGet() {

		logger.info("개인정보 페이지 진입");

	}
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Dnied : "+auth);
		model.addAttribute("msg","Access Denied");
	}
	
	@GetMapping("login")
	public void loginInput(String error, String logout, Model model) {
		
		log.info("error: "+error);
		log.info("logout: "+logout);
		
		if(error != null)
			model.addAttribute("error","Login Error Check Your Accout");
		if(logout!=null){
			model.addAttribute("logout","Logout!!");
		}
	}
	
	@GetMapping("logout")
	public void logout() {
		log.info("custom logout");
	}
	
}
