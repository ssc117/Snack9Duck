<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/qna_list.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>스낵9덕 문의 리스트</title>
</head>
<body>
   <%@ include file="../header.jsp"%>
   <div id="qna_wrap">
      <aside>
         <div class="management">
            <div id="mypage_title">
               <a class="text_deco">마이페이지</a>
            </div>
            <br>
            <div class="mypage_list">
               <a class="text_deco" href="/member/gudok_setting">구독 관리</a>
            </div>
            <div class="mypage_list">
               <a class="text_deco" href="/qna/qnaList">1:1문의</a>
            </div>
            <div class="mypage_list">
               <a class="text_deco" href="/member/my_page_form">회원정보 수정</a>
               
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
         <form name="formm" method="post">
            <table id="cartList">
               <tr>
                  <th>번호</th>
                  <th>질문유형</th>
                  <th>제목</th>
                  <th>등록일</th>
                  <th>답변 여부</th>
               </tr>
               <c:forEach items="${qnaList}" var="qnaVO">
                  <tr>
                     <td>${qnaVO.qseq}</td>
                     <td>${qnaVO.type}</td>
                     <td><a style="text-decoration-line: none;"
                        href="/qna/qnaView?qseq=${qnaVO.qseq}">
                           ${qnaVO.subject}</a> </td>
                     <td><fmt:formatDate value="${qnaVO.indate}" type="date"
                           pattern="yyyy-MM-dd" /></td>
                     <td><c:choose>
                           <c:when test="${qnaVO.rep=='no'}"> no </c:when>
                           <c:when test="${qnaVO.rep=='yes'}"> yes </c:when>
                        </c:choose></td>
                  </tr>
               </c:forEach>
            </table>
            <div class="clear"></div>
            <div id="buttons" style="float: right; margin:20px 0">
               <input type="button" value="1:1 질문하기" class="submit"
                  onclick="location.href='/qna/qnaWrite/'">
               <input type="button" value="쇼핑 계속하기" class="cancel"
                  onclick="location.href='/product/gudok_list?kind=4'">
            </div>
         </form>
   
   </article>
   </div>
   <%@ include file="../footer.jsp"%>