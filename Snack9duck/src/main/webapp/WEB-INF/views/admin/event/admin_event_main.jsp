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
<title>이벤트 수정</title>
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
		<h2>이벤트 목록</h2>
		<form name="formm" method="post">
			<table id="notice">
				<tr>
					<th>번호</th>
					<th>이벤트명</th>
					<th>배너 이미지</th>
					<th>등록일자</th>
					<th>진행여부</th>
					<th>수정/삭제</th>
					

				</tr>

		<c:forEach var="eventList" items="${eventList}">
				<tr>
					<td>${eventList.eventno}</td>
					<td>${eventList.subject}</td>
					<td><img style="vertical-align: middle" width="300px"
						height="70px" src="/snack9duck/${eventList.img}"></td>
					<td>${eventList.indate}</td>
					<c:choose>
						<c:when test="${eventList.upload eq 1}">
							<td style="color:black; text-decoration: none;">O</td>
						</c:when>
						<c:otherwise>
							<td style="color:black; text-decoration: none;">X</td>
						</c:otherwise>
					</c:choose>
					<td><a href="/admin/event/admin_event_Update?eventno=${eventList.eventno}" style="text-decoration: none;">수정/삭제하기</a></td>
					
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