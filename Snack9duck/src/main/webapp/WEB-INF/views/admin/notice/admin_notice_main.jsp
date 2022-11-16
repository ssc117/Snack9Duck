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
<title>공지사항 수정</title>
<style>
#notice_wrap{
	padding-bottom: 300px;
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
	<div id="notice_wrap">
	<article>
		<h2>공지사항 목록</h2>
		<form name="formm" method="post">
			<table id="notice">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>등록일자</th>
					<th>수정/삭제</th>
					
				</tr>
	<c:forEach var="noticeList" items="${noticeList}">
				<tr>
					<td>${noticeList.noticeno}</td>
					<td>${noticeList.title}</td>
					<td>${noticeList.content }</td>
					<td>${noticeList.indate}</td>
					
					<td><a href="/admin/notice/admin_notice_Update?noticeno=${noticeList.noticeno}" style="text-decoration: none;">수정/삭제하기</a></td>
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