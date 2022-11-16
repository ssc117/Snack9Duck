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
    <title>상품 수정</title>

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
    <form name="form" method="post"  onsubmit="return false;" enctype="multipart/form-data" id="event_form" action="/admin/product/admin_product_Update">
        <div id="event_form">
            <h2>상품 수정</h2>
            
            <input type="hidden" name="prodnum" value="${product.prodnum}">
            <input type="hidden" name="image" value="${product.image}">
            <input type="hidden" name="detail_image" value="${product.detail_image}">
            <div id="event">
                <div class="form_tit">
                  <div class="form_title">
                      <strong>상품명 </strong> <span class="star">*</span>
                  </div>
                  <div class="form_input">
                      <input type="text" name="name" value="${product.name}" style="border:0 solid black; width: 700px; font-size: 18px;">
                  </div>
                </div>
                <div class="form_tit">
                  <div class="form_title">
                      <strong>상품종류 </strong> <span class="star">*</span>
                  </div>
                  <div class="form_input">
                      <input type="text" name="kind" value="${product.kind}" placeholder="상품종류 : [1:과자] [2:음료] [3:차/커피] 1~3만 입력하세요." 
                      			style="border:0 solid black; width: 700px; font-size: 18px;">
                  </div>
                </div>
                <div class="form_tit">
                  <div class="form_title">
                      <strong>가격 </strong> <span class="star">*</span>
                  </div>
                  <div class="form_input">
                      <input type="text" name="price" value="${product.price}" placeholder="콤마(,) 없이 숫자만 입력하세요."
                      			style="border:0 solid black; width: 700px; font-size: 18px;">
                  </div>
                </div>
                <div class="form_tit">
                  <div class="form_title">
                      <strong>상품정보 </strong> <span class="star">*</span>
                  </div>
                  <div class="form_input">
                      <input type="text" name="content" value="${product.content}" style="border:0 solid black; width: 700px; font-size: 18px;">
                  </div>
                </div>
                <div class="form_tit">
                    <div class="form_title">
                        <strong>상품 표시</strong> <span class="star">*</span>
                    </div>
                    <div class="form_input" style="width: 50px;">
                        <select size="1" name="useyn" style="width: 50px; border:0 solid black; font-size: 18px;" >
                        <c:choose>
                        <c:when test="${product.useyn == 'y'}">
                            <option value="y">O</option>
                            <option value="n">X</option>
                        </c:when>
                        <c:otherwise>
                            <option value="n">X</option>
                            <option value="y">O</option>
                        </c:otherwise>
                        </c:choose>
                        </select>
                    </div>
                </div>
                <div class="form_tit">
                  <div class="form_title">
                      <strong>상품 이미지</strong> <span class="star">*</span>
                  </div>
                  <div class="form_input">
                    <input type="file" name="file" style="border:0 solid black; width: 700px; font-size: 18px;"/>
                    <a href="/snack9duck/${product.image}"download>기존 이미지 다운로드</a>
                  </div>
                </div>

                <div class="form_tit">
                  <div class="form_title">
                      <strong>상세 이미지</strong> <span class="star">*</span>
                  </div>
                  <div class="form_input">
                    <input type="file" name="file2" style="border:0 solid black; width: 700px; font-size: 18px;"/>
                    <a href="/snack9duck/${product.detail_image}"download>기존 이미지 다운로드</a>
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
    if( form.name.value == "" ) {
    	form.name.focus();
        alert("상품명을 입력해 주세요.");
        return false;
    }else if( form.kind.value == "" ) {
    	form.kind.focus();
        alert("상품 종류를 입력해주세요.");
        return false; 
    }else if( form.price.value == "" ) {
    	form.price.focus();
        alert("가격을 입력해주세요.");
        return false;
    }else if( form.file.value == "" ) {
    	form.price.focus();
        alert("상품 이미지를 첨부 해주세요.");
        return false; 
    }else if( form.file2.value == "" ) {
    	form.price.focus();
        alert("상세 이미지를 첨부 해주세요.");
        return false;
    }else if( form.content.value == "" ) {
    	form.content.focus();
        alert("상품 내용을 입력해주세요.");
        return false; 
    }else {
    	alert("상품 수정이 완료되었습니다.");
    	form.encoding = "multipart/form-data";
		form.action = "/admin/product/admin_product_Update";
		form.submit();
	}
}
    $("#delete_btn").on("click", function(e){
        form.action = "/admin/product/delete";
        alert("상품이 삭제되었습니다.");
        form.submit();
        
    });
	

</script>

<!-- footer -->
<%@ include file="../../footer.jsp"%>

</body>

</html>