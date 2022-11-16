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
<script src="static/js/includeHTML.js"></script>
<title>스낵9덕 문의 리스트</title>
</head>
<body>
   <%@ include file="../../header.jsp"%>
   <div id="qna_wrap">
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
         <form name="formm" method="post">
            <table id="cartList">
               <tr>
                  <th>번호</th>
                  <th>문의유형</th>
                  <th>제목</th>
                  <th>등록일</th>
                  <th>아이디</th>
                  <th>답변 여부</th>
                  <th>삭제<th>
               </tr>
               <c:forEach items="${qnaList}" var="qnaList">
                  <tr>
                     <td>${qnaList.qseq}</td>
                     <td>${qnaList.type}</td>
                     <td><a href="/admin/qna/qnaView?qseq=${qnaList.qseq}"> ${qnaList.subject}</a> </td>
                     
                     <td><fmt:formatDate value="${qnaList.indate}" type="date"
                           pattern="yyyy-MM-dd" /></td>
                     <td>${qnaList.id}</td>
                     <td><c:choose>
                           <c:when test="${qnaList.rep=='no'}"> no </c:when>
                           <c:when test="${qnaList.rep=='yes'}"> yes </c:when>
                        </c:choose></td>
                     <td>
                     <a href="/admin/qna/delete?qseq=${qnaList.qseq}" style="text-decoration: none;">삭제하기</a>
                     
                     </td>
                  </tr>
               </c:forEach>
            </table>
            <div class="clear"></div>
            <div id="buttons" style="float: right; margin:20px 0">
            </div>
         </form>
         </article>
   </div>

   </body>
   <%@ include file="../../footer.jsp"%>
   </html>