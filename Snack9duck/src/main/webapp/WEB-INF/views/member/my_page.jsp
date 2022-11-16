<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../header.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/memberUpdate.css">
<script type="text/javascript" src="/resources/js/member.js"></script>
<title>Insert title here</title>
</head>
<body>
 <form id="register_form" name="register_form" class="form_1" method="post" action="member/my_page" >
        <h3 style="text-align: center">회원 정보 수정</h3>
        <div class="register_table">
            <table>
                <caption id="caption_id"></caption>
                <colgroup>
                    <col width="130">
                    <col width="*">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">
                            <label for="reg_id" class="req">아이디</label>
                        </th>
                        <td>
                            <input type="text" name="id" id="reg_id" required class="reg_input" 
                            value="${loginUser.id}" readonly> 

                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <label for="reg_pwd" class="req">비밀번호 변경</label>
                        </th>
                        <td>
                            <input type="password" name="pwd" id="reg_pwd" required class="reg_input" minlength="4"
                                maxlength="20" value="">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <label for="reg_pwd_re" class="req">비밀번호 확인</label>
                        </th>
                        <td>
                            <input type="password" name="pwdCheck" id="reg_pwd_re" required class="reg_input" minlength="4"
                                maxlength="20" placeholder="비밀번호를 확인해주세요">

                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <label for="reg_name" class="req">이름 변경</label>
                        </th>
                        <td>
                            <input type="text" name="name" id="reg_name" required class="reg_input" minlength="2"
                                maxlength="20" value="${loginUser.name}" >
                        </td>
                    </tr>
                    <br>
                    <tr>
                        <th scope="row">
                            <label for="reg_zip" class="req">주소 변경</label>
                        </th>
                        <td>
                            <input type="text" name="zip_code" value="${loginUser.zip_code}" id="reg_zip" required class="reg_input"
                                maxlength="6" readonly="readonly" placeholder="우편번호">
                            <button type="button" class="zip_button"
                                onclick="win_zip('fregisterform', 'mb_zip', 'mb_addr1', 'mb_addr2', 'mb_addr3', 'mb_addr_jibeon');">주소검색</button>
                            <br>
                            <input type="text" name="addr1" value="${loginUser.addr1}" id="reg_mb_addr1" required class="reg_input"
                                readonly="readonly" placeholder="기본주소 ">
                            <!-- <label for="reg_mb_addr1" class="sound_only">기본주소<strong> 필수</strong></label> -->
                            <br>
                           
                            <input type="text" name="addr3" value="${loginUser.addr3}" id="reg_mb_addr3" class="reg_input"
                                readonly="readonly" placeholder="참고항목">
                            <!-- <label for="reg_mb_addr3" class="sound_only">참고항목</label> -->
                            <br>
                             <input type="text" name="addr2" value="${loginUser.addr2}" id="reg_mb_addr2" class="reg_input"
                                placeholder="상세주소" required>
                            <!-- <label for="reg_mb_addr2" class="sound_only">상세주소</label> -->
                            

                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="reg_mb_hp" class="req">휴대전화</label></th>
                        <td>
                            <div class="telselect_wrap">
                                <select name="phone1" id="hp1" class="reg_input" value="${loginUser.phone1}">
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select>
                                <b>-</b>
                                <input type="text" name="phone2" value="${loginUser.phone2}" id="hp2" class="reg_input" maxlength="4"
                                    required>
                                <b>-</b>
                                <input type="text" name="phone3" value="${loginUser.phone3}" id="hp3" class="reg_input" maxlength="4"
                                    required>
                            </div>

                            <input type="hidden" name="mb_hp" value="" id="reg_mb_hp">

                            <input type="hidden" name="old_mb_hp" value="">
                        </td>
                    </tr>
                    <br>
                    <tr>
                        <th scope="row"><label for="reg_mb_email" class="req">이메일 변경</label></th>
                        <td>
                            <input type="hidden" name="old_email" value="">

                            <div class="emailselect_wrap">
                                <input type="text" name="email1"  value="${loginUser.email1}" id="email1" class="reg_input" maxlength="20"
                                    required="">
                                <b>@</b>
                                <input type="text" name="email2" value="${loginUser.email2}" id="email2" class="reg_input" maxlength="20"
                                    required>
                                <select name="email3" id="email3" class="reg_input" required>
                                    <option value="">선택하세요</option>
                                    <option value="">직접입력</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="nate.com">nate.com</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="hanmail.com">hanmail.com</option>
                                    <option value="hotmail.com">hotmail.com</option>
                                    <option value="yahoo.com">yahoo.com</option>
                                </select>
                            </div>

                            <input type="hidden" name="mb_email" value="" id="reg_mb_email">


                            <span id="msg_mb_email" class="reg_msg"></span>
                        </td>
                    </tr>
                </tbody>
            </table>

        </div>
        <br>
        <div class="reg_btn">
            <input type="button" onclick = "location.href = '/member/my_page_form' " class="reg_button" id="reg_button" value="뒤로가기">
        
            <input type="button" class="reg_button" id="reg_button" value="수정완료" onclick="go_update()">
        </div>
        <div class="withdraw_div">
            <br>
            

        </div>

    </form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>
        $("#email3").change(function () {
            $("#email2").val($("#email3").val());
        });

    </script>

    <!-- 주소검색 기능 스크립트-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
