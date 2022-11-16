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
    <script src="../static/js/includeHTML.js"></script>
    <title>스낵9덕 구독 관리</title>
</head>

<body>
<!--/* header -->
<%@ include file="../header.jsp"%>
<!-- header -->

    <!-- body 시작-->

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
                        <td>구독 정보</td>
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
                            <p>구독 시작일 :<fmt:formatDate value="${gudokList.indate}" pattern="yyyy-MM-dd" />
                            </p>
                            <p>다음 결제일 : ?? </p>
                            <p>배송지 :${gudokList.addr1}${gudokList.addr2}${gudokList.addr3}(${gudokList.zip_code})</p>
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
						<td style="text-align:center;">배송 중</td>	
						</c:when>
						<c:when test="${gudokList.result == '4'}">
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
 	       <input type="button" value="구독 취소" onclick="gudok_cancel()" class="cart__bigorderbtn right">
        </form>
    </section>
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
		        alert("취소할 구독 상품을 선택해주세요");
		        return;
		    }else{
			    var agree = confirm("선택한 구독을 취소 하시겠습니까?");
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