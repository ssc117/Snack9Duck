<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
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
				<h1 style="font-size: 40px;">공지사항</h1>
				<p></p>
			</div>
		</div>
	</div>
	<div class="notice_wrap">
	<div class="notice-list">

		<h1>
			<p class="view_tit">${notice_detail.title}</p>
		</h1>

	</div>
	<div class="left">

		<h2 style="color: gray">${notice_detail.indate}</h2>

		<div class="board_txt_area fr-view">
			<div class="margin-top-xxl _comment_body">
				<p>${notice_detail.content}</p>
			</div>
		</div>
	</div>


	<form id='operForm' action="/notice/notice_detail" method="get">
			<input type="hidden" id="noticeno" name="noticeno" value="${notice_detail.noticeno}">
			<input type="hidden" name="pageNum" value="${cri.pageNum}">
			<input type="hidden" name="amount" value="${cri.amount}">
			<input type="hidden" name="pageNum" value="${cri.pageNum}">
			<input type="hidden" name="amount" value="${cri.amount}">
			<button data-oper="list" class="btn btn-primary btn-sm">목록으로 돌아가기</button>
	    </form>
<script> 
	$(document).ready(function() {
		var operForm = $("#operForm");
	
		$("button[data-oper='list']").on("click", function(e){
			operForm.find("#noticeno").remove();
			operForm.attr("action", "/notice/notice_main")
			operForm.submit();
		});
	});
</script>
	
</body>
<%@ include file="../footer.jsp"%>
</html>