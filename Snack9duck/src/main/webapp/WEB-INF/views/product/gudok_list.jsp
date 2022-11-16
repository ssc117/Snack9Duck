<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/gudok_list.css">
<title>스낵9덕 구독 목록</title>
</head>
<body>
<section>
	<!-- header 삽입 -->
	<%@ include file="../header.jsp"%>

	<div id="content_empty"></div>

	<div id="content_list" name="content_list">
		<!--목록-->
		<div class="list_wrap">
			<div class="content_list_title">
				<a href="/product/gudok_list?kind=4">전체</a>
			</div>
		</div>
		<div class="list_wrap">
			<div class="content_list_title">
				<a href="/product/gudok_list?kind=1">과자</a>
			</div>
		</div>
		<div class="list_wrap">
			<div class="content_list_title">
				<a href="/product/gudok_list?kind=2">음료</a>
			</div>
		</div>
		<div class="list_wrap">
			<div class="content_list_title">
				<a href="/product/gudok_list?kind=3">커피/차</a>
			</div>
		</div>

	</div>
	<div id="content_empty"></div>
		<form id='actionForm' action="/product/gudok_list" method='get'>
			<!-- <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'> -->
		</form>
		
		<div class="products">
	<c:forEach items="${listKindProduct}" var="productVO">
		<div class="product-list"> 
            <a href='/product/product_detail?prodnum=<c:out value="${productVO.prodnum}"/>' class="product">
                <img style="width:200px; height:200px" src="/snack9duck/${productVO.image}">
                <div class="product-name">
                    ${productVO.name}
                </div>
                <div class="product-price">
                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${productVO.price}"/>원
                </div>
            </a>
	</div>
	</c:forEach>
	</div>
	
	<div class="footerfix"></div>
	</section>
	
<script type="text/javascript">

</script>
</body>
<!-- footer 삽입 -->
<%@ include file="../footer.jsp"%>
</html>