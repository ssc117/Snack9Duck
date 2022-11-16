<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="/resources/css/qna_view.css">
<%@ include file="../header.jsp"%>

<div id="qna_view">
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
               <a class="text_deco" href="/qna/qnaList">1:1문의</a>
            </div>
            <div class="mypage_list">
               <a class="text_deco" href="/member/my_page_form">회원정보 수정</a>
               </li>
            </div>
            <br>
            <!-- <div id="mypage_title">게시판</div> -->
            <div class="mypage_list">
               <a class="text_deco" href="/notice/notice_main">공지사항</a>
            </div>
            <div class="mypage_list">
               <a class="text_deco" href="/event/event_main">이벤트</a>
            </div>
         </div>
      </aside>
<article>
	<h2>1:1 문의</h2>
	<h3>고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</h3>
	<form name="formm" method="post">
		<table id="notice">
			<tr>
				<th>제목</th>
				<td>${qna.subject}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><fmt:formatDate value="${qna.indate}" type="date"
						pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<th>질문유형</th>
				<td>${qna.type}</td>
			</tr>
			<tr>
				<th>질문내용</th>
				<td>${qna.content}
			</tr>
			<tr style="border:none;">
				<th>답변 내용</th>
				<td style="border:none;">${qna.reply}
			</tr>
		</table>
		<div class="clear"></div>
		<div id="buttons" style="float: right; margin:20px 0">
			<input type="button" value="목록보기" class="submit"
				onclick="location.href='/qna/qnaList'">
			<input type="button" value="쇼핑 계속하기" class="cancel"
				onclick="location.href='/product/gudok_list?kind=4'">
		</div>
	</form>
</article>
</div>
<%@ include file="../footer.jsp"%>