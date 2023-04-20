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
    body{

    background-color:#fff;

    }

    a{

    color:#505050 !important;

    }
    .nav-item {
    font-family: Century Gothic;
    margin: 0 auto;
    padding: 5em 3em;
    text-align: center;
    }
    .nav-item a {
    color: #505050;
    text-decoration: none;
    font: 20px Century Gothic;
    margin: 0px 10px;
    padding: 10px 10px;
    position: relative;
    z-index: 0;
    }


    /* Top & Bottom Borders Out */
    .topBotomBordersOut a:before, .topBotomBordersOut a:after {
    position: absolute;
    left: 0px;
    width: 100%;
    height: 2px;
    background: #505050;
    content:"";
    opacity: 0;
    -webkit-transition: all 0.3s;
    transition: all 0.3s;
    }
    .topBotomBordersOut a:before {
    top: 0px;
    transform: translateY(10px);
    }
    .topBotomBordersOut a:after {
    bottom: 0px;
    transform: translateY(-10px);
    }
    .topBotomBordersOut a:hover:before, .topBotomBordersOut a:hover:after {
    opacity: 1;
    transform: translateY(0px);
    }

    h2 {
        color: #000;
        font-size: 26px;
        font-weight: 300;
        text-align: center;
        text-transform: uppercase;
        position: relative;
        margin: 30px 0 30px;
    }
    h2 b {
        color: #ffc000;
    }
    h2::after {
        content: "";
        width: 100px;
        position: absolute;
        margin: 0 auto;
        height: 4px;
        background: rgba(0, 0, 0, 0.2);
        left: 0;
        right: 0;
        bottom: -20px;
    }
    </style>

</head>
<body>
<h2>Pammmuse</h2>
<nav class="menum navbar navbar-light navbar-expand-md justify-content-center">
    <div class="container">

        <div class="navbar-collapse collapse justify-content-between align-items-center w-100" id="collapsingNavbar2">
            <ul class="topBotomBordersOut navbar-nav mx-auto text-center">
                <li class="nav-item active">
                    <a class="nav-link" href="/main">Home</a>
                </li>
                <li class="nav-item"><a class="nav-link" href="#">Notice</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">Top10</a>
                <li class="nav-item"> <a class="nav-link" href="#">Dress</a>
                <li class="nav-item"> <a class="nav-link" href="#">Top</a>
                <li class="nav-item"> <a class="nav-link" href="#">Search</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

</body>
</html>