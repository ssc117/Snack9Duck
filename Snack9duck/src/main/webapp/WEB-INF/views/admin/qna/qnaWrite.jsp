<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="css/qna_view.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("replaceChar", "\n");
%>
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
		<form name="formm" method="post"
			action="Snack9duckServlet?command=admin_qna_detail">
			<input type="hidden" name="qseq" value="${param.qseq}">
			<table id="notice">
				<tr>
					<th>제목</th>
					<td>${qnaVO.subject}</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td><fmt:formatDate value="${qnaVO.indate}" type="date"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th>질문내용</th>
					<td>${qnaVO.content}
				</tr>
				<tr style="border: none;">
					<th>답변 내용</th>

					<td style="border: none;"><textarea name="reply" cols="70"
							rows="10" style="font-size: 17px; margin-top: 10px;"></textarea>
						<input type="submit" value="답변 하기"
						style="padding: 3px 10px; margin-top: 10px"></td>


				</tr>
			</table>
			<div class="clear"></div>
			<div id="buttons" style="float: right; margin: 20px 0">
				<input type="button" value="목록보기" class="submit"
					onclick="location.href='Snack9duckServlet?command=admin_qna_list'">
				<input type="button" value="수정완료" class="submit"
					onclick="location.href='Snack9duckServlet?command=admin_qna_detail'">
			</div>
		</form>
	</article>
</div>
<%@ include file="../../footer.jsp"%>