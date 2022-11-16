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
<title>구독 관리</title>
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
		<h2>구독 신청 목록</h2>
		<form name="formm" method="post">
			<table id="notice">
				<tr>
					<th>주문상세번호</th>
					<th>주문번호</th>
					<th>주문자ID</th>
					<th>이름</th>
					<th>상품명</th>
					<th>상품수량</th>
					<th>결제일</th>
					<th>배송지</th>
					<th>상태</th>
					<th>상태변경</th>
				</tr>

		<c:forEach var="orderList" items="${orderList}">
				<tr>
					<td>${orderList.odseq}</td>
					<td>${orderList.oseq}</td>
					<td>${orderList.id}</td>
					<td>${orderList.name}</td>
					<td>${orderList.pname}</td>
					<td>${orderList.quantity}</td>
					<td>${orderList.indate}</td>
					<td>${orderList.addr1}${orderList.addr2}${orderList.addr3}(${orderList.zip_code})</td>
					<c:choose>
						<c:when test="${orderList.result eq 2}">
							<td style="color:black; text-decoration: none;">결제완료</td>
						</c:when>
						<c:when test="${orderList.result eq 3}">
							<td style="color:black; text-decoration: none;">배송완료</td>
						</c:when>
						
					</c:choose>
					<!-- <td><button id="oseq" value="${orderList.oseq}" onclick="location.href = '/admin/order/admin_order_Update?odseq=${orderList.odseq}' ">변경</button></td>  -->
					<td><a href="/admin/order/admin_order_Update?odseq=${orderList.odseq}" style="text-decoration: none;">수정</a></td> 
					
				</tr>
	   </c:forEach>
			</table>
				</form>

			<div class="clear"></div>

			<div id="buttons" style="float: center;">
				<input type="button" value="관리자 메인 페이지로 돌아가기" class="cancel" onclick="location.href='/admin/adminPage'">
			</div>
		
	</article>
	</div>
<script>
function go_modify(){
		
		document.formm.action = "/admin/order/updateOrderResult3";
        document.formm.submit();
    }
	


</script>
</body>
<%@ include file="../../footer.jsp"%>
</html>