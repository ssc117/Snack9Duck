<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/register.css">
<script type="text/javascript" src="/resources/js/member.js"></script>

<title>회원가입</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	
	 <form id="register_form" name="register_form" method="post" action="/member/joinForm">
	 
        <h3 style="text-align: center">회원가입 정보 입력</h3>
        <div class="register_table">
            <table>
                <caption id="caption_id"></caption>
                <colgroup>
                    <col width="130">
                    
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">
                            <label for="reg_id" class="req">아이디</label>
                        </th>
                        <td>
                            <input type="text" name="id" id="id" required class="reg_input" minlength="3"
                                maxlength="20" placeholder="영문 소문자/숫자, 3~20자" >
                                <input type="hidden"    id="reid" name="reid" >
                                <input type="button" value="중복 체크"  class="check_button" name="check_button" onclick="checkId()">
						<!--   <input type="button" value="중복 체크"  class="check_button" name="check_button" onclick="checkId()"> -->
							<span class="id_ok">사용 가능한 아이디 입니다.</span>
							<span class="id_already">사용 불가능한 아이디 입니다..</span>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <label for="reg_pwd" class="req">비밀번호</label>
                        </th>
                        <td>
                            <input type="password" name="pwd" id="reg_pwd" value="" required class="reg_input" 
                                maxlength="20" placeholder="">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <label for="reg_pwd_re" class="req">비밀번호 확인</label>
                        </th>
                        <td>
                            <input type="password" name="pwdCheck" id="reg_pwd_re" value="" required class="reg_input" 
                                maxlength="20" placeholder="">

                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <label for="reg_name" class="req">이름</label>
                        </th>
                        <td>
                            <input type="text" name="name" id="reg_name" value="" required class="reg_input" 
                                maxlength="20">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <label for="reg_zip" class="req">주소</label>
                        </th>
                        <td>
                            <input type="text" name="zip_code" value="" id="reg_zip" required class="reg_input"
                                maxlength="6" readonly="readonly" placeholder="우편번호">
                            <button type="button" class="zip_button"
                                onclick="win_zip('fregisterform', 'mb_zip', 'mb_addr1', 'mb_addr2', 'mb_addr3', 'mb_addr_jibeon');">주소검색</button>
                            <br>
                            <input type="text" name="addr1" value="" id="reg_mb_addr1" required class="reg_input"
                                readonly="readonly" placeholder="기본주소 ">
                            <!-- <label for="reg_mb_addr1" class="sound_only">기본주소<strong> 필수</strong></label> -->
                            <br>
                           
                            <input type="text" name="addr3" value="" id="reg_mb_addr3" class="reg_input"
                                readonly="readonly" placeholder="참고항목">
                            <!-- <label for="reg_mb_addr3" class="sound_only">참고항목</label> -->
                            <br>
                             <input type="text" name="addr2" value="" id="reg_mb_addr2" class="reg_input"
                                placeholder="상세주소" required>
                            <!-- <label for="reg_mb_addr2" class="sound_only">상세주소</label> -->
                            

                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="reg_mb_hp" class="req">휴대전화</label></th>
                        <td>
                            <div class="telselect_wrap">
                                <select name="phone1" id="hp1" class="reg_input" required>
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select>
                                <b>-</b>
                                <input type="text" name="phone2" value="" id="hp2" class="reg_input" maxlength="4"
                                    required>
                                <b>-</b>
                                <input type="text" name="phone3" value="" id="hp3" class="reg_input" maxlength="4"
                                    required>
                            </div>

                            <input type="hidden" name="mb_hp" value="" id="reg_mb_hp">

                            <input type="hidden" name="old_mb_hp" value="">
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row"><label for="reg_mb_email" class="req">이메일</label></th>
                        <td>
                            <input type="hidden" name="old_email" value="">

                            <div class="emailselect_wrap">
                                <input type="text" name="email1" value="" id="email1" class="reg_input" maxlength="20"
                                    required>
                                <b>@</b>
                                <input type="text" name="email2" value="" id="email2" class="reg_input" maxlength="20"
                                    required>
                                <select name="email3" id="email3" class="reg_input" required>
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
        <br><br><br><br>

        <div class="policy_checkbox">
            <input type="checkbox" name="agreecheck" id="agreecheck" >
            <label for="agreecheck">(필수) 
           	<a href="javascript:void(0)" onclick="open_win('terms_of_service','update')" class="agreelink" > 이용약관</a>&nbsp;과&nbsp;
            <a href="javascript:void(0)" onclick="open_win('sign_up_privacy','update')" class="agreelink">개인정보 수집 및 이용</a>
          		 에 동의합니다. </label>
        </div>
        <br>
        <div class="reg_btn">
            <input type="button" class="reg_button" id="join_button" value="가입하기" onclick="go_save()">

        </div>

    </form>

	<script>
	const form = document.querySelector('#form__wrap');
	
	</script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!--이메일 주소 자동 입력-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>
        $("#email3").change(function () {
            $("#email2").val($("#email3").val());
        });

    </script>

    <!-- 주소검색 기능 스크립트-->
   
  <script>
 function checkId(){
     var id = $('#id').val(); //id값이 "id"인 입력란의 값을 저장
     var idRegExp = /^[a-z0-9]{3,20}$/;
 	 if (!idRegExp.test(id)) {
    	 alert("아이디는 영문 소문자 또는 숫자를 사용한 3~20자리로 입력해주세요.");
    	 $('#id').val('');
    	 document.register_form.id.focus();
		 return false;
 	 }
     $.ajax({
         url:'./idCheck', //Controller에서 요청 받을 주소
         type:'post', //POST 방식으로 전달
         data:{id:id},
         success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
        	 console.log(cnt);
             if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
            	 alert("사용가능한 아이디입니다.");
             	 $('#reid').val($('#id').val());
                 idckCheck = true;;
                 console.log($('#reid').val());
                
             } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                 
                 alert("이미 있는 아이디 입니다. 아이디를 다시 입력해주세요");
                 $('#id').val('');
                 
             }
         },
         error:function(){
             alert("에러입니다");
         }
     });
 };

 function go_save() {
		var phoneRegExp =/^[0-9]{3,4}$/;
		var pwdRegExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,20}$/;
		var nameRegExp = /^[a-z가-힣]{2,20}$/;
		var email1RegExp =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){3,20}$/;
		var email2RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		
		
		
		
		
	    if (document.register_form.id.value == "") {
	        alert("아이디를 입력하여 주세요.");
	        document.register_form.id.focus();
			return false;
	    } else if (document.register_form.id.value != document.register_form.reid.value) {
	        alert("중복확인을 클릭하여 주세요.");
	        document.register_form.id.focus();
			return false;
	    } else if (document.register_form.pwd.value=="") {
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
	    } else if(document.register_form.agreecheck.checked != true){
	   		alert("개인정보 수집에 동의해 주세요.");
	    	frm.confirm.focus();
	    	return false;
		}else{
			alert("회원가입이 완료되었습니다..");
					
			register_form.action = "/member/joinForm";
			register_form.submit();
		} 

	    
	}

 </script>

	
	<div style="height: 100px;"></div>
</body>
	<%@ include file="../footer.jsp"%>
</html>