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
<!-- 부트스트랩 css 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 부트스트랩 사용으로 스크립트 추가 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
                  <th>아이디</th>
                  <th>질문유형</th>
                  <th>제목</th>
                  <th>등록일</th>
                  <th>답변 여부</th>
                  
               </tr>
               <c:forEach items="${qnaList}" var="qnaVO">
                  <tr>
                     <td>${qnaVO.qseq}</td>
                     <td>${qnaVO.id}</td>
                     <td>${qnaVO.type}</td>
                     <!-- <td><a style="text-decoration-line: none;"
                        href='/qna/qnaView?qseq=<c:out value="${qnaVO.qseq}"/>'>
                           <c:out value="${qnaVO.subject}"/></a> </td> --> <!-- /qna/qnaView?qseq= -->
                          <td><a class='move'style="text-decoration-line: none;" href='<c:out value="${qnaVO.qseq}"/>'>
                           <c:out value="${qnaVO.subject}"/></a> </td>
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
         	<!-- Paging ------------------------->
 
<div class="float-center">
    <ul class="pagination">
        <c:if test="${pageMaker.prev }">
            <li class="page-item previous">
                <a class="page-link" href="${pageMaker.startPage -1 }">Previous</a>
            </li>
        </c:if>
  
        <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
            <li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}">
				<a class="page-link" href="${num }">${num }</a>
            </li>
        </c:forEach>
        
        <c:if test="${pageMaker.next }">
            <li class="page-item next">
                <a class="page-link" href="${pageMaker.endPage +1 }">Next</a>
            </li>
        </c:if>
    </ul>
</div>


<!-- Paging End -->
   </article>
</div>

<form id='actionForm' action="/qna/qnaList" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
</form>
  

<script>
var actionForm = $("#actionForm");

$(".page-item a").on("click", function(e) {
	e.preventDefault();  //전송을 막음
	console.log('click');
	actionForm.find("input[name='pageNum']")
		.val($(this).attr("href"));
	actionForm.submit();
  });
$(".move").on("click", function(e) {

	e.preventDefault();
	actionForm
		.append("<input type='hidden' name='qseq' value='"
			+ $(this).attr("href") + "'>");
	actionForm.attr("action", "/qna/qnaView");
	actionForm.submit();
});

</script>
   </body>
   <%@ include file="../footer.jsp"%>
   </html>