<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/login.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>  -->

<title>Insert title here</title>
</head>
<body>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
  </script>



<%@ include file="../header.jsp"%>
	<div class="frame login_form">
		
		<article class="card-body" style="max-width: 400px; margin: auto;">
			<p style="font-size: 28px;">로그인</p>
			<div>
				<div>
				<%-- 
					<a
						href="https://kauth.kakao.com/oauth/authorize?client_id=1666fec3abffe37c41210e71a800aa35&redirect_uri=http://localhost/shop/kakao_oauth&response_type=code">
						<img class="kakao_login_btn"
						src="img/kakao_login_large_wide.png" />
					</a>

					<p style="text-align: center">다른방식으로 로그인</p>
					--%>
					<form method="post" id="login_form">
						<p style="font-size: 20px; margin-top:80px;">아이디</p>
						<input name="id" class="login_input" type="text" />
						<p style="font-size: 20px;margin-top:30px;">비밀번호</p>
						<input name="pwd" class="login_input" type="password">						
						
						<div style="margin-top:100px">
							<button type="submit" class="login_btn">로그인</button>
						</div>
					</form>
				</div>
			</div>
		
			<br>
			<div style="width: 430px;">
				<span style="font-size: 15px; margin-right: 70px;">
				<a href="find_id_form">아이디 찾기</a>
				</span>
				<span style="font-size: 15px; margin-right: 70px;">
				<a href="find_pwd_form">비밀번호 찾기</a>
				</span> 
				<span style="font-size: 15px;"><a href="joinForm">회원가입 하기</a></span>
			</div>
		<c:if test = "${result == 0 }">
                <div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            </c:if>
		</article>
	</div>
	<div style="height: 100px;"></div>

 
<script>
    /* 로그인 버튼 클릭 메서드 */
    $(".login_btn").click(function(){
        
    	$("#login_form").attr("action", "/member/login");
        $("#login_form").submit();
 
    });
</script>

</body>
<%@ include file="../footer.jsp"%>
</html>