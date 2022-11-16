<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="/resources/css/memberlist.css?ver=1">
  <link rel="stylesheet" type="text/css" href="/resources/css/scrollbar.css">

<style>
[type="button"] {
   all: unset;
}

[type="button"]:hover {
   text-decoration: underline;
   cursor:pointer;
   color:red;
}
</style>

</head>

<body>
  <%@ include file="../header.jsp" %>
  
  	<script>
function allChk(obj){
    var chkObj = document.getElementsByName("RowCheck");
    var rowCnt = chkObj.length - 1;
    var check = obj.checked;
    if (check) {﻿
        for (var i=0; i<=rowCnt; i++){
         if(chkObj[i].type == "checkbox")
             chkObj[i].checked = true;
        }
    } else {
        for (var i=0; i<=rowCnt; i++) {
         if(chkObj[i].type == "checkbox"){
             chkObj[i].checked = false;
         }
        }
    }
} 

function fn_userDel() {

    var userid = "";
    var memberChk = document.getElementsByName("id");
    var chked = false;
    var indexid = false;
    for (i = 0; i < memberChk.length; i++) {
        if (memberChk[i].checked) {
            if (indexid) {
                userid = userid + '-';
            }
            userid = userid + memberChk[i].value;
            indexid = true;
            
        }
    }
    if (!indexid) {
        alert("삭제할 회원을 선택해주세요");
        return;
    }else{
	    var agree = confirm("선택한 계정을 삭제 하시겠습니까?");
	    if (agree) {
	    	frm.action = "/admin/memberDelete";
			frm.submit();
	    }
    }

}﻿
</script>
<div class="wrap">

    <div id="table" align="center">
    <form name="frm" method="post">
        <table class="list">
            <tr>
                <td colspan="11" style="border: gray; text-align: right">
                <h2 style="text-align: center">회원리스트</h2>
                &nbsp;
                </td>
            </tr>
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>우편번호</th>
                <th>주소</th>
                <th>상세주소</th>
                <th>가입일</th>
                <th>가입상태</th>
                <th><input type="button" value="선택삭제" onclick="fn_userDel()">
					<input style="boder: none; vertical-align: middle; margin-left: 5px;"
					id="allCheck" type="checkbox" onclick="allChk(this);" /></th>
            </tr>
            <c:forEach var="MemberVO" items="${memberList}">
                <tr class="record">
                    <td>${MemberVO.id}</td>
                    <td>${MemberVO.name}</td>                    
                    <td>${MemberVO.phone1}-${MemberVO.phone2}-${MemberVO.phone3}</td>
                    <td>${MemberVO.email1}@${MemberVO.email2}</td>
                    <td>${MemberVO.zip_code}</td>
                    <td>${MemberVO.addr1}</td>	
                    <td>${MemberVO.addr2} ${MemberVO.addr3}</td>
                    <td>${MemberVO.regdate}</td>
                    <td>${MemberVO.useyn}</td>
                    <td><input type="checkbox" name="id" value="${MemberVO.id}"/></td>
                </tr>
            </c:forEach>
        </table>
        		
        		</form>
    </div>
    </div>

	
	
	
</body>
<%@ include file="../footer.jsp" %> 
</html>