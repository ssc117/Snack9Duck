<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/css/gudok_setting.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- <script src="../static/js/includeHTML.js"></script>  -->
    <!-- 부트스트랩 css 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 부트스트랩 사용으로 스크립트 추가 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <title>스낵9덕 구매 관리</title>
</head>

<body>
<!--/* header -->
<%@ include file="../header.jsp"%>
<!-- header -->

    <!-- body 시작-->
    <div class="mypage_all">
	
         <div class="management">
			<div id="mypage_title">
				<a class="text_deco">마이페이지</a>
			</div>
			<br>
			<div class="mypage_list">
				<a class="text_deco" href="/member/gudok_setting">구독 관리</a>
			</div>
			<div class="mypage_list">
				<a class="text_deco" href="/cart/cart">장바구니</a>
			</div>
			<div class="mypage_list">
				<a class="text_deco" href="/qna/qnaList">1:1문의</a>
			</div>
			<div class="mypage_list">
				<a class="text_deco" href="/member/my_page_form">회원정보 수정</a>
			</div>
			<br>
			<div class="mypage_list">
				<a class="text_deco" href="/notice/notice_main">공지사항</a>
			</div>
			<div class="mypage_list">
				<a class="text_deco" href="/event/event_main">이벤트</a>
			</div>
			<br>
			<div class="mypage_list">
				<a class="text_deco" href="/member/logout">로그아웃</a>
			</div>
		</div>
      
    <section class="cart">
        <div class="cart__information">
            <ul>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                <li>설명설명.</li>
            </ul>
        </div>
        <form name="gudokform" method="post">
        <table class="cart__list">
            <thead>
                    <tr>
                        <td colspan="2">상품정보</td>
                        <td>가격</td>
                        <td>수량</td>
                        <td>구매 정보</td>
                        <td>결제금액</td>
                        <td>현재상태</td>
                        <td>취소</td>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="gudokList" items="${gudokList}">
                    <tr class="cart__list__detail">
                        <td><img src="/snack9duck/${gudokList.image}" style="display:block; width: 80%; height: 80px; margin: auto;"></td>
                        <td> <p>${gudokList.pname}</p> </td>
                        <td> <p><fmt:formatNumber type="number" maxFractionDigits="3" value="${gudokList.price}" />원</p> </td>
                        <td> <p>${gudokList.quantity}개</p> </td>
                        <td class="cart__list__option">
                            <p>구매일 : <fmt:formatDate value="${gudokList.indate}" pattern="yyyy-MM-dd" /></p>
                            <p>요청사항 : ${gudokList.request} </p>
                            <p>배송지 :${gudokList.addr1}${gudokList.addr2}${gudokList.addr3}(${gudokList.zip_code})</p>
                            <p>oseq:${gudokList.oseq } odseq:${gudokList.odseq} result:${gudokList.result}
                        </td>
                        <td><span class="price">
                        <fmt:formatNumber type="number" maxFractionDigits="3" 
                        	value="${gudokList.price * gudokList.quantity}" />원</span><br>
                        </td>
                        <c:choose>
						<c:when test="${gudokList.result == '2'}">
						<td style="text-align:center;">결제완료</td>	
						</c:when>
						<c:when test="${gudokList.result == '3'}">
						<td style="text-align:center;">배송 완료</td>	
						</c:when>
						
					</c:choose>
                        <td>
                        <input type="radio" name="odseq" value="${gudokList.odseq}"><p>선택</p>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
        </table>
        	<div style=" margin-top:50px; text-align: center;">
 	       <input type="button" value="구매 취소 및 구매내역 삭제" onclick="gudok_cancel()" class="cart__bigorderbtn right">
 	       </div>
        </form>
    </section>
    
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

</div>
<!-- Paging End -->

<form id='actionForm' action="/member/gudok_setting" method='get'>
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
</script>

<script>
	function gudok_cancel() {
			var userid = "";
		    var odseq = document.getElementsByName("odseq");
		    var chked = false;
		    var indexid = false;
		    for (i = 0; i < odseq.length; i++) {
		        if (odseq[i].checked) {
		            if (indexid) {
		                userid = userid + '-';
		            }
		            userid = userid + odseq[i].value;
		            indexid = true;
		            
		        }
		    }
		    if (!indexid) {
		        alert("취소,삭제할 상품을 선택해주세요");
		        return;
		    }else{
			    var agree = confirm("선택한 구매를 취소 또는 구매내역을 삭제 하시겠습니까?");
			    if (agree) {
			    	gudokform.action = "/member/gudok_cancel";
			    	gudokform.submit();
			    }
		    }

		}
</script>
</body>
<!-- footer -->
<%@ include file="../footer.jsp"%>

</html>