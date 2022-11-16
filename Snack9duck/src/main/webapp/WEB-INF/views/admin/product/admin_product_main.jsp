<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지</title>
<style>
#event_wrap{
	padding-bottom: 100px;
	text-align: center;
}

article {
	width: auto;
	text-align: center;
}

#notice {
	width: 1000px;
	margin-left: 25%;
	text-align: center;
	border-collapse: collapse;
	border: 1px solid red;
}

#notice tr th, td {
	border: 1px solid black;
	padding: 5px;
}

#buttons {
	margin-top: 20px;
}
</style>
</head>

<body>
<%@ include file="../../header.jsp"%>
	<div id="event_wrap">
	<article>
		<h2>상품 목록</h2>
		<span>상품종류 : [1:과자] [2:음료] [3:차/커피] </span>
		<form name="formm" method="post">
			<table id="notice">
				<tr>
					<th>상품번호</th>
					<th>상품명</th>
					<th>상품종류</th>
					<th>가격</th>
					<th>상품 이미지</th>
					<th>등록일자</th>
					<th>표시여부</th>
					<th>수정/삭제</th>
					

				</tr>

		<c:forEach var="productList" items="${productList}">
				<tr>
					<td>${productList.prodnum}</td>
					<td>${productList.name}</td>
					<td>${productList.kind}</td>
					<td>${productList.price}</td>
					<td><img style="vertical-align: middle" width="100px"
						height="100px" src="/snack9duck/${productList.image}"></td>
					<td>${productList.regdate}</td>
					<td>${productList.useyn}</td>
					<td><a href="/admin/product/admin_product_Update?prodnum=${productList.prodnum}" style="text-decoration: none;">수정/삭제하기</a></td>
				</tr>
	   </c:forEach>
			</table>

			<div class="clear"></div>

			<div id="buttons" style="float: center;">
				<input type="button" value="관리자 메인 페이지로 돌아가기" class="cancel" onclick="location.href='/admin/adminPage'">
			</div>
		</form>
	</article>
	</div>
</body>
<%@ include file="../../footer.jsp"%>
</html>