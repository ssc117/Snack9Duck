<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" href="/resources/css/event.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>스낵9덕 공지사항</title>
</head>

<body>
<%@ include file="../header.jsp"%>


	<div class="column">
		<div class="inner">

			<div class="notice">

				<p></p>
				<h1 style="font-size: 40px; margin-bottom: 70px; margin-top: 30px;">공지사항</h1>
				<p></p>

			</div>
		</div>
	</div>


	<div class="notice-section">
		<div class="clumn">
			<div class="inner">
				<div class="notice-list">
				
				<c:forEach var="noticeList" items="${noticeList}">

					<a href="notice_detail?noticeno=${noticeList.noticeno}">
						<div class="title notice">
							<span>공지</span> ${noticeList.title}		
						</div>
					</a>
						<p class="desc">
							<em></em> ${noticeList.indate}
						</p>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
	

<!--	<nav class="pg_wrap">
		<span class="pg"> <span class="notice_page">열린</span> <strong
			class="pg_current">1</strong> <span class="notice_page">페이지</span> <a
			href="Snack9duckServlet?command=notice_main2.jsp" class="pg_page"> 2 <span class="notice_page">페이지</span>
		</a>
		</span>
	</nav> -->

</body>
<!-- footer -->
<%@ include file="../footer.jsp"%>
</html>