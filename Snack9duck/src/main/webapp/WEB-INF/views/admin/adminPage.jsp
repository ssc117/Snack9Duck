<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/adminPage.css" />
<title>스낵9덕 관리자 페이지</title>
</head>
<body>
	<!-- header 삽입 -->
	<%@ include file="../header.jsp"%>
	<div class="wrap">
	<div class="admin_wrap">

		<div class="all_setting">
			<h2>공지사항 관리</h2>
				<a href="/admin/notice/admin_notice_write">공지사항 등록</a> <br> 
				<a href="/admin/notice/admin_notice_main">공지사항 수정/삭제</a><br>
			<hr>
		</div>
		<div class="all_setting">
			<h2>이벤트 관리</h2>
				<a href="/admin/event/admin_event_write">이벤트 등록</a> <br> 
				<a href="/admin/event/admin_event_main">이벤트 관리</a> <br> 
			<hr>
		</div>
		<div class="all_setting">
			<h2>상품 관리</h2>
				<a href="/product/gudok_list?kind=4">상품 관리</a> <br> 
				<a href="product/admin_product_Write">상품 등록</a> <br> 
				<a href="/admin/product/admin_product_main">상품 수정/삭제</a>
			<hr>
		</div>
		<div class="all_setting">
			<h2>1:1문의 관리</h2>
				<a href="/admin/qna/qnaList">1:1문의 관리</a>
				
			<hr>
		</div>
		<div class="all_setting">
			<h2>계정 관리</h2>
				<a href="/admin/memberList">계정 수정/삭제</a>
			<hr>
		</div>
		<div class="all_setting">
			<h2>구독 관리</h2>
				<a href="/admin/order/admin_order_main"> 구독 관리</a><br>
			<hr>
		</div>


	</div>
	</div>
</body>
<!-- footer 삽입 -->
<%@ include file="../footer.jsp"%>
</html>