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
    <title>관리자 구매상태 수정</title>

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
    <form name="form" method="post" onsubmit="return false;" id="event_form" action="/admin/order/updateOrderResult3">
        <div id="event_form">
            <h2>구매 상태수정</h2>
            <input type="hidden" name="odseq" value="${orderList.odseq}">
            <input type="hidden" name="oseq" value="${orderList.oseq}">
            
            <div id="event">
                <div class="form_tit">
                  <div class="form_title">
                      <strong>주문상세번호 </strong>
                  </div>
                  <div class="form_input" style="width: 100px;">
                      <span style="border:0 solid black; width: 200px; font-size: 18px;">${orderList.odseq}</span>
                  </div>
                </div>
                 <div class="form_tit">
                  <div class="form_title">
                      <strong>주문번호 </strong>
                  </div>
                  <div class="form_input" style="width: 100px;">
                      <span style="border:0 solid black; width: 200px; font-size: 18px;">${orderList.oseq}</span>
                  </div>
                </div>
                <div class="form_tit">
                  <div class="form_title">
                      <strong>아이디 </strong>
                  </div>
                  <div class="form_input" style="width: 100px;">
                      <span style="border:0 solid black; width: 200px; font-size: 18px;">${orderList.id}</span>
                   </div>
                  </div>
                  <div class="form_tit">
                  <div class="form_title">
                      <strong>이름 </strong>
                  </div>
                  <div class="form_input" style="width: 100px;">
                      <span style="border:0 solid black; width: 200px; font-size: 18px;">${orderList.name}</span>
                  </div>
                </div>
                <div class="form_tit">
                  <div class="form_title">
                      <strong>주소 </strong>
                  </div>
                  <div class="form_input" style="width: 500px;">
                      <span style="border:0 solid black; width: 500px; font-size: 18px;">(${orderList.zip_code})${orderList.addr1}${orderList.addr2}${orderList.addr3}</span>
                  </div>
                </div>
                <div class="form_tit">
                  <div class="form_title">
                      <strong>전화번호 </strong>
                  </div>
                  <div class="form_input" style="width: 300px;">
                      <span style="border:0 solid black; width: 300px; font-size: 18px;">${orderList.phone1}-${orderList.phone2}-${orderList.phone3}</span>
                  </div>
                </div>
                <div class="form_tit">
                  <div class="form_title">
                      <strong>상품정보 </strong>
                  </div>
                  <div class="form_input" style="width: 300px;">
                      <span style="border:0 solid black; width: 300px; font-size: 18px;">
                      ${orderList.pname} 개수 : ${orderList.quantity}개</span>
                  </div>
                </div>
                <div class="form_tit">
                    <div class="form_title">
                        <strong>진행여부</strong> <span class="star">*</span>
                    </div>
                    <div class="form_input" style="width: 100px;">
                        <select size="1" name="result" style="width: 100px; border:0 solid black; font-size: 18px;" >
                        <c:choose>
                        <c:when test="${orderList.result == 2}">
                            <option value="2">결제완료</option>
                            <option value="3">배송완료</option>
                        </c:when>
                        <c:otherwise>
                            <option value="3">배송완료</option>
                            <option value="2">결제완료</option>
                        </c:otherwise>
                        </c:choose>
                        </select>
                    </div>
                </div>
              </div>

                <div id="qna_submit">
                     <input type="submit" onClick="Checkform()" class="file_btn" id="file_btn" value="수정하기">  
 				</div>
                
        </div>
    </form>
    </div>

<script>
function Checkform() {
    	alert("수정이 완료되었습니다.");
    	form.action = "/admin/order/updateOrderResult3";
		form.submit();
	}

</script>

<!-- footer -->
<%@ include file="../../footer.jsp"%>

</body>

</html>