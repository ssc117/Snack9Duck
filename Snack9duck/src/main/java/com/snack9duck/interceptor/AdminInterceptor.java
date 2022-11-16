package com.snack9duck.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.snack9duck.domain.WorkerVO;




public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		WorkerVO workerVO = (WorkerVO)session.getAttribute("workerUser");
		
		if(workerVO== null) {	// 관리자 계정 아닌 경우
			
			response.sendRedirect("/");	// 메인페이지로 리다이렉트
			
			return false;
			
		}
		
		return true;	// 관리자 계정 로그인 경우(lvo != null && lvo.getAdminCk() == 1)
		
	}
	
}
