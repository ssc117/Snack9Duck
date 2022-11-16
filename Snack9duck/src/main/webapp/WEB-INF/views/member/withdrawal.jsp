<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/withdrawal.css">
<script type="text/javascript" src="member/member.js"></script>
<title>스낵9덕 회원탈퇴</title>
</head>
<body>
 <!-- header 삽입 -->
<%@ include file="../header.jsp"%>
<form name="register_form" method="post" action="Snack9duckServlet?command=member_del_form_ok" >
<div class="text">
    <div class="textmain">
      <h3 style="font-size: 25px;">회원탈퇴 신청 전 꼭 읽어주세요!</h3><br>
      <p style="font-size: 13px;">탈퇴하시면 모든 정보가 삭제됩니다.아래 유의사항을 확인하시고 신중하게 결정해주세요.<br><br><br><br>
        -현재 보유 중인 포인트와 쿠폰은 즉시 소멸되며 재가입 후에도 복구할 수 없습니다.<br><br>
        -동일한 SNS 계정을 사용한 재가입은 7일이내에는 불가능합니다.<br><br>
        -재가입 시 신규 혜택을 받으실 수 없습니다.<br><br>
        -이용내역은 서비스 이용약관과 관련 법률에 의해 일정 기간 보관 후 자동 파기됩니다.</p>
    </div>
  </div>
  <div class="bottom">
 
    <input type="checkbox" id="cb1"  name="agreecheck">위 내용을 숙지하고 동의합니다.<br>
     <input type="button" value="탈퇴하기" onclick="go_del_ok()">
    
    <input type="button" class="delete" value="탈퇴하기" onclick="go_del_ok()">

  </div>
</form>
</body>
<!-- footer 삽입 -->
<%@ include file="../footer.jsp"%>
</html>