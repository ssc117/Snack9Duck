<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../header.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/memberInfo.css">
<title>Insert title here</title>
</head>
<body>
<div id="mem_wrap">
 <aside>
         <div class="management">
            <div id="mypage_title">
               <a class="text_deco">마이페이지</a>
            </div>
            <br>
            <div class="mypage_list">
               <a class="text_deco" href="/member/gudok_setting">구독 관리</a>
            </div>
            <div class="mypage_list">
               <a class="text_deco" href="/qna/qnaList">1:1문의</a>
            </div>
            <div class="mypage_list">
               <a class="text_deco" href="/member/my_page_form">회원정보 수정</a>
               </li>
            </div>
            <br>
            <!-- <div id="mypage_title">게시판</div> -->
            <div class="mypage_list">
               <a class="text_deco" href="/notice/notice_main">공지사항</a>
            </div>
            <div class="mypage_list">
               <a class="text_deco" href="/event/event_main">이벤트</a>
            </div>
         </div>
      </aside>
      <div class="mem_form">
	 <form id="main"  method="post" action="/member/my_page">
        <h1 id="title">기본 회원정보&nbsp;</h1>
        <hr>
        <table>
          <tr>
          <td id="info">아이디</td>
          <td id="info">${loginUser.id}</td>
          </tr>
          <tr>
            <td id="info">이름(실명)</td>
            <td id="info">${loginUser.name}</td>
          </tr>
          <tr>
            <td id="info">주소(배송지)</td>
            <td id="info">[${loginUser.zip_code}] ${loginUser.addr1} ${loginUser.addr2} ${loginUser.addr3}</td>
          </tr>
          <tr>
            <td id="info">이메일</td>
            <td id="info">${loginUser.email1}@${loginUser.email2}</td>
          </tr>
          <tr>
            <td id="info">전화번호</td>
            <td id="info">${loginUser.phone1}-${loginUser.phone2}-${loginUser.phone3}</td>
          </tr>
           <tr>
            <td id="info">가입일</td>
            <td id="info" name="regdate">${loginUser.regdate}</td>
          </tr>
        </table>
        <div>
          <input type="button" value="회원 정보수정" onclick="location.href='/member/my_page'" id="modify">
           <input type="button" value="회원 탈퇴" onclick="location.href='/member/member_delete'" id="modify">
        </div>
       
      </form>
      <br>
      <div class="margin"></div>
      </div>
</div>
</body>
<%@ include file="../footer.jsp"%>
</html>