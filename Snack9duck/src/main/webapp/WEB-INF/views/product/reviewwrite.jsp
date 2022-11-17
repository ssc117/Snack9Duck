
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/style-qna.css">
<script type="text/javascript" src="/resources/js/detail.js"></script>
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
<title>스낵9덕 상품 상세 페이지</title>
</head>
<body>
<form class="frame" name="review_write" id="review_write" method="post" action="/product/reviewwrite">

	<input type="hidden" name ="id" id="userId" value="${loginUser.id}" required/>
	<input type="hidden" name="prodnum" id="productNum" value="${prodnum}" required/>
	
	
 <div class="qna-writer-title">
		<div class="qna-name-header">작성자명 : </div>
		<div class="qna-name">
			<input type="text" value="${loginUser.id}" readonly />
		</div>
	</div> 	
	
 <textarea id="review-detail" name="content" maxlength="200"></textarea>
<!--	<input type="text" value="" id="content" style=""/> -->	
	<div class="qna-upload-btn" onclick="upload();" style="margin-bottom:100px">리뷰 등록</div>
	
</form>
<script>
function upload() {
	
	var id = $('#userid').val();
	//var id = document.form.id.val();
	var prodnum = $('#productNum').val();
	//var prodnum = frm.prodnum.val();
	var content = $('#review-detail').val();
	//var content = frm.content.val();

	if(content.trim()==""){
		alert("글 내용을 입력해주세요");
		return false;
	}if (content.length > 200) {
    	alert('글자수는 200자까지 입력 가능합니다.');
        return false;
    }else
	alert("리뷰가 등록되었습니다..");

	//review_wirte.action = "/product/reviewwrite"; 
	review_write.action = "/product/reviewwrite";
	review_write.submit();
	//$('#review_wirte').attr("action","/product/reviewwrite");
	//$('#review_wirte').submit();
	
	//review_wirte.submit();
	}
</script>
</body>
<%@ include file="../footer.jsp"%>
</html>