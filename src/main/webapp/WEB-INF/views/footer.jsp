<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style type="text/css">
        .context-dark, .bg-gray-dark, .bg-primary {
            color: #050505;
        }

        .footer-classic a, .footer-classic a:focus, .footer-classic a:active {
            color: #050505;
        }
        .nav-list li {
            padding-top: 5px;
            padding-bottom: 5px;
        }

        .nav-list li a:hover:before {
            margin-left: 0;
            opacity: 1;
            visibility: visible;
        }

        ul, ol {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .social-inner {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            padding: 23px;
            font: 900 13px/1 "Lato", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            text-transform: uppercase;
            color: rgba(255, 255, 255, 0.5);
        }
        .social-container .col {
            border: 1px solid #050505;
        }
        .nav-list li a:before {
            content: "\f14f";
            font: 400 21px/1 "Material Design Icons";
            color: #4d6de6;
            display: inline-block;
            vertical-align: baseline;
            margin-left: -28px;
            margin-right: 7px;
            opacity: 0;
            visibility: hidden;
            transition: .22s ease;
        }
    </style>
</head>
<body>
<hr/>

<footer class="section footer-classic context-dark bg-image" style="background: #fff;">
    <div class="container">
        <div class="row row-30">

            <div class="col-md-4">
                <dl class="contact-list">
                    <h5>email:</h5>
                    <dd><a href="mailto:#">lqoql0702@gmail.com</a></dd>
                </dl>
            </div>
            <div class="col-md-4 col-xl-3">
                <h5>Links</h5>
                <ul class="nav-list">
                    <li><a href="https://github.com/lqoql0702">Git</a></li>
                    <li><a href="https://github.com/lqoql0702/pammmuse">Projects</a></li>
                    <li><a href="#">Portfolio</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>

</body>
</html>