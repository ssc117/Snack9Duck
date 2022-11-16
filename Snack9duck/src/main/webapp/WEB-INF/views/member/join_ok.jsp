<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/register_ok.css">
<title>Insert title here</title>
</head>
<body>
	<!-- header 삽입 -->
	<%@ include file="../header.jsp"%>
	<div class="ok_wrap">
		<div class="ok_main" >
		
			<img id="ok_duck" src="/resources/img/ok_duck.png"><br> 
			<span id="title_font">환영합니다!</span><br> <span id="ef_font">${member.name}</span>
			<span id="normal_font">님, 회원가입을 축하드립니다.</span><br> 
			<span id="normal_font">스낵9덕에 가입하신 아이디는</span> <span id="ef_font">${member.id}</span>
			<span id="normal_font">입니다.</span>
			<div class="reg_btn">
				 <a href="/member/login"><button class="ok_button"> 로그인 하러가기</button></a>
				 
			</div>
		
		</div>
	</div>

</body>
<!-- footer 삽입 -->
<%@ include file="../footer.jsp"%>
</html>