function go_update() {
	var phoneRegExp =/^[0-9]{3,4}$/;
	var pwdRegExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,20}$/;
	var nameRegExp = /^[a-z가-힣]{2,20}$/;
	var email1RegExp =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){2,20}$/;
	var email2RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	
	
	
	
	
    if (document.register_form.pwd.value=="") {
        alert("비밀번호를 입력해 주세요.");
        document.register_form.pwd.focus();
		return false; 
    } else if (document.register_form.pwdCheck.value=="") {
        alert("비밀번호확인을 입력해 주세요.");
        document.register_form.pwd.focus();
		return false; 
    }else if (!pwdRegExp.test(document.register_form.pwd.value)) {
        alert("비밀번호는 4~20자리의 최소하나의 문자와 숫자를 포함하게 입력해주세요. ");
        document.register_form.pwd.focus();
		return false;
    }else if (!pwdRegExp.test(document.register_form.pwdCheck.value)) {
        alert("비밀번호확인은 4~20자리의 최소하나의 문자와 숫자를 포함하게 입력해주세요. ");
        document.register_form.pwdCheck.focus();
		return false;
    }else if (document.register_form.pwd.value != document.register_form.pwdCheck.value) {
        alert("비밀번호가 일치하지 않습니다.");
        document.register_form.pwd.focus();
		return false;
   
    } else if (document.register_form.name.value == "") {
        alert("이름을 입력해 주세요.");
        document.register_form.name.focus();
		return false;	
    }else if (!nameRegExp.test(document.register_form.name.value)) {
        alert("이름은 한글 2~6자리로 입력해주세요.");
        document.register_form.name.focus();
		return false;	
    }else if (document.register_form.zip_code.value == "") {
        alert("주소를 입력해주세요.");
        document.register_form.zip_code.focus();
		return false;
    }else if (document.register_form.addr2.value == "") {
        alert("주소를 입력해주세요.");
        document.register_form.addr2.focus();
		return false;
    }else if (document.register_form.phone1.value=="") {
        alert("전화번호를 확인해 주세요.");
        document.register_form.phone2.focus();
		return false;
	}else if (document.register_form.phone2.value=="") {
        alert("전화번호를 확인해 주세요.");
        document.register_form.phone2.focus();
		return false;
	}else if (document.register_form.phone3.value=="") {
        alert("전화번호를 확인해 주세요.");
        document.register_form.phone3.focus();
		return false;
	}else if (!phoneRegExp.test(register_form.phone2.value)) {
        alert("전화번호에 숫자를 기입해주세요.");
        document.register_form.phone2.focus();
		return false;
	}else if (!phoneRegExp.test(register_form.phone3.value)) {
        alert("전화번호를  숫자를 기입해주세요.");
        document.register_form.phone3.focus();
		return false;
    }else if (document.register_form.email1.value == "") {
        alert("이메일을 입력해 주세요.");
        document.register_form.emai1l.focus();
		return false;
    }else if (!email1RegExp.test(document.register_form.email1.value)) {
        alert("이메일을 확인해주세요");
        document.register_form.email1.focus();
		return false;
    }else if (document.register_form.email2.value == "") {
        alert("이메일을 입력해 주세요.");
        document.register_form.email2.focus();
		return false;
    }else if (!email2RegExp.test(document.register_form.email2.value)) {
        alert("이메일을 확인해주세요");
        document.register_form.email2.focus();
		return false;
    } else{
		alert("회원정보 수정이 완료되었습니다..");
				
		register_form.action = "/member/my_page";
		register_form.submit();
	} 
    
}

</script>
    
</body>
<%@ include file="../footer.jsp"%>
</html>