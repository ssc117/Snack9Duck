package com.snack9duck.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.snack9duck.domain.Criteria;
import com.snack9duck.domain.MemberVO;
import com.snack9duck.domain.OrderVO;
import com.snack9duck.domain.PageDTO;
import com.snack9duck.service.CartService;
import com.snack9duck.service.MemberService;
import com.snack9duck.service.OrderService;
import com.snack9duck.service.QnaService;
import com.snack9duck.service.ReviewService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {

	
	
	@Autowired
	private MemberService service;
	private OrderService orderService;
	private CartService cartService;
	private QnaService qnaService;
	private ReviewService reviewService;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	

	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public void joinGET() {

		logger.info("회원가입 페이지 진입");

	}
	@PostMapping("/joinForm")
	//@RequestMapping(value = "/joinForm", method = RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception{
		logger.info("회원가입 진입");
		service.insertMember(member);
		
		logger.info("회원가입 성공");

		return "redirect:/member/join_ok";
	}

	
	//아이디 중복체크
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {

		int cnt = service.idCheck(id);

		return cnt;

	}
	@RequestMapping(value = "join_ok", method = RequestMethod.GET)
	public void joinOKGET(MemberVO member, Model model) {
		model.addAttribute("member",service.registerForm(member));
		logger.info("회원가입 완료 페이지 진입");

	}
	@GetMapping("/terms_of_service")
	public void termsOfServiceGET() {

		logger.info("이용약관 페이지 진입");

	}
	@GetMapping("/sign_up_privacy")
	public void signUpPrivacyGet() {

		logger.info("개인정보 페이지 진입");

	}

	//로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGET() {

		logger.info("로그인 페이지 진입");

	}
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{

		HttpSession session = request.getSession();
		MemberVO memberVO = service.memberLogin(member);
		
		if(memberVO == null) {
			int result=0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login";
		}
		//session.invalidate();
		session.removeAttribute("id");
		session.setAttribute("loginUser", memberVO);

		return "redirect:/";
	}
	
	 @RequestMapping(value="logout", method=RequestMethod.GET)
	    public String logoutMainGET(HttpServletRequest request) throws Exception{
		 
		 logger.info("logoutMainGET메서드 진입");
	        
	        HttpSession session = request.getSession();
			session.invalidate();
	        return "redirect:/";
	    }

	@GetMapping("/find_id_form")
	public void findIdFormGET() {

		logger.info("아이디 찾기 페이지 진입");

	}
	
	@PostMapping("/find_id_form")
	public String findIdFormPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
	
		HttpSession session = request.getSession();
		MemberVO memberVO = service.findId(member);
		
		if(service.findId(member)==null) {
			int result=0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/find_id_form";
		}
		session.removeAttribute("id");
		session.setAttribute("findId", memberVO);

		return "redirect:/member/find_id";
	}
	
	@GetMapping("/find_id")
	public void findIdGET(HttpServletRequest request, MemberVO member, Model model) {
		HttpSession session = request.getSession();
		member = (MemberVO) session.getAttribute("findId");
		model.addAttribute("member",member);
		
		
		logger.info("아이디 찾기 성공");
	}

	@GetMapping("/find_pwd_form")
	public void findPwdFormGET() {

		logger.info("비밀번호 찾기 페이지 진입");

	}
	
	@PostMapping("/find_pwd_form")
	//@RequestMapping(value = "/joinForm", method = RequestMethod.POST)
	public String findPwdFormPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
	
		HttpSession session = request.getSession();
		MemberVO memberVO = service.findPwd(member);
		
		if(service.findPwd(member)==null) {
			int result=0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/find_pwd_form";
		}
		session.removeAttribute("id");
		session.setAttribute("findPwd", memberVO);

		return "redirect:/member/find_pwd";
	}
	
	@GetMapping("/find_pwd")
	public void findPwdGET(HttpServletRequest request, MemberVO member, Model model) {
		HttpSession session = request.getSession();
		member = (MemberVO) session.getAttribute("findPwd");
		model.addAttribute("member",member);
		
		
		logger.info("아이디 찾기 성공");
	}
	
	@GetMapping("/my_page_form")
	public void findMyPageFormGET(HttpServletRequest request, MemberVO member,  Model model) {
		HttpSession session = request.getSession();
		member = (MemberVO) session.getAttribute("loginUser");
		model.addAttribute("member",member);
		logger.info("마이페이지 진입");

	}
	
	@PostMapping("/my_page_form")
	public String findMyPageFormPost(HttpServletRequest request, MemberVO member) throws Exception{
	
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		service.updateMember(memberVO);
		member = service.getMember(memberVO.getId());
		
		
		
		session.removeAttribute("loginUser");
		session.setAttribute("loginUser", member);
		return "member/my_page";

	}
	
	@GetMapping("/my_page")
	public void findMyPageGET(HttpServletRequest request, MemberVO member) {
		HttpSession session = request.getSession();
		member = (MemberVO) session.getAttribute("loginUser");
		
		logger.info("마이페이지 수정  진입");

	}
	
	@PostMapping("/my_page")
	public String findMyPagePost(HttpServletRequest request, MemberVO memberVO) throws Exception{
	
		HttpSession session = request.getSession();
		
		
		
		service.updateMember(memberVO);	
		session.setAttribute("loginUser", memberVO);
		
		return "redirect:/";
	}
	
	@GetMapping("/member_delete")
	public void findMemberDeletGet(HttpServletRequest request, MemberVO member) throws Exception{
		HttpSession session = request.getSession();
		member = (MemberVO) session.getAttribute("loginUser");
		
	}
	@PostMapping("/member_delete")
	public String findMemberDeletePost(HttpServletRequest request, MemberVO member) throws Exception{
		HttpSession session = request.getSession();
		member = (MemberVO) session.getAttribute("loginUser");
		
//		orderService.orderviewDrop(id);
//		orderService.ordersDrop(id);
//		cartService.cartDrop(id);
//		cartService.cartviewDrop(id);
//		qnaService.qnaDrop(id);
//		reviewService.reviewDrop(id);
		service.deleteMember(member);
		session.removeAttribute("loginUser");
		
		return "redirect:/";
	}
// ******************구독관리*************************************
	@RequestMapping(value = "/gudok_setting", method = RequestMethod.GET)
	public void gudokSetting(HttpServletRequest request, MemberVO member, Model model, 
					OrderVO order, Criteria cri,@RequestParam(value="odseq",
					required=false)int[] odseq) {
		HttpSession session = request.getSession();
		member = (MemberVO) session.getAttribute("loginUser");
		//model.addAttribute("gudokList",orderService.orderViewList(member.getId()));
		cri.setId(member.getId());
		//페이지 진입 시 result 1로 되어있는 항목 삭제
		orderService.oneorderDelete(member.getId());
		model.addAttribute("gudokList",orderService.ordergetListWithPaging(cri));
		int total = orderService.getTotal(member.getId());
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		
		
	}
	@PostMapping("/gudok_cancel")
	public String gudokCancel(int odseq) {
		orderService.orderCancel(odseq);
		logger.info(odseq+"번 구독 취소 완료");
		return "redirect:/member/gudok_setting"; 
	}
}
