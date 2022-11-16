package com.snack9duck.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.snack9duck.domain.Criteria;
import com.snack9duck.domain.MemberVO;
import com.snack9duck.domain.PageDTO;
import com.snack9duck.domain.QnaVO;
import com.snack9duck.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna/*")
@AllArgsConstructor
public class QnaController {

	private QnaService service;
	//유저 qna 리스트 받기
//	@RequestMapping(value="/qnaList", method = RequestMethod.GET)
//	public void QnaList(HttpServletRequest request ,Model model) throws Exception {
//		HttpSession session = request.getSession();
//		String id = ((MemberVO)session.getAttribute("loginUser")).getId();
//		log.info("id: "+id);
//		model.addAttribute("qnaList",service.getQnaList(id));
//	}
	@RequestMapping(value="/qnaList", method = RequestMethod.GET)
	public void QnaList(HttpServletRequest request ,Model model, Criteria cri) throws Exception {
		HttpSession session = request.getSession();
		String id = ((MemberVO)session.getAttribute("loginUser")).getId();
		log.info("id: "+id);
		cri.setId(id);
		model.addAttribute("qnaList",service.getQnaList(cri));
		//model.addAttribute("qnaList",service.getListWithPaging(cri));
		int total = service.getTotalCount(id);
		model.addAttribute("pageMaker", new PageDTO(cri,total));  
		//model.addAttribute("qnaList", service.getList(cri));
		//model.addAttribute("qnaList",service.getQnaList(id));
		
	}
	//qna 상세 페이지 진입
	@GetMapping("/qnaView")
	public void qnaView(@RequestParam("qseq")long qseq, Model model,@ModelAttribute("cri") Criteria cri) {
		model.addAttribute("qna",service.get(qseq));
		log.info("qna 상세보기" + model);
	}
	// qna 작성 페이지 진입
	@RequestMapping(value="/qnaWrite", method = { RequestMethod.GET})
	public void qnaWrite(QnaVO qna) throws Exception{
	log.info("qna 작성 페이지 진입");
	}
	// qna 작성 기능
	@PostMapping("/qnaWrite")
	public String qnaWritePOST(QnaVO qna, RedirectAttributes rttr) throws Exception {
	service.register(qna);
	rttr.addFlashAttribute("result","Write success");
	log.info("qna 작성 완료" + qna);
	return "redirect:/qna/qnaList";
	}
}
