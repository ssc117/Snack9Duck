<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/event.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <title>스낵9덕 이벤트</title>
</head>

<body>
	
	<%@ include file="../header.jsp"%>
    
    <body>

        <div class="column">
            <div class="inner">
                <div class="notice">
                    <p></p>
                    <h1 style="font-size:40px;">이벤트</h1>
                    <p></p>
                </div>
            </div>
        </div>
        </div>

        <ul class="cboth event_menucategory">
            <li class="on">
                <a href="/event/event_main">
                    <img src="/resources/img/이벤트진행2.jpg">
                </a>
            </li>
            <li>
                <a href="/event/event_main_end">
                    <img src="/resources/img/이벤트종료1.jpg">
                </a>
            </li>
        </ul>

        <ul>
      <c:forEach var="endEventList" items="${endEventList}">
            <li>
                <a href="/event/event_detail?eventno=${endEventList.eventno}">
                    <div style="text-align: center;">
                    <img src="/snack9duck/${endEventList.img}" style="width:1500px; height:400px;">
                    </div>
                </a>
            </li>
            <p></p>
      </c:forEach>
      </ul>
    </body>
    
<!-- footer -->
<%@ include file="../footer.jsp"%>

</html>