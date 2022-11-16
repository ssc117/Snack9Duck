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


					<form method="post" id="find_id_form" action="/member/find_id_form">

						<div>
							<input name="name" class="find_member" type="text"
								placeholder="이름" />
						</div>
						<span style="font-size: 13px;">회원가입 시 등록한 이름을 입력해주세요.</span>
						<div style="margin-top: 30px;">


							<select name="phone1" id="hp1" class="reg_input" required>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select> <b>-</b> <input type="text" name="phone2" value="" id="hp2"
								class="reg_input" maxlength="4" required> <b>-</b> <input
								type="text" name="phone3" value="" id="hp3" class="reg_input"
								maxlength="4" required>

						</div>
						<span style="font-size: 13px;">회원가입 시 등록한 전화번호를 입력해주세요.</span>
						<p></p>
						<div style="margin-top: 30px">
							<button class="find_button" type="submit">아이디 찾기</button>
						</div>
						<c:if test = "${result == 0 }">
                			<div class = "find_warn">이름 또는 전화번호를 잘못 입력하셨습니다.</div>
            			</c:if>
					</form>
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
	<div style="height: 100px;"></div>
	</div>
	<script>
    $(".find_button").click(function(){
        
    	//find_id_form.action="/member/find_id_form";
    	//find_id_form.submit();
    	$("#find_id_form").attr("action", "/member/find_id_form");
        $("#find_id_form").submit();
 
    });
</script>
</body>
<%@ include file="../footer.jsp"%>
</body>
</html>