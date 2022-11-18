package com.snack9duck.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.snack9duck.domain.Criteria;
import com.snack9duck.domain.PageDTO;
import com.snack9duck.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice")
@AllArgsConstructor
public class NoticeController {

	private NoticeService service;
	//공지사항 목록 출력
	@RequestMapping(value ="/notice_main", method = RequestMethod.GET)
	public void getNoticeList(Criteria cri, Model model) throws Exception {
		model.addAttribute("noticeList",service.getList(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker",new PageDTO(cri,total));
		log.info("공지사항 목록 요청 :"+model);
	}

	//공지사항 상세 내용 출력
	@GetMapping("notice_detail")
	public void notice_Detail(@RequestParam("noticeno")long noticeno,
			@ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("notice_detail",service.get(noticeno));
	}	
}
