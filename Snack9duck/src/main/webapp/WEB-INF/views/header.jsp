<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="/resources/css/header.css">

<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/cart.js"></script>

<script>
function open_win(url, name) {
	var popWidth = 800;
	var popHeight = 800;
	
	var left = (window.screen.width / 2) - (popWidth/2);
	var top = (window.screen.height / 2) - (popHeight/1.8);


    window.open(url, name, 
	'status=no, height=' + popHeight  + ', width=' + popWidth  + ', left='+ left + ', top='+ top );
}
</script>
<script>

</script>


</head>
<body>
	
	<header>
		<div id="header-first">
			<div id="header-logo">
				<a href="/"> <img src="/resources/img/logo.png" id="header-logo-img" /></a>
			</div>
			<div id="header_nav">
				<ul id="header_ul">
					<c:choose>
						<c:when test="${empty sessionScope.workerUser}">
							<li id="header_li"><a href="/product/gudok_list?kind=4" class="nav_list">상품목록</a></li>
							<li id="header_li"><a href="/notice/notice_main"class="nav_list">공지사항</a></li>
							<li id="header_li"><a href="/event/event_main" class="nav_list">이벤트</a></li>
						</c:when>
						<c:otherwise>	
							
							<li id="header_li"><a href="/admin/adminPage" class="nav_list">관리자<br>페이지</a></li>
							<li id="header_li"><a href="/member/logout" class="nav_list">관리자<br>로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div style="width: 200px"></div>
			
					<div id="header-main-menu">
				
					<c:choose>
					<c:when test="${empty sessionScope.workerUser}">
						<c:choose>
						<c:when test="${empty sessionScope.loginUser.id}">
							<a href="../member/login" class="header-sub-menu"><img
								src="/resources/img/menu01.png" width="30px" height="30px"></a> 
							<a href="../member/login" class="header-sub-menu"><img
								src="/resources/img/menu02.png" width="30px" height="30px"></a>
						</c:when>
						<c:otherwise>
							<a href="/member/my_page_form" class="header-sub-menu"><img
								src="/resources/img/menu01.png" width="30px" height="30px"></a> 
							
							<a href="/cart/cart" class="header-sub-menu"><img
								src="/resources/img/menu02.png" width="30px" height="30px"></a>
						</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
					
					</c:otherwise>
					</c:choose>
					</div>
				
		</div>
	</header>
	
</body>
</html>