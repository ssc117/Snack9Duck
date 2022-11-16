<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="/resources/css/order.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>

<title>Order</title>
</head>

<body>
<script>
	var IMP = window.IMP; // 생략 가능
	IMP.init("imp85530401"); // 예: imp00000000
</script>
		<%@ include file="../header.jsp"%>
	<div id="content">

		

		<div id="wrap">
			<div id="container" class="">
				<div id="editor"></div>
				<form action="#"
					id="order_payment_form" name="order_payment_form" method="post">
					<!-- onsubmit="return checkForm()"> -->
					
					<div class="content order-content" data-sticky-container="">
						<!-- title -->
						<div class="tit-box cart-title">
							<h1 class="txt-s20">주문/결제</h1>
						</div>
						<!-- title -->

						<!-- S : 주문상품 -->
						<div class="order-area order-m-area">
							<h2>주문상품</h2>
							<div
								class="order-tbl order-page buy-target-goods p-bespoke watch-opt cartListRst">
								<ul>
									<c:forEach items="${orderList}" var="orderList">
										<!-- S : 이미지  -->
										<li><div class="order-td order-image">
												<img src="/snack9duck/${orderList.image}" width="100"
													height="100">
											</div> <!-- E : 이미지  --> <!-- S : 모델명 -->
											<div class="order-td order-name">
												<p class="o-title">${orderList.pname}</p>
											</div> <!-- E : 모델명 --> <!-- S : 갯수 --> <input type="hidden"
											name="buyQtyOrd" value="1"> <!-- E : 갯수 -->
											<div class="order-td order-count">
												<p>${orderList.quantity}개</p>
											</div> <!-- S : 가격 -->
											<div class="order-td order-price">
												<p>₩<fmt:formatNumber value="${orderList.price*orderList.quantity}" pattern="##,###,###" /></p>
											</div></li>
										<!-- E : 가격 -->
									</c:forEach>
								</ul>
							</div>


						</div>
						<!-- E : 주문상품 -->
						<div class="order-area">
							<!-- s : 배송정보 -->
							<c:forEach var="orderList" items="${orderList}"
								varStatus="status">
								<c:if test="${status.first}">
									<h2 class="m-secon-tit">배송 정보</h2>
									<div class="order-box">
										<ul class="order-info-box">
											<!-- s : 회원 주문자 정보 -->
											<li id="liMemberInfo" style="display: 0;"><span
												class="head">주문자 정보</span>
												<ul class="order-info-detail info-order">
													<li>이름 : <span id="name">${orderList.name}</span></li>
													<li>휴대폰 : <span id="phone">${orderList.phone1}-${orderList.phone2}-${orderList.phone3}</span></li>
													<li>이메일 : <span id="email">${orderList.email1}@${orderList.email2}</span></li>
												</ul></li>
											<!-- e : 회원 주문자 정보 -->
											<!-- s : 배송지 정보 -->

											<li><span class="head">배송지 정보</span> <!-- s : 단일 배송 -->
												<div id="delivery-tab-view1"
													class="tab-view delivery-tab-view info-delivery-single"
													style="display: block">
													<ul class="order-info-detail info-order">
														<li>이름 : <input type="text" name="spanOrdAdrsNm" value="${orderList.name}" id="name"></li>
														<li>연락처 : <input type="text" name="spanOrdAdrsMobile" value="${orderList.phone1}-${orderList.phone2}-${orderList.phone3}" id="phone"></li>
														<li>주소 : <input type="text" value="${orderList.zip_code}" id="zip_code">
														<input style="margin:5px 0 0 40px" type="text" value="${orderList.addr1}">
														<input style="margin:5px 0 0 40px" type="text" value="${orderList.addr2}${orderList.addr3}">
														</li>
														<li data-dlvr-msg="default"><input type="text"
															name="odrDeliveryMsg" placeholder="배송메시지를 입력해 주세요."
															title="배송 메시지를 입력해 주세요." class="inp-line" maxlength="50"
															style="display: none"
															onkeydown="fnOnLimitInputValAtDtlAddr(this);"
															onkeyup="fnOnLimitInputValAtDtlAddr(this);"></li>
													</ul>
													<!-- <span class="order-btn"><a
														href="index.jsp?workgroup=mypage&amp;process=sujung">주문자
															정보 변경</a></span> -->
													<!-- e : 단일배송 정보 변경(신규 배송지) -->
												</div> <!-- e : 단일 배송 --></li>
								</c:if>
							</c:forEach>
						</div>
						<!-- end order-box -->
						<!-- e : 배송정보 -->
					</div>
					<!-- end order-area -->
					<!-- s : 결제 정보 -->
					<div class="payment-area">
						<h2>결제 정보</h2>

						<ul class="payment-listup">
							<li><span class="head">상품 수</span> <span class="text"><strong
									id="goods_cnt"> <c:set var="total" value="0" /> 
									<c:forEach var="orderList" items="${orderList}">
										<c:set var="total" value="${total + orderList.quantity}" />
									</c:forEach> <c:out value="${total}" />
								</strong>개</span></li>
							<li><span class="head">주문 금액</span> <span class="text"><strong
									id="order_payment_total_goods_amt_view">
									<fmt:formatNumber value="${totalPrice}" pattern="##,###,###" /></strong>원</span></li>
						</ul>
						<ul class="cost-listup">
							<li><span class="head"><strong>결제 예정 금액</strong></span> <span
								class="text"><strong
									id="order_payment_total_pay_amt_view"><fmt:formatNumber value="${totalPrice}" pattern="##,###,###" />
									</strong>원</span></li>
						</ul>
						
						<div class="terms-box">
							<h2>
								약관 동의<i class="required-item">*</i>
							</h2>
							<div class="chk-form allChk-box">
								<label><input type="checkbox" class="check">주문
									상품정보 및 전자금융거래 이용약관에 모두 동의하십니까?</label>
							</div>

							<div class="chk-form">
								<label><input type="checkbox" class="check">개인정보
									수집·이용 및 제3자 제공에 모두 동의하십니까?</label>
							</div>

							<!-- e : 가정용 시스템에어컨 시공계약 이용약관 -->

						</div>
						<br>
						<button type="button" class="btn btn-l btn-type3 div2"
							id="orderPaymentBtn" onclick="requestPay()">
							<strong id="order_payment_total_pay_amt_final_view">
							<fmt:formatNumber value="${totalPrice}" pattern="##,###,###" />
							</strong><span>원
								결제하기</span>
								
								<div class="div2" id="card" onclick="return productCheck2()" >신용카드</div>
						</button>
						<div id="message" style="color: red;"></div>

						<!--s: 22-02-22 문구추가-->
						<!--e: 22-02-22 문구추가-->

					</div>
					<!-- e : 결제 정보 -->
			</form>
			</div>
			<!-- end content order-content -->
		</div>
		<!-- container -->
	</div>

	<input type="hidden" id="prodname" value="${orderList[0].pname}">
	<input type="hidden" id="price" value="${totalPrice}">
	<input type="hidden" id="addr" value="${orderList[0].addr1}${orderList[0].addr3}${orderList[0].addr2}">
	
	
	<script>
	
	var div2 = document.getElementsByClassName("div2");
    function requestPay() {
    	console.log("=============")
    	var prodname = $("#prodname").val();
        var price = $("#price").val();
        var email = $("#email").val();
        var name = $("#name").val();
        var phone = $("#phone").val();
        var addr = $("#addr").val();
        var zip_code = $("#zip_code").val();
      // IMP.request_pay(param, callback) 결제창 호출
      if ($(".check").filter(":checked").length == 0) {
		alert("약관에 동의해 주세요.");
		return false;
	  } else if ($(".check").filter(":checked").length == 1) {
		alert("약관에 동의해 주세요.");
		return false;
	  }else{
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: 'merchant_' + new Date().getTime(),
          name: prodname,
          amount: price,
          buyer_email: email,
          buyer_name: name,
          buyer_tel: phone,
          buyer_addr: addr,
          buyer_postcode: zip_code
      }, function (rsp) { // callback
          if (rsp.success) {
        	  alert("구매가 완료되었습니다.");
        	  
          } else {
        	  alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
        	  location.href  ="/order/order_submit";
          }
      });
      }
    }
    
/*     function init() {
        for (var i = 0; i < div2.length; i++) {
           div2[i].addEventListener("click", handleClick);
        }
     }
     init(); */
  </script>
</body>
<%@ include file="../footer.jsp"%>
</html>