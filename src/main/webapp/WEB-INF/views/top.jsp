<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style type="text/css">
        @import url(http://fonts.googleapis.com/css?family=Raleway);
        a{
            font-family: Century Gothic;
            text-decoration: none;
            font-size: 15px;
        }

        .top_gnb_area .list{
            position: absolute;
            top: 0px;
            right: 0;

        }

        .top_gnb_area .list li{
            list-style: none;
            float : left;
            padding: 13px 15px 0 10px;
            font-weight: 900;
            cursor: pointer;
        }
        .top_gnb_area{
            width: 100%;
            height: 50px;
            background-color: #fff;
        }
    </style>
</head>
<body>
<div class="top_gnb_area">
    <ul class="list">
        <c:if test = "${user == null}">
            <li>
                <a href="/user/login">Login</a>
            </li>
            <li>
                <a href="/user/signup">Signup</a>
            </li>
        </c:if>
        <c:if test="${user != null }">
            <li>
                <a href="/user/mypage">MyPage</a>
            </li>
            <li>
                <a href="/user/logout">Logout</a>
            </li>
        </c:if>
    </ul>
</div>
</body>
</html>