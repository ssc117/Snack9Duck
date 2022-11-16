package com.snack9duck.controller;

import java.io.File;

import javax.annotation.Resource;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.snack9duck.domain.EventVO;
import com.snack9duck.domain.NoticeVO;
import com.snack9duck.domain.ProductVO;
import com.snack9duck.domain.QnaVO;
import com.snack9duck.domain.WorkerVO;
import com.snack9duck.service.EventService;
import com.snack9duck.service.MemberService;
import com.snack9duck.service.NoticeService;
import com.snack9duck.service.OrderService;
import com.snack9duck.service.ProductService;
import com.snack9duck.service.QnaService;
import com.snack9duck.service.WorkerService;
import com.snack9duck.util.UploadFileUtil;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class WorkerController {

	@Autowired
	private WorkerService workerService;
	private EventService eventService;
	private NoticeService noticeService;
	private QnaService qnaService;
	private ProductService productService;
	private MemberService memberService;
	private OrderService orderService;
	
	@Resource(name="uploadPath")
	private String uploadPath;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping(value = "admin_login_form", method = RequestMethod.GET)
	public void adminLoginGET() {

		logger.info("관리자 로그인 페이지 진입");

	}

	@RequestMapping(value = "adminPage", method = RequestMethod.GET)
	public void adminPageGET() {

		logger.info("관리자 페이지 진입");

	}

	@RequestMapping(value = "admin_login_form", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, WorkerVO worker, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		WorkerVO workerVo = workerService.adminLogin(worker);

		if (workerVo == null) {
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/admin/admin_login_form";
		}
		session.setAttribute("workerUser", workerVo);

		return "redirect:/admin/adminPage";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String adminLogoutMainGET(HttpServletRequest request) throws Exception {

		logger.info("adminLogoutMainGET메서드 진입");

		HttpSession session = request.getSession();

		return "redirect:/";
	}

	// ***************************** 관리자 이벤트 관리 **********************************
	// 221104 이벤트 CRUD 구현 완료
	// admin Event 관리 페이지 진입
	@RequestMapping(value = "event/admin_event_main", method = RequestMethod.GET)
	public void adminEventGET(Model model) throws Exception {
		model.addAttribute("eventList", eventService.getAllList());
		logger.info("관리자 이벤트 관리 페이지 진입");
	}
	// admin Event 등록 페이지 진입
	@RequestMapping(value = "event/admin_event_write",method = { RequestMethod.GET, RequestMethod.POST })
	public void adminEventWrite(EventVO event) throws Exception {
		logger.info("관리자 이벤트 등록 페이지 진입");
	}
	// Event 등록 기능
	@PostMapping("event/admin_event_Write")
	public String adminEventWritePOST(EventVO event, RedirectAttributes rttr, MultipartFile file,MultipartFile file2) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtil.calcPath(imgUploadPath);
		String fileName =  UploadFileUtil.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);   
		String   fileName2 =  UploadFileUtil.fileUpload(imgUploadPath, file2.getOriginalFilename(), file2.getBytes(), ymdPath);
		
		event.setImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		event.setMainimg(File.separator +"imgUpload" + ymdPath + File.separator + fileName2);
		eventService.register(event);
		rttr.addFlashAttribute("result", "Write success");
		logger.info("관리자 이벤트 등록 완료 : " + event);
		return "redirect:/admin/event/admin_event_main";
	}	

	// admin Event 수정 페이지 진입
	@RequestMapping(value = "event/admin_event_Update", method = RequestMethod.GET)
	public void adminEventUpdate(@RequestParam("eventno") long eventno, Model model) throws Exception {
		model.addAttribute("event", eventService.get(eventno));
		logger.info("관리자 이벤트 수정 페이지 진입");
	}
	// admin event 수정 기능
	@PostMapping("event/admin_event_Update")
	public String adminEventUpdatePOST(EventVO event, RedirectAttributes rttr, MultipartFile file,MultipartFile file2) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtil.calcPath(imgUploadPath);
		String	fileName =  UploadFileUtil.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);   
		String	fileName2 =  UploadFileUtil.fileUpload(imgUploadPath, file2.getOriginalFilename(), file2.getBytes(), ymdPath);   
		
		event.setImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		event.setMainimg(File.separator +"imgUpload" + ymdPath + File.separator + fileName2);
		eventService.modify(event);
		rttr.addFlashAttribute("result", "update success");
		logger.info("관리자 이벤트 수정 완료 : " + event);
		return "redirect:/admin/event/admin_event_main";
	}
	// admin 이벤트 삭제 기능
	@PostMapping("event/delete")
	public String adminEventDelete(@RequestParam("eventno") long eventno, RedirectAttributes rttr) throws Exception {
		eventService.delete(eventno);
		rttr.addFlashAttribute("result", "delete success");
		logger.info("관리자 이벤트 삭제 완료 : " + eventno);
		return "redirect:/admin/event/admin_event_main";
	}

	// ***************************** 관리자 공지사항 관리 **********************************
	// 221101 공지사항 CRUD 구현 완료
	// admin 공지사항 관리 페이지 진입
	@RequestMapping(value = "notice/admin_notice_main", method = RequestMethod.GET)
	public void adminNoticeGET(Model model) throws Exception {
		model.addAttribute("noticeList", noticeService.getList());
		logger.info("관리자 공지사항 관리 페이지 진입");
	}

	// admin 공지사항 작성 페이지 진입
	@RequestMapping(value = "notice/admin_notice_write", method = RequestMethod.GET)
	public void adminNoticeWriteView() throws Exception {
		logger.info("관리자 공지사항 작성 페이지 진입");
	}

	// admin 공지사항 작성 기능
	@PostMapping("notice/admin_notice_write")
	public String adminNoticeWritePOST(NoticeVO notice, RedirectAttributes rttr) throws Exception {
		noticeService.register(notice);
		rttr.addFlashAttribute("result", "Write success");
		logger.info("관리자 공지사항 작성 완료 : " + notice);
		return "redirect:/admin/notice/admin_notice_main";
	}
