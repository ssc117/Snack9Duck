package com.snack9duck.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.snack9duck.service.EventService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/event")
@AllArgsConstructor
public class EventController {
	
	private EventService service;
	
	//진행 중인 이벤트 목록 출력
	@RequestMapping(value="/event_main", method = RequestMethod.GET)
	public void getEventList(Model model) throws Exception{
	model.addAttribute("eventList",service.getList());
	log.info("이벤트 목록 요청  : " + model);
	}
	//종료된 이벤트 목록 출력
	@RequestMapping(value="/event_main_end", method = RequestMethod.GET)
	public void getendEventList(Model model) throws Exception{
	model.addAttribute("endEventList",service.endEventList());
	log.info("종료된 이벤트 목록 요청  : " + model);
	}
	//이벤트 상세보기
	@GetMapping("event_detail")
	public void event_detail(@RequestParam("eventno") long eventno,
			Model model) {
		model.addAttribute("event_detail",service.get(eventno));
	}	
}
