package com.snack9duck.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
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
	
}
