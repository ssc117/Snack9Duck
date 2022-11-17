<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/withdrawal.css">
<script type="text/javascript" src="/resources/js/member.js"></script>
<title>스낵9덕 회원탈퇴</title>
</head>
<body>
 <!-- header 삽입 -->
<%@ include file="../header.jsp"%>
<form name="register_form" method="post" action="/member/member_delete" >
<div class="text">
    <div class="textmain">
      <h3 style="font-size: 40px; color: red;">회원탈퇴 신청 전 꼭 읽어주세요!</h3><br>
      <p style="font-size: 25px;">탈퇴하시면 모든 정보가 삭제됩니다.아래 유의사항을 확인하시고 신중하게 결정해주세요.<br><br><br>
        -탈퇴 시 모든 정보가 소멸되며 재가입 후에도 복구할 수 없습니다.<br><br>
        -재가입 시 신규 혜택을 받으실 수 없습니다.<br><br>
        -이용내역은 서비스 이용약관과 관련 법률에 의해 일정 기간 보관 후 자동 파기됩니다.</p>
    </div>
  </div>
  <div class="bottom">
 
    <input type="checkbox" id="cb1"  name="agreecheck"><span style="font-size: 20px;">위 내용을 숙지하고 동의합니다.</span><br>
     <input type="button" value="탈퇴하기" onclick="go_del_ok()">
    
    

  </div>
</form>
<script>

function go_del_ok(){
    if(document.register_form.agreecheck.checked != true){
    alert("위 내용에 동의해 주세요.");
    register_form.confirm.focus();
    return false;
    } else {
    	alert("회원탈퇴 되었습니다.");
		document.register_form.action = "/member/member_delete";
        document.register_form.submit();
    }
	
}	
</script>
</body>
<!-- footer 삽입 -->
<%@ include file="../footer.jsp"%>
</html>