<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="frame">
	
	<div class="qnadetail-box">
		<div class="qna-detail-box-header">
					
			<span class="qna-detail-box-header-title">μμ±μΌμ</span>
			<span class="qna-detail-box-header-content">
				${detailReviewDto.createDate }
			</span>
		</div>

		<div class="qna-detail-box-body-content">
			${detailReviewDto.detail }
		</div>
	</div>
	
	
</div>

<%@ include file="../footer.jsp"%>