<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/findMember.css">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="wrap">
	<div class="frame find_form">
		<article class="card-body" style="max-width: 400px; margin: auto;">
			<h2 style="margin-bottom: 100px;">아이디 찾기</h2>
			 <div class="form-group input-group fg-x400">
            <div class="fg-x400">
			
				
					<p style="text-align: center">"${member.name}"님의 아이디는
						"${member.id}"입니다</p>
					
					<div style="margin-top:70px; margin-bottom:50px;">
							<button class="find_button" onclick="location.href='/member/login'">로그인 하러가기</button>
					</div>
					<div style="width: 430px; margin-top: 30px; margin-bottom: 100px">
						<span style="font-size: 15px; margin-right: 70px;"> 
						<a href="find_id_form">아이디 찾기</a>
						</span> <span style="font-size: 15px; margin-right: 70px;">
						<a href="find_pwd_form">비밀번호 찾기</a>
						</span> <span style="font-size: 15px;">
						<a href="joinForm">회원가입 하기</a></span>
					</div>
					
				
			
			</div>
			</div>
		</article>
	</div>
	</div>

</body>
<%@ include file="../footer.jsp"%>
</html>