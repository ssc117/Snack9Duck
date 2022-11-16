<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/login.css">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../header.jsp"%>
	<div class="wrap">
		<form method="post" id="admin_form" name="admin_form"
			class="frame login_form">

			<article class="card-body" style="max-width: 400px; margin: auto;">
				<p style="font-size: 28px; margin-bottom: 100px;">관리자 로그인</p>
				<div>
					<div>
						<p style="font-size: 20px;">아이디</p>
						<input name="workerid" class="login_input" type="text">
						<p style="font-size: 20px;">비밀번호</p>
						<input name="workerpwd" class="login_input" type="password"
							value="">

						<div style="margin-top: 100px">
							<button type="submit" class="login_btn">로그인</button>
						</div>
						<c:if test="${result == 0 }">
							<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
						</c:if>

					</div>
				</div>

				<br>

			</article>
		</form>
		<div style="height: 100px;"></div>
	</div>
	<script type="text/javascript">
		$(".login_btn").click(function() {

			$("#admin_form").attr("action", "/admin/admin_login_form");
			$("#admin_form").submit();

		});
	</script>
</body>
<%@ include file="../footer.jsp"%>>
</html>