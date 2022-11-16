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
<!-- <script type="text/javascript" src="js/cart.js"></script>  -->
<title>공지사항 수정</title>

<style>
#event_wrap {
	/* border: 1px solid red; */
	text-align: center;

}

#event {
	margin-left: 25%;
	text-align: center;
	width: 1000px;
	/* border: 1px solid red; */
	margin-bottom: 30px;
}

strong {
	font-size: 20px;
}

.form_tit {
	text-align: center;
	display: flex;
	width: 1000px;
	padding: 10px;
}

.form_title {
	width: 150px;
}

.form_input {
	padding: 11px 9px 9px;
	border: 1px solid #aaa;
	width: 700px;
}

#input_box {
	width: 700px;
	height: 300px;
	border: 0 solid black;
	font-size: 20px;
	resize: none;
}

.file_btn {
	color: #FCFCFC !important;
	background-color: #404040 !important;
	border-color: #404040 !important;
	text-align: center;
	font-size: 20px;
	width: 100% !important;
	height: 54px !important;
	max-width: 240px;
	text-align: center;
	cursor: pointer;
	margin-bottom: 50px;
}
</style>

</head>

<body>
	<!-- header -->
	<%@ include file="../../header.jsp"%>

	<!-- BODY-->
	<div id="event_wrap">
		<form name="form" method="post" 
			onsubmit="return false;"action="/admin/notice/admin_notice_Update" >
			<div id="event_form">
				<h2>공지사항 수정</h2>
				 <input type="hidden" name="noticeno" value="${notice.noticeno}">
		<!--	<input type="hidden" name="title" value="${notice.title}"> --> 
				<div id="event">
					<div class="form_tit">
						<div class="form_title">
							<strong>제목 </strong> <span class="star">*</span>
						</div>
						<div class="form_input">
							<input type="text" name="title" value="${notice.title}"
								style="border: 0 solid black; width: 700px; font-size: 18px;">
						</div>
					</div>
					 <div class="form_tit">
                  <div class="form_title">
                      <strong>작성자 </strong> <span class="star">*</span>
                  </div>
                  <div class="form_input">
                      <input type="text" name="writer" value="${notice.writer}" readonly 
                      				style="border:0 solid black; width: 700px; font-size: 18px;">
                  </div>
                </div>
					
					<div class="form_tit">
						<div class="form_title">
							<strong> 내용 </strong> <span class="star">*</span>
						</div>
						<div class="form_input">
							<input type="text" name="content" value="${notice.content}"  id="event_content"
								style="border: 0 solid black; width: 700px; height: 250px; font-size: 18px;"
								placeholder="공지사항 내용 상세 입력" />
						</div>
					</div>
				</div>

				<div id="qna_submit">
					<input type="submit" onClick="Checkform()" class="file_btn"
						id="file_btn" value="수정하기">
				</div>
				<div id="qna_submit">
					<input type="button" class="file_btn"
						id="delete_btn" value="삭제하기">
				</div>
			</div>
		</form>
	</div>

	<script>
function Checkform() {
    if( form.title.value == "" ) {
    	form.title.focus();
        alert("제목을 입력해 주세요.");
        return false;
    }else if( form.content.value == "" ) {
    	form.content.focus();
        alert("내용을 입력해주세요.");
        return false; 
    }else {
    	alert("수정이 완료되었습니다.");
    	form.action = "/admin/notice/admin_notice_Update";
		form.submit();
	}
	
}
$("#delete_btn").on("click", function(e){
    form.action = "/admin/notice/delete";
    alert("공지사항이 삭제되었습니다.");
    form.submit();
    
});
</script>

	<!-- footer -->
	<%@ include file="../../footer.jsp"%>

</body>

</html>