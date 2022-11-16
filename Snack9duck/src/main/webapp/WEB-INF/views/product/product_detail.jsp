<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% int reviewNo=1; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/product_detail.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<script type="text/javascript" src="/resources/js/detail.js"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.2.min.js"></script>

<title>스낵9덕 상품 상세 페이지</title>
</head>
<body>
	<form method="post" name="formm">
	<input type="hidden" name="id" value="${loginUser.id}" /> 
	<input type="hidden" name="prodnum" value="${product.prodnum}" /> 
	<input type="hidden" name="no" value="quantity" />
		<!-- header 삽입 -->
		<%@ include file="../header.jsp"%>

		<div class="products-detail">
			<!-- 상단 박스 시작 -->
			<div class="products-detail-box">
				<div class="products-box-info">
					<!-- 이미지, 브랜드, 상품명, 가격, 사이즈선택  -->
					<div class="products-info-image swiper-container">
						<!-- 이미지 -->
						<div class="swiper-wrapper">


							<div class="swiper-slide">
								<img src="/snack9duck/${product.image}" alt="" style="width: 300px; height: 200px;">
								<!-- 동기적으로 불러오기 -->

							</div>

						</div>
					</div>

				</div>
				<div class="products-box-detail">

					<div class="products-box-detail-name">
						<!-- 상품명 -->
						<span>${product.name}</span>
					</div>
					<div class="products-box-detail-price">
						<!-- 가격 -->
						<!--<span class="products-box-detail-price-figure">${productVO.price}</span> -->
						<input type='text' name="sell_price" id="sell_price"
							class="products-box-detail-price-figure"
							value="${product.price}" readonly> <span>원</span>
					</div>
					<div class="products-box-detail-realInfo border-btm-e1e1e1">
						<span class="products-box-detail-realInfo-title">제품구성</span>
						<div id="realInfo-box">
							${product.content}
						</div>
					</div>

					<div class="updown">
						<table style="margin-left: 200px;">
							<tr style="text-align: center;">
								<td>수량</td>

								<td style="display: flex; padding-left: 10px">
								
							<input type='button' class="plus_btn" onclick='count("plus")' value='╋' />
			
					<!-- <div id="quantity" name="quantity">1</div> --> 
					<input type='text' name="quantity" class="quantity" value="1" readonly / style="text-align:center;"">
				    <input type='button' class="minus_btn" onclick='count("minus")' value='━' />
								
								</td>
								
								<script>
								let quantity = $(".quantity").val();
								$(".plus_btn").on("click", function(){
								  $(".quantity").val(++quantity);
								});
								$(".minus_btn").on("click", function(){
								  if(quantity > 1){
								    $(".quantity").val(--quantity);	
								  }
								});
								
								
								</script>
							</tr>
						</table>
					</div>
					<div class="products-box-detail-allPrice">
						<span class="products-box-detail-allPrice-title">total</span> 
						
						<span id="total_price">${product.price}</span><span>원</span><br>
							<span>총 수량 : </span><span id='result2' value=1>1</span>개
					</div>

					<c:choose>
						<c:when test="${empty sessionScope.loginUser}">
							<button type="button" class="buy-btn"
								onclick="location.href = '../member/login'">구독하기</button>
							<button type="button" class="cart-btn"
								onclick="location.href = '../member/login'">장바구니</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="buy-btn" onclick="go_buy();">구독하기</button>
							<button type="button" class="cart-btn" onclick="go_cart();">장바구니</button>
						</c:otherwise>
					</c:choose>


								
				</div>
			</div>
	</form>
	<!-- 상단 박스 끝 -->
	<!-- 아래 박스 전체 시작-->
	<div class="wrap-detail-info">
		<!-- 상품정보/리뷰/Q&A/주문정보 시작 -->
		<div class="tab-detail-info">
			<ul class="tab">
				<li class="active" id="tab-img-text"><a
					href="#detail-img-text-box" id="tab-img-text-a">상품정보</a></li>
				<li class="active" id="tab-review"><a href="#detail-review-box"
					id="tab-review-a">리뷰</a></li>
				<li class="active" id="tab-qna"><a href="#detail-qna-box"
					id="tab-qna-a">Q&amp;A</a></li>
				<li class="active" id="tab-purchaseInfo"><a
					href="#detail-purchaseInfo-box" id="tab-purchaseInfo-a">주문정보</a></li>
			</ul>
		</div>
		<!-- 상품정보/리뷰/Q&A/주문정보 끝 -->

		<!-- 상품 상세 설명 이미지/글 시작 -->
		<!-- 우측 하단 sticky  -->
		<div class="detail-sticky-go-to-top-btn-box">
			<a href="#" class="detail-sticky-go-to-top-btn-a"> <img
				class="detail-sticky-go-to-top-btn-img" src="/resources/img/arrowUp.png" />
			</a>
		</div>
		<!-- 우측 하단 sticky 끝 -->
		<div id="detail-img-text-box">
			
		<img src="/snack9duck/${product.detail_image}" alt="">
			
		</div>
		<!-- 상품 상세 설명 이미지/글 끝 -->
		
		<!-- 리뷰 시작 -->
		<div id="detail-review-box">
			<div class="detail-review-header">
			리뷰
			<c:if test="${not empty sessionScope.loginUser.id}">
				 <a href="/product/reviewwrite" class="detail-qna-header-a" id="detail-qna-write">리뷰작성</a><!-- 리뷰 작성 진입 -->
			</c:if>
				<a class="detail-qna-header-a" href="/product/reviewAll">전체보기</a><!-- 리뷰 ALL 진입 -->
			</div>
			<div class="detail-qna-body">
				<c:if test="${reviewList != null}">
					<c:forEach var="reviewList" items="${reviewList}">
						<div class="detail-qna-item">
							<span class="detail-qna-item-number"><%=reviewNo %></span>
							<a href=# target="_blank"><!-- 리뷰 디테일 진입 -->
							<span class="detail-qna-item-detail">${reviewList.content}</span>
							</a>
							<span class="detail-qna-item-writerName">
								${reviewList.id}
							</span>
							<span class="detail-qna-item-createDate">
								<fmt:formatDate value="${reviewList.indate}" type="date"/>
							</span>
						</div>
						<%reviewNo += 1;%>
					</c:forEach>
				</c:if>
				<c:if test="${reviewList==null||reviewList.isEmpty()}">
				<div class="no_text">등록된 리뷰가 없습니다.</div>
				</c:if>
				
			</div>
		</div>
		<!-- 리뷰 끝 -->

		<!-- Q&A 시작 -->
		<div id="detail-qna-box">
			<div class="detail-qna-header">
				상품 문의
				<c:if test="${sessionScope.principal != null}">
					<a href="#" class="detail-qna-header-a" id="detail-qna-write">문의하기</a>
				</c:if>
				<a class="detail-qna-header-a" href="#">전체보기</a>
			</div>
			<div class="detail-qna-body">
			
				<div class="no_text">등록된 QNA가 없습니다.</div>
			</div>

		</div>
		<!-- Q&A 끝 -->

		<!-- 주문정보 시작 -->
		<div id="detail-purchaseInfo-box">
			<div class="detail-purchaseInfo-header">
				주문정보 <span class="products-box-detail-realInfo-popover"
					onclick="addressInfoBox();"> ∨ </span>
			</div>
			<div id="addressInfo-box">
				<b>[배송 정보 ]</b><br />
				<p>
					고객센터 연락이 어려우니 게시판에 문의주시면 빠르게 답변드리도록 하겠습니다.<br />
					CJ대한통운(1588-1255)택배를 이용하며, 매일 오후 1시 전 주문까지만 당일발송합니다.<br /> 발송한날로부터
					1~3일 이내 받아보실수 있습니다.<br /> (택배사의 영업사정에 따라 배송지연이 있을 수 있습니다.)
				</p>
				<b>[ 교환/환불 정보 ]</b><br />
				<p>
					상품가치가 현저히 훼손된 경우를 제외한 모든 사유에 대해 환불이 가능합니다.<br /> 환불요청 가능 기간은 상품 수령
					후(배송완료 시점으로부터) 7일 이내입니다.<br /> 교환/환불이 발생하는 경우 그 원인을 제공한 자가 배송비를
					부담합니다.<br /> - 고객변심 : 최초 배송비+반품 배송비+(교환의 경우) 교환 배송비는 고객이 부담<br />
					- 판매자귀책 : 최초 배송비+반품 배송비+(교환의 경우) 교환 배송비는 판매자가 부담<br /> 다음의 경우는
					예외적으로 교환 및 환불이 불가능합니다.<br /> - 상품가치가 소비자의 귀책사유로 인해 현저하게 감소한 경우<br />
					- 소비자 과실로 인한 옷의 변색(예 : 착색, 화장품, 오염 등)<br /> - 착용으로 인한 니트류 상품의 늘어남
					발생 및 가죽 제품의 주름 발생<br /> - 기타 착용 흔적 : 택 제거 등<br /> - 구매확정된 주문의 경우<br />
					- 귀금속류의 경우는 소비자분쟁조정기준에 의거 교환만 가능합니다.<br /> (단, 함량미달의 경우에는 환불이 가능함)<br />
					구매자 단순변심은 상품수령후 7일이내(구매자 반품배송비 부담)
				</p>
			</div>
		</div>
		<!-- 주문정보 끝 -->
	</div>
	<!-- 아래 박스 전체 끝 -->
	</div>
	<script>
      function go_cart() {
         alert("장바구니에 담았습니다.");
         document.formm.action = "/product/cart_insert";
         //document.formm.action = "Snack9duckServlet?command=cart_insert&prodnum="+${productVO.prodnum}+"&no=quantity";
         document.formm.submit();
      }
 		function go_buy() {
          
          document.formm.action = "/product/order_insert";
          document.formm.submit();
          
       }
	 
	</script>
</body>
<!-- footer 삽입 -->
<%@ include file="../footer.jsp"%>
</html>