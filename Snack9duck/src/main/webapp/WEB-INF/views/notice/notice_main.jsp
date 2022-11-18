<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/event.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<!-- 부트스트랩 css 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 부트스트랩 사용으로 스크립트 추가 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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
					<a class='move' href='<c:out value="${noticeList.noticeno}"/>'>
						<div class="title notice">
							<span>공지</span><c:out value="${noticeList.title}"/>
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
	<!-- Paging ------------------------->
<div class="float-center">
    <ul class="pagination">
        <c:if test="${pageMaker.prev }">
            <li class="page-item previous">
                <a class="page-link" href="${pageMaker.startPage -1 }">Previous</a>
            </li>
        </c:if>
        
        <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
            <li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}">
				<a class="page-link" href="${num }">${num }</a>
            </li>
        </c:forEach>
        
        <c:if test="${pageMaker.next }">
            <li class="page-item next">
                <a class="page-link" href="${pageMaker.endPage +1 }">Next</a>
            </li>
        </c:if>
    </ul>
</div>
<!-- Paging End -->
<!-- 검색창 ---------------------------------------->
<div class="row" style="clear:right;width:500px;margin:auto">
	<div class="col-lg-12">
		<form id="searchForm" action="/notice/notice_main" method="get">
			<select name="type">
				<option value=""
				<c:out value="${pageMaker.cri.type == null?'selected':''}"/>
				>전체보기</option>
				<option value="T"
				<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>
				>제목</option>
				<option value="C"
				<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>
				>내용</option>
				<option value="TC"
				<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>
				>제목과 내용</option>
			</select>
			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>' />
			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>' />
			<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>' />
			<button class="btn btn-primary btn-sm">Search</button>
		</form>
	</div>
</div>
<!-- 검색창 -->

<form id='actionForm' action="/notice/notice_main" method='get'>
	<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
	<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
	<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>' />
    <input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>' />
</form>

<script>
var actionForm = $("#actionForm");

$(".page-item a").on("click", function(e) {
	e.preventDefault();  //전송을 막음
	console.log('click');
	actionForm.find("input[name='pageNum']")
		.val($(this).attr("href"));
	actionForm.submit();
  });
  
$(".move").on("click", function(e) {

	e.preventDefault();
	actionForm
		.append("<input type='hidden' name='noticeno' value='"
			+ $(this).attr("href") + "'>");
	actionForm.attr("action", "/notice/notice_detail");
	actionForm.submit();
});
 
var searchForm = $("#searchForm");

$("#searchForm button").on("click",function(e) {
    // 화면에서 키워드가 없다면 검색을 하지 않도록 제어
	if (!searchForm.find("option:selected").val()) {
		alert("검색종류를 선택하세요");
		return false;
	}

	if (!searchForm.find("input[name='keyword']").val()) {
		alert("키워드를 입력하세요");
		return false;
	}

    // 페이지 번호를 1로 처리
	searchForm.find("input[name='pageNum']").val("1");

    // 폼 태그의 전송을 막음
	e.preventDefault();

	searchForm.submit();
});
</script>
</body>
<!-- footer -->
<%@ include file="../footer.jsp"%>
</html>