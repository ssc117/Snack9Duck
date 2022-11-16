<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/event.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <title>스낵9덕 이벤트</title>
</head>

<body>
<!-- header -->
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
        
        <p style="text-align:center; font-size:30px; font-weight:bold; ">
            ${event_detail.subject}</p>
        <p style="text-align:center; font-size:20px; font-weight:bold; color:gray ">
            ${event_detail.content}</p>

        <img src="/snack9duck/${event_detail.mainimg}">
       

        <p></p>

        <div>
            <a href="Snack9duckServlet?command=event_main">
                <img src="img/btn.png">
            </a>
        </div>

    </body>

<!-- footer -->
<%@ include file="../footer.jsp"%>

</html>