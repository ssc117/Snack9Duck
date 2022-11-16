<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<footer>
	
    <div id="footer_menu_box">
   
    
        <nav id="footer_menu">
            <ul>
            	<c:if test="${empty sessionScope.loginUser.id}">
            	<c:choose>	
                	<c:when test="${empty sessionScope.workerUser}">
            			<li><a href="/admin/admin_login_form">관리자 로그인</a></li>
            		</c:when>
            		<c:otherwise>
                		<li><a href="/member/logout">관리자 로그아웃</a></li> 
                	</c:otherwise>
            	</c:choose>
            	</c:if>
            	
                <li><a href="/event/event_main">이벤트</a></li>
                <li><a href="/notice/notice_main">공지사항</a></li>
                <li><a href="javascript:void(0)" onclick="open_win('terms_of_service','update')">이용약관</a></li>
                <li><a href="javascript:void(0)" onclick="open_win('sign_up_privacy','update')">개인정보처리방침</a></li>
                 <c:if test="${empty sessionScope.workerUser}">
                <c:choose>
                	<c:when test="${empty sessionScope.loginUser.id}">
                		<li><a href="/member/login">로그인</a></li> 
               	 	</c:when>
                	<c:otherwise>
                		<li><a href="/member/logout">로그아웃</a></li> 
                	</c:otherwise>
                	
                </c:choose>
                </c:if>
            </ul>
        </nav>
    </div>
    <div id="footer_box">
    
        <p>(주)스낵9덕</p>
        <br>
        <h3>문의: 031-123-4567<br>
        평일, 토요일 7:00~ 18:00<br>
        공휴일 7:00 ~ 13:00(일요일 휴무)<br>
        </h3>
    </div>
   
  </footer>

</html>