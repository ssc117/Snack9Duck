<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/QNA.css" />
<script type="text/javascript" src="/resources/js/cart.js"></script>
<title>스낵9덕 1:1 문의</title>
</head>

<body>
	<!--/* header -->
	<%@ include file="../header.jsp"%>
	<!-- header -->
	<!-- BODY-->
	<div id="QNA_wrap">
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
		</aside>

		<form name="form" method="post" action="/qna/qnaWrite">
			<div id="qna_form">
				<h2>1:1 문의</h2>
				<div class="form_tit">
					<div class="form_title">
						<strong>문의유형</strong> <span class="star">*</span>
					</div>
					<div class="form_input" style="width: 250px;">
						<select size="1" name="type"
							style="width: 250px; border: 0 solid black; font-size: 18px;">
							<option value="배송 문의">배송 문의</option>
							<option value="회원 문의">회원 문의</option>
							<option value="결제 문의">결제 문의</option>
							<option value="이벤트 문의">이벤트 문의</option>
							<option value="기타">기타</option>
						</select>
					</div>
				</div>
				<div class="form_tit">
					<div class="form_title">
						<strong>문의 제목 </strong> <span class="star">*</span>
					</div>
					<div class="form_input">
						<input type="text" name="subject"
							style="border: 0 solid black; width: 700px; font-size: 18px;">
					</div>
				</div>

				<div class="form_tit">
					<div class="form_title">
						<strong>문의내용</strong> <span class="star">*</span>
					</div>

					<div class="form_input">
						<textarea id="input_box" maxlength="333" name="content"
							placeholder="자세한 내용을 기재해 주시면 더욱 신속히 답변 드릴 수 있습니다."></textarea>
						<!-- <input type="text" id= "input_box" maxlength="500" placeholder="자세한 내용을 기재해 주시면 더욱 신속히 답변 드릴 수 있습니다." > -->
					</div>
				</div>
				<div class="form_tit">
					<div class="form_title">
						<strong>이메일 주소</strong> <span class="star">*</span>
					</div>
					<div class="form_input">
						<input type="text" name="email" readonly
							value="${loginUser.email1}@${loginUser.email2}"
							style="border: 0 solid black; width: 700px; font-size: 18px;">
					</div>
				</div>
				<div class="form_tit">
					<div class="form_title">
						<strong>ID</strong> <span class="star">*</span>
					</div>
					<div class="form_input">
						<input type="text" name="id" readonly value="${loginUser.id}"
							style="border: 0 solid black; width: 700px; font-size: 18px">
					</div>
				</div>
				<div id="qna_submit">
					<input type="submit" value="문의 접수" class="file_btn">
				</div>
			</div>
		</form>
	</div>
</body>
<!-- footer -->
<%@ include file="../footer.jsp"%>

</html>