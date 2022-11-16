<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>스낵9덕 장바구니</title>
<link rel="stylesheet" type="text/css" href="/resources/css/cart.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<script type="text/javascript" src="/resources/js/cart.js"></script>
</head>
<body>
	<!-- header 삽입 -->
	<%@ include file="../header.jsp"%>

	<div id="mypage_all">
		<div class="management">
			<div id="mypage_title">
				<a class="text_deco">마이페이지</a>
			</div>
			<br>
			<div class="mypage_list">
				<a class="text_deco" href="/member/gudok_setting">구독 관리</a>
			</div>
			<div class="mypage_list">
				<a class="text_deco" href="/cart/cart">장바구니</a>
			</div>
			<div class="mypage_list">
				<a class="text_deco" href="/qna/qnaList">1:1문의</a>
			</div>
			<div class="mypage_list">
				<a class="text_deco" href="/member/my_page_form">회원정보 수정</a>
			</div>
			<br>
			<div class="mypage_list">
				<a class="text_deco" href="/notice/notice_main">공지사항</a>
			</div>
			<div class="mypage_list">
				<a class="text_deco" href="/event/event_main">이벤트</a>
			</div>
		</div>
		<div id="orderform_1">
			<form name="orderform" id="orderform" method="post" class="orderform"
				action="/Page" onsubmit="return false;">
				
				<!-- <input type="hidden" name="cmd" value="order"> -->
				<h2>장바구니</h2>
				<br>
				<c:choose>
					<c:when test="${cartList.size() == 0}">
						<h3 style="color: red; text-align: center;">장바구니가 비었습니다.</h3>
					</c:when>
					<c:otherwise>
						<div class="basketdiv" id="basket">
							<div class="row head">
								<div class="subdiv">
									<div class="check">선택</div>
									<div class="img">이미지</div>
									<div class="pname">상품명</div>
								</div>
								<div class="subdiv">
									<div class="basketprice">가격</div>
									<div class="num">수량</div>
									<div class="sum">합계</div>
								</div>
								<div class="subdiv">

									<div class="basketcmd">삭제</div>
								</div>
								<div class="split"></div>
							</div>
							<c:forEach var="cartList" items="${cartList}">
								<!--혹시몰라 <input type="hidden" name="cartnum" value=${cartList.cartnum } />  -->
								<div class="row data">
									<div class="subdiv">
										<div class="check">
											<input type="checkbox" name="cartnum" value="${cartList.cartnum}">
											<input type="hidden" name="prodnum" value="${cartList.prodnum}">
										</div>
										<div class="img">
											<img src="/snack9duck/${cartList.image}" width="60">
										</div>
										<div class="pname">
											<span>${cartList.name}</span>
										</div>
									</div>

									<div class="subdiv">
										<div class="basketprice">
											<input type="hidden" name="p_price" id="p_price1"
												class="p_price" value="${cartList.price}">${cartList.price}원
										</div>
										
										
										
										<div class="num">
											<div class="updown">
												<input type="text" name="quantity"
													id="p_num${cartList.cartnum}" size="2" maxlength="4"
													class="p_num" value="${cartList.quantity}"> <span
													onclick="go_update('up',${cartList.quantity},${cartList.cartnum})">
													<i class="fas fa-arrow-alt-circle-up up"></i>
												</span> <span
													onclick="go_update('down',${cartList.quantity},${cartList.cartnum})"><i
													class="fas fa-arrow-alt-circle-down down"></i> </span>
											</div>
										</div>
										
										
										
										<div class="sum">

											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${cartList.price * cartList.quantity}" />
											원
										</div>
									</div>
									<div class="subdiv">
										<div class="basketcmd">
											<a href="/cart/cart_delete?cartnum=${cartList.cartnum}"
												class="abutton">삭제</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="right-align basketrowcmd">
							<a href="javascript:basket.delCheckedItem();" class="abutton">선택상품삭제</a>
							<a href="/cart/cart_all_delete?id=${loginUser.id}" class="abutton">장바구니비우기</a>
						</div>
						<div class="bigtext right-align sumcount" id="sum_p_num">
							상품갯수:
							<c:set var="total" value="0" />
							<c:forEach var="cartList" items="${cartList}">
								<c:set var="total" value="${total + cartList.quantity}" />
							</c:forEach>
							<c:out value="${total}" />
							개
						</div>
						<div class="bigtext right-align box blue summoney"
							id="sum_p_price">
							합계금액:
							<c:set var="total" value="0" />
							<c:forEach var="cartList" items="${cartList}">
								<c:set var="total"
									value="${total + cartList.price*cartList.quantity}" />
							</c:forEach>
							<fmt:formatNumber value="${total}" pattern="##,###,###" />
							원
						</div>
						<div id="goorder" class="">
							<div class="clear"></div>
							<div class="buttongroup center-align cmd">
								<a href="javascript:basket.CheckedItemOrder();">선택한 상품 구독</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</form>
		</div>
	</div>
</body>
<!-- footer 삽입 -->
<%@ include file="../footer.jsp"%>
</html>