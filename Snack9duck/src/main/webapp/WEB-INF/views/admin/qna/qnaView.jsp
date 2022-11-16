<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/qna_view.css">
<title>스낵9덕 관리자 페이지</title>
</head>
<body>

<%@ include file="../../header.jsp"%>
<div id="qna_view">
<c:choose>
	<c:when test="${empty sessionScope.workerId}">
	<aside>
		<div class="management">
			<div id="mypage_title">
				<a class="text_deco">마이페이지</a>
			</div>
			<br>
			<div class="mypage_list">
				<a class="text_deco" href="#">구독 관리</a>
			</div>
			<div class="mypage_list">
				<a class="text_deco" href="Snack9duckServlet?command=qna_list">1:1문의</a>
			</div>
			<div class="mypage_list">
				<a class="text_deco" href="#">회원정보 수정</a>
				</li>
			</div>
			<br>
			<!-- <div id="mypage_title">게시판</div> -->
			<div class="mypage_list">
				<a class="text_deco" href="#">공지사항</a>
			</div>
			<div class="mypage_list">
				<a class="text_deco" href="#">이벤트</a>
			</div>
		</div>
	</aside>
	</c:when>
	</c:choose>
	<article>
		<h2>1:1 문의</h2>
		<h3>고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</h3>
		<form name="formm" method="post" action="/admin/qna/qnaView">
		<input type="hidden" name="qseq" value="${qna.qseq}">
			<table id="notice">
				<tr>
					<th>제목</th>
					<td>${qna.subject}</td>
				</tr>
				<tr>
					<th>문의유형</th>
					<td>${qna.type}</td>
				<tr>
					<th>등록일</th>
					<td><fmt:formatDate value="${qna.indate}" type="date"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th>질문내용</th>
					<td>${qna.content}
				</tr>
				<tr style="border: none;">
					<th>답변 내용</th>
						<td style="border: none; line-height: 120%">${fn:replace(qna.reply,replaceChar,"<br/>")}</td>
				</tr>
			</table>
			<div class="clear"></div>
			<div id="buttons" style="float: right; margin: 20px 0">
				<input type="button" value="목록보기" onclick="location.href='/admin/qna/qnaList'" style="padding: 3px 10px; margin-top:10px">
				<c:choose>
					<c:when test="${empty qna.reply}">
				<input type="button" value="답변하기" class="submit" 
							onclick="location.href='/admin/qna/qnaUpdate?qseq=${qna.qseq}'" style="padding: 3px 10px; margin-top:10px">
					</c:when>
					<c:otherwise>
					<input type="button" value="답변 수정하기" class="submit" 
								onclick="location.href='/admin/qna/qnaUpdate?qseq=${qna.qseq}'" style="padding: 3px 10px; margin-top:10px">
					</c:otherwise>
					</c:choose>
			</div>
		</form>
	</article>
</div>
</body>
<%@ include file="../../footer.jsp"%>
</html>