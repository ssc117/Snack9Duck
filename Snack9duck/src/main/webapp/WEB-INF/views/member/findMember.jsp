<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/findMember.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp"%>
<div class="wrap">
<div class="frame find_form">
    <article class="card-body" style="max-width: 400px; margin: auto;">
        <h2 style="margin-bottom: 100px;">아이디/비밀번호 찾기</h2>
        
            
        
        <div class="form-group input-group fg-x400">
            <div class="fg-x400">
             
            
            <form method="post" action="Snack9duckServlet?command=login_form">
             <p>아이디 찾기</p>
             	<div >
	            <input name="name" class="find_id_pwd"  type="text" placeholder="이름"/>
	            </div> 
	            <span style="font-size: 13px;">회원가입 시 등록한 이름을 입력해주세요.</span>
	            <div style="margin-top: 30px;">
	            <input name="phone" class="find_id_pwd"  type="text" placeholder="이메일 입력"/>
	            </div> 
	            <span style="font-size: 13px;">회원가입 시 등록한 이메일을 입력해주세요.</span>
	            <p></p>
	            <div style="margin-bottom: 100px;">
	                <button class="find_button" onlick:> 아이디 찾기</button>
	            </div>
	            
	            
	          <p>비밀번호 찾기</p>
	          	<div >
	            <input name="name" class="find_id_pwd"  type="text" placeholder="아이디"/>
	            </div>
	            <span style="font-size: 13px;">회원가입 시 등록한 아이디를 입력해주세요.</span>
	          	<div style="margin-top: 30px;">
	            <input name="name" class="find_id_pwd"  type="text" placeholder="이름"/>
	            </div> 
	            <span style="font-size: 13px;">회원가입 시 등록한 이름을 입력해주세요.</span>
	            <div style="margin-top: 30px;">
	            <input name="password" class="find_id_pwd" type="text" placeholder="이메일 입력">
	            <span style="font-size: 13px;">회원가입 시 등록한 이메일을 입력해주세요.</span><p></p>
	            </div>
	            <div style="margin-bottom: 100px;">
	                <button class="find_button" onlick:>  비밀번호 찾기</button>   
	            </div> 
	            
	            <div style="margin-top: 50px;">
	                <a href="Snack9duckServlet?command=login_form"><button type="submit" class="find_button"> 로그인 하러가기</button></a>     
	            </div> 
            </form>
             
             
         </div>
         </div>
         
    </article>
    </div>
    <div style="height:100px ;"></div>
    </div>
</body>
<%@ include file="../footer.jsp"%>
</body>
</html>