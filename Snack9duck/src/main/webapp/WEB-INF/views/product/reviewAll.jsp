<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% int no = 1; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="/resources/css/style-qna.css">

<title>스낵9덕 상품 상세 페이지</title>
</head>
<body>

	<%@ include file="../header.jsp"%>
	<!-- 메인 박스 시작 -->
	<div class="frame">

		<!-- 머리글 영역 시작 -->
		<c:choose>
			<c:when test="${product eq null }">
				<div class="title">내가 작성한 리뷰</div>
			</c:when>
			<c:otherwise>
				<div class="title">현재 보고있는 상품</div>
				<div class="cart-table-content-row border-btm-black flex-center"
					id="cart-table-content-row-${product.name}">
					<div class="cart-table-content-prodInfo">
						<div class="cart-table-content-prodInfo-img">
							<a class="cart-table-content-prodInfo-a"
								href="/product/product_detail?prodnum=${product.prodnum}">
								<!-- 해당 제품 상품상세페이지로 이동 --> <img
								src="/snack9duck/${product.image}"
								style="width: 300px; height: 200px;" />
							</a>
						</div>
						<div class="cart-table-content-prodInfo-text"style="margin-bottom:10px;">
							<strong class="cart-table-content-prodInfo-strong">${product.name}</strong>
						</div>
						
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		<!-- 머리글 영역 끝 -->

		<!-- 리뷰리스트 테이블 시작 -->

		<div class="table_wrap">
			<table class="cart__list">
				<thead>
					<tr>
						<td>번호</td>
						<td>리뷰내용</td>
						<td>작성자</td>
						<td>날짜</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="reviewList" items="${reviewList}">
						<tr class="cart__list__detail">
							<td><%=no %></td>
							<td>
								<p>${reviewList.content}</p>
							</td>
							<td>
								<p>${reviewList.id}</p>
							</td>
							<td>
								<p>
									<fmt:formatDate value="${reviewList.indate}" type="date" />
								</p>
							</td>
						</tr>
						<%no++; %>
					</c:forEach>
				</tbody>
			</table>
		</div>


	</div>

	<!-- 리뷰리스트 테이블 끝 -->
	<div style="margin-bottom:300px;">
	
	</div>
	<!-- 메인 박스 끝 -->
</body>
<%@ include file="../footer.jsp"%>

</html>