<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
    integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <!-- <script type="text/javascript" src="js/cart.js"></script>  -->
    <title>이벤트 수정</title>

    <style>
      #event_wrap {
        /* border: 1px solid red; */
        text-align: center;
      }

      #event {
        margin-left: 25%;
        text-align: center;
        width: 1000px;
        /* border: 1px solid red; */
        margin-bottom: 30px;
      }

strong{
  font-size: 20px;
}
.form_tit{
  text-align: center;
  display: flex;
  width: 1000px;
  padding: 10px;
}
.form_title{
  width: 150px;
}
.form_input{
padding: 11px 9px 9px;
border: 1px solid #aaa;
width: 700px;
}
#input_box{
  width: 700px;
  height: 300px;
  border:0 solid black;
  font-size: 20px;
  resize: none;
}

.file_btn{
color: #FCFCFC !important;
background-color: #404040 !important;
border-color: #404040 !important;
text-align: center;
font-size: 20px;
width: 100% !important;
height: 54px !important;
max-width: 240px;
text-align: center;
cursor: pointer;
margin-bottom: 50px;
}
    </style>

  </head>

<body>
<!-- header -->
<%@ include file="../../header.jsp"%>
	<!-- BODY-->
    <div id="event_wrap">
    <form name="form" method="post" enctype="multipart/form-data" onsubmit="return false;" id="event_form" action="/admin/event/admin_event_Update">
        <div id="event_form">
            <h2>이벤트 수정</h2>
            <input type="hidden" name="eventno" value="${event.eventno}">
            <input type="hidden" name="img" value="${event.img}">
            <input type="hidden" name="mainimg" value="${event.mainimg}">
            <div id="event">
                <div class="form_tit">
                  <div class="form_title">
                      <strong>이벤트명 </strong> <span class="star">*</span>
                  </div>
                  <div class="form_input">
                      <input type="text" name="subject" value="${event.subject}" style="border:0 solid black; width: 700px; font-size: 18px;">
                  </div>
                </div>
                <div class="form_tit">
                    <div class="form_title">
                        <strong>진행여부</strong> <span class="star">*</span>
                    </div>
                    <div class="form_input" style="width: 50px;">
                        <select size="1" name="upload" style="width: 50px; border:0 solid black; font-size: 18px;" >
                        <c:choose>
                        <c:when test="${event.upload == 1}">
                            <option value="1">O</option>
                            <option value="2">X</option>
                        </c:when>
                        <c:otherwise>
                            <option value="2">X</option>
                            <option value="1">O</option>
                        </c:otherwise>
                        </c:choose>
                        </select>
                    </div>
                </div>
                <div class="form_tit">
                  <div class="form_title">
                      <strong>이벤트 내용 </strong> <span class="star">*</span>
                  </div>
                  <div class="form_input">
                      <input type="text" value="${event.content}" name="content" id="event_content" style="border:0 solid black; width: 700px; height: 250px; font-size: 18px;"
                      placeholder="이벤트 내용 상세 입력"/>
                  </div>
                </div>

                <div class="form_tit">
                  <div class="form_title">
                      <strong>배너 이미지</strong> <span class="star">*</span>
                  </div>
                  <div class="form_input">
                    <input type="file" name="file" style="border:0 solid black; width: 700px; font-size: 18px;"/>
                    <a href="/snack9duck/${event.img}"download>기존 이미지 다운로드</a>
                  </div>
                </div>

                <div class="form_tit">
                  <div class="form_title">
                      <strong>메인 이미지</strong> <span class="star">*</span>
                  </div>
                  <div class="form_input">
                    <input type="file" name="file2" style="border:0 solid black; width: 700px; font-size: 18px;"/>
                    <a href="/snack9duck/${event.mainimg}"download>기존 이미지 다운로드</a>
                  </div>
                </div>
 
              </div>

                <div id="qna_submit">
                     <input type="submit" onClick="Checkform()" class="file_btn" id="file_btn" value="수정하기">  
 				</div>
                <div id="qna_submit">
					<input type="button" class="file_btn" id="delete_btn" value="삭제하기">
				</div>
        </div>
    </form>
    </div>

<script>
function Checkform() {
    if( form.subject.value == "" ) {
    	form.subject.focus();
        alert("이벤트명을 입력해 주세요.");
        return false;
    }else if( form.content.value == "" ) {
    	form.content.focus();
        alert("이벤트 내용을 입력해주세요.");
        return false; 
    }else if( form.file.value == "" ) {
    	form.file.focus();
        alert("배너 이미지를 첨부해 주세요.");
        return false; 
    }else if( form.file2.value == "" ) {
    	form.file2.focus();
        alert("메인 이미지를 첨부해 주세요.");
        return false; 
    }else {
    	alert("수정이 완료되었습니다.");
    	form.encoding = "multipart/form-data";
		form.action = "/admin/event/admin_event_Update";
		form.submit();
	}
}
    $("#delete_btn").on("click", function(e){
        form.action = "/admin/event/delete";
        alert("이벤트가 삭제되었습니다.");
        form.submit();
        
    });
	

</script>

<!-- footer -->
<%@ include file="../../footer.jsp"%>

</body>

</html>