//admin 공지사항 작성 기능 <-- 이 방식으로도 사용 가능
//	@RequestMapping(value ="notice/admin_notice_write", method = RequestMethod.POST)
//	public String adminNoticeWritePOST(NoticeVO notice, RedirectAttributes rttr ) throws Exception {
//		noticeService.register(notice);
//		rttr.addFlashAttribute("result", "Write success");
//		logger.info("괸라자 공지사항 작성 완료 : " + notice);
//		return "redirect:/admin/notice/admin_notice_main";
//	}

	// admin 공지사항 수정 페이지 진입
	@GetMapping(value = "notice/admin_notice_Update")
	public void adminNoticeUpdate(@RequestParam("noticeno") long noticeno, Model model) throws Exception {
		model.addAttribute("notice", noticeService.get(noticeno));
		logger.info("관리자 공지사항 수정 페이지 진입");
	}

	// admin 공지사항 수정 기능
	@PostMapping("notice/admin_notice_Update")
	public String adminNoticeUpdatePOST(NoticeVO notice, RedirectAttributes rttr) throws Exception {
		noticeService.modify(notice);
		rttr.addFlashAttribute("result", "update success");
		logger.info("관리자 공지사항 수정 완료 : " + notice);
		return "redirect:/admin/notice/admin_notice_main";
	}

	// admin 공지사항 삭제 기능
	@PostMapping("notice/delete")
	public String adminNoticeDelete(@RequestParam("noticeno") long noticeno, RedirectAttributes rttr) throws Exception {
		noticeService.delete(noticeno);
		rttr.addFlashAttribute("result", "delete success");
		logger.info("관리자 공지사항 삭제 완료 : " + noticeno);
		return "redirect:/admin/notice/admin_notice_main";
	}

	// ***************************** 관리자 QNA 관리 **********************************
	// 221102 RUD 기능 구현 완료, Write 기능은 사용자 Controller에서 만들어야함! <-- 1107완료
	// 관리자 QNA 관리 페이지 진입
	@RequestMapping("qna/qnaList")
	public void adminQnaGET(Model model) throws Exception {
		model.addAttribute("qnaList", qnaService.getList());
		logger.info("관리자 QNA 관리 페이지 진입");
	}

	// admin QNA 상세 페이지 진입
	@GetMapping(value = "qna/qnaView")
	public void adminQnaView(@RequestParam("qseq") long qseq, Model model) throws Exception {
		model.addAttribute("qna", qnaService.get(qseq));
		logger.info("관리자 QNA 상세 페이지 진입");
	}

	// admin QNA 답변,수정 페이지 진입
	@GetMapping(value = "qna/qnaUpdate")
	public void adminQnaUpdate(@RequestParam("qseq") long qseq, Model model) throws Exception {
		model.addAttribute("qna", qnaService.get(qseq));
		logger.info("관리자 QNA 수정 페이지 진입");
	}

	// admin QNA 답변, 답변 수정 기능
	@PostMapping("qna/qnaUpdate")
	public String adminQnaAnswerPOST(QnaVO qna, RedirectAttributes rttr) throws Exception {
		qnaService.updateQnaAnswer(qna);
		rttr.addFlashAttribute("result", "answer success");
		logger.info("관리자 공지사항 수정 완료 : " + qna);
		return "redirect:/admin/qna/qnaList";
	}

	// admin QNA 삭제 기능
	// @PostMapping("qna/delete")
	@RequestMapping(value = "qna/delete", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminQnaDelete(@RequestParam("qseq") long qseq, RedirectAttributes rttr) throws Exception {
		qnaService.delete(qseq);
		rttr.addFlashAttribute("result", "delete success");
		logger.info("관리자 QNA 삭제 완료 : " + qseq);
		return "redirect:/admin/qna/qnaList";
	}

	// ***************************** 관리자 Product 관리 **********************************
	// 221107 - CRUD 구현 완료
	// admin 상품 관리 페이지 진입
	@RequestMapping(value = "product/admin_product_main", method = RequestMethod.GET)
	public void adminProductGET(Model model) throws Exception {
		model.addAttribute("productList", productService.getAllList());
		logger.info("관리자 상품 관리 페이지 진입");
	}
	// admin 상품 등록 페이지 진입
		@RequestMapping(value = "product/admin_product_Write",method = { RequestMethod.GET})
		public void adminProductWrite(ProductVO product) throws Exception {
			logger.info("관리자 상품 등록 페이지 진입");
		}
		
	// 상품 등록 기능
	@PostMapping("product/admin_product_Write")
	public String adminProductWritePOST(ProductVO product, RedirectAttributes rttr, MultipartFile file, MultipartFile file2)
			throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtil.calcPath(imgUploadPath);
		String fileName = UploadFileUtil.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
				ymdPath);
		String fileName2 = UploadFileUtil.fileUpload(imgUploadPath, file2.getOriginalFilename(), file2.getBytes(),
				ymdPath);

		product.setImage(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		product.setDetail_image(File.separator + "imgUpload" + ymdPath + File.separator + fileName2);
		productService.register(product);
		rttr.addFlashAttribute("result", "Write success");
		logger.info("관리자 상품 등록 완료 : " + product);
		return "redirect:/admin/product/admin_product_main";
	}
	
	// admin 상품 수정 페이지 진입
	@RequestMapping(value = "product/admin_product_Update", method = RequestMethod.GET)
	public void adminProductUpdate(@RequestParam("prodnum") long prodnum, Model model ) throws Exception {
		model.addAttribute("product", productService.get(prodnum));
		logger.info("관리자 이벤트 수정 페이지 진입");
	}

	// admin 상품 수정 기능
	@PostMapping("product/admin_product_Update")
	public String adminProductPOST(ProductVO product, RedirectAttributes rttr, MultipartFile file, MultipartFile file2) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtil.calcPath(imgUploadPath);
		String fileName = UploadFileUtil.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
				ymdPath);
		String fileName2 = UploadFileUtil.fileUpload(imgUploadPath, file2.getOriginalFilename(), file2.getBytes(),
				ymdPath);
		product.setImage(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		product.setDetail_image(File.separator + "imgUpload" + ymdPath + File.separator + fileName2);
		productService.modify(product);
		rttr.addFlashAttribute("result", "product update success");
		logger.info("관리자 상품정보 수정 완료 : " + product);
		return "redirect:/admin/product/admin_product_main";
	}

	// admin 상품 삭제 기능
	@RequestMapping(value = "product/delete", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminProductDelete(@RequestParam("prodnum") long prodnum, RedirectAttributes rttr) throws Exception {
		productService.delete(prodnum);
		rttr.addFlashAttribute("result", "delete success");
		logger.info("관리자 상품정보 삭제 완료 : " + prodnum);
		return "redirect:/admin/product/admin_product_main";
	}
	// ***************************** 관리자 회원 관리 **********************************
	// admin 회원 관리 페이지 진입
	@RequestMapping(value = "memberList", method = RequestMethod.GET)
	public void adminMemberGET(Model model) throws Exception {
		model.addAttribute("memberList", memberService.listAllMember());
		logger.info("관리자 회원 관리 페이지 진입");
	}
	@RequestMapping(value = "memberDelete", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminMemberDelete(@RequestParam(value="id",
		required=false) String[] id) throws Exception {
		memberService.multiDelete(id);
		//rttr.addFlashAttribute("result", "delete success");
		logger.info("관리자 사용자 계정 삭제 완료 : " + id);
		return "redirect:/admin/memberList";
	}
	
	//******************관리자 구독관리**********************************************
	@RequestMapping(value = "order/admin_order_main", method = RequestMethod.GET)
	public void orderGET(Model model) throws Exception {
		model.addAttribute("orderList", orderService.adminOrderList());
		logger.info("관리자 구독 관리 페이지 진입");
	}
	
}
