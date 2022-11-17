<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <title>스낵9덕 메인 페이지</title>
</head>
<body>
 <!-- header 삽입 -->
 <%@ include file="header.jsp" %>


<!-- 메인 내용 -->

    <div class="margin"> </div>
    <!-- 메인이미지1 -->
    <div class="main_div">
        <img src="/resources/img/main_page_1.png" id="img_main_page_1" width="1100px">
    </div>
    <!-- 정기구독버튼 -->
    <div class="button_div">
        <button type="button" class="img_btn">
            <a href="/product/gudok_list?kind=4"><img src="/resources/img/Subscription.png"></a></button>
    </div>
    <div class="margin"> </div>
    <div class="banner">
        <!-- 메인이미지2 -->
        <img src="/resources/img/main_page_2.png" width="600px" height="570px">
    </div>
    <div class="margin"> </div>

    <!-- 이벤트 배너 -->
    <div class="slidebox">
        <input type="radio" name="slide" id="slide01" checked>
        <input type="radio" name="slide" id="slide02">
        <input type="radio" name="slide" id="slide03">
        <ul class="slidelist">
            <li class="slideitem">
                <a>
                    <label for="slide03" class="prev"></label>
                    <img src="/resources/img/event_1.png">
                    <label for="slide02" class="next"></label>
                </a>
            </li>
            <li class="slideitem">
                <a>
                    <label for="slide01" class="prev"></label>
                    <img src="/resources/img/event_2.png">
                    <label for="slide03" class="next"></label>
                </a>
            </li>
            <li class="slideitem">
                <a>
                    <label for="slide02" class="prev"></label>
                    <img src="/resources/img/event_3.png">
                    <label for="slide01" class="next"></label>
                </a>
            </li>
        </ul>
    </div>
    <div class="margin"> </div>

    <!-- 임대장비 -->
    <div class="box1 pd">
        <p class="snack_tit ac">스낵9덕 임대장비</p>
        <ul class="snack_prod flex page_sec">
            <li>
                <div class="in">
                    <div class="img">
                        <img src="/resources/img/5단선반.png">

                    </div>
                    <div class="con">
                        <p class="tit">5단 선반</p>
                    </div>
                </div>
            </li>
            <li>
                <div class="in">
                    <div class="img">
                        <img src="/resources/img/4단선반.png">

                    </div>
                    <div class="con">
                        <p class="tit">4단 선반</p>
                    </div>
                </div>
            </li>
            <li>
                <div class="in">
                    <div class="img">
                        <img src="/resources/img/쇼케이스 냉장고.png">

                    </div>
                    <div class="con">
                        <p class="tit">쇼케이스 냉장고</p>
                    </div>
                </div>
            </li>
            <li>
                <div class="in">
                    <div class="img">
                        <img src="/resources/img/멀티자판기.png">

                    </div>
                    <div class="con">
                        <p class="tit">멀티 자판기</p>
                    </div>
                </div>
            </li>

        </ul>
    </div>
    <!-- 임대장비 -->

    <div class="margin"> </div>



    <!-- 아코디언 -->
    <div id="Accordion_wrap">
        <div class="que">
            <span>결제일 변경이 가능한가요?</span>
            <div class="arrow-wrap">
                <span class="arrow-top">↑</span>
                <span class="arrow-bottom">↓</span>
            </div>

        </div>
        <div class="anw">
            <span>결제일 변경에 경우 1:1 메일요청 시 가능합니다.</span>
        </div>
        <div class="que">
            <span>배송지 변경은 어떻게 하나요?</span>
             <div class="arrow-wrap">
                <span class="arrow-top">↑</span>
                <span class="arrow-bottom">↓</span>
            </div>
        </div>
        <div class="anw">
            <span>마이페이지 > 회원정보 수정에서 변경 후 1:1 메일 문의 주시면 확인 후 변경해 드리겠습니다.</span>
        </div>
        <div class="que">
            <span>임대 장비 대여는 어떻게 하나요?</span>
             <div class="arrow-wrap">
                <span class="arrow-top">↑</span>
                <span class="arrow-bottom">↓</span>
            </div>
        </div>
        <div class="anw">
            <span>3개월 이상 구독 시 무료로 대여 해드립니다.</span>
        </div>
        <div class="que">
            <span>구독 신청은 언제든지 가능한가요?</span>
             <div class="arrow-wrap">
                <span class="arrow-top">↑</span>
                <span class="arrow-bottom">↓</span>
            </div>
        </div>
        <div class="anw">
            <span>언제든지 신청 가능합니다.</span>
        </div>
        <div class="que">
            <span>이번달에 결제가 되지않았어요. 왜 그런건가요?</span>
             <div class="arrow-wrap">
                <span class="arrow-top">↑</span>
                <span class="arrow-bottom">↓</span>
            </div>
        </div>
        <div class="anw">
            <span>1:1문의 주시면 확인 후 처리해드리겠습니다.</span>
        </div>
    </div>

    <script>
        $(".que").click(function () {
            $(this).next(".anw").stop().slideToggle(300);
            $(this).toggleClass('on').siblings().removeClass('on');
            $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
        });
    </script>
</body>
<!-- footer 삽입 -->
<%@ include file="footer.jsp" %>
</html>