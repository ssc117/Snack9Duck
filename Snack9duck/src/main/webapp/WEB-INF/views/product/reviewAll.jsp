<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int no = 1; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/style-qna.css">
<script type="text/javascript" src="/resources/js/detail.js"></script>
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
<title>스낵9덕 상품 상세 페이지</title>
</head>
<body>

<%@ include file="../header.jsp"%>
<!-- 메인 박스 시작 -->
<div class="frame">

<!-- 머리글 영역 시작 -->
<c:choose>
	<c:when test="${product eq null }">
		<div class="favor-head border-btm-black">내가 작성한 리뷰</div>
	</c:when>
	<c:otherwise>
		<div class="favor-head border-btm-black">현재 보고있는 상품</div>
		<div class="cart-table-content-row border-btm-black flex-center" id="cart-table-content-row-${product.name}">
		<div class="cart-table-content-prodInfo">
			<div class="cart-table-content-prodInfo-img">
				<a class="cart-table-content-prodInfo-a" href="/product/product_detail?prodnum=${product.prodnum}"><!-- 해당 제품 상품상세페이지로 이동 -->
					<img src="/snack9duck/${product.image}" style="width: 300px; height: 200px;"/>
				</a>
			</div>
			<div class="cart-table-content-prodInfo-text">
				<p class="cart-table-content-prodInfo-p mgb10">${product.name}</p>
				<strong class="cart-table-content-prodInfo-strong">${product.name}</strong>
			</div>
		</div>
		</div>
	</c:otherwise>
</c:choose>
<!-- 머리글 영역 끝 -->

<!-- 리뷰리스트 테이블 시작 -->
<div class="pageForAll-table border-btm-black mgb100">
	<div class="pageForAll-table-title f18-333">
	   <div class="pageForAll-table-title-no">번호</div>
	   <div class="pageForAll-table-title-detail pdl20">리뷰 내용</div>
	   <div class="pageForAll-table-title-writer">작성자</div>
	   <div class="pageForAll-table-title-date">날짜</div>
	</div>
	<div class="pageForAll-table-body">
		<c:forEach var="reviewList" items="${reviewList}">
		<div class="pageForAll-table-row">
			<div class="pageForAll-table-row-no"><%=no %></div>
			<div class="pageForAll-table-row-detail pdl20">
				${reviewList.content}
			</div>
			 <div class="pageForAll-table-row-writer">${reviewList.id}</div> 
			<div class="pageForAll-table-row-date"><fmt:formatDate value="${reviewList.indate}" type="date"/></div>
			<% no++; %>
		</div>
		</c:forEach>
	</div>
</div>
<!-- 리뷰리스트 테이블 끝 -->

</div>
<!-- 메인 박스 끝 -->
</body>
<%@ include file="../footer.jsp"%>

</html>