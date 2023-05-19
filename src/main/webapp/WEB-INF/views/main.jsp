<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <style type="text/css">

        body {
            font-family: "Open Sans", sans-serif;
        }
        h2 {
            color: #000;
            font-size: 26px;
            font-weight: 300;
            text-align: center;
            text-transform: uppercase;
            position: relative;
            margin: 30px 0 80px;
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
        .carousel {
            margin: 50px auto;
            padding: 0 70px;
        }
        .carousel .item {
            min-height: 330px;
            text-align: center;
            overflow: hidden;
        }
        .carousel .item .img-box {
            height: 160px;
            width: 100%;
            position: relative;
        }
        .carousel .item img {
            max-width: 100%;
            max-height: 100%;
            display: inline-block;
            position: absolute;
            bottom: 0;
            margin: 0 auto;
            left: 0;
            right: 0;
        }
        .carousel .item h4 {
            font-size: 18px;
            margin: 10px 0;
        }
        .carousel .item .btn {
            color: #333;
            border-radius: 0;
            font-size: 11px;
            text-transform: uppercase;
            font-weight: bold;
            background: none;
            border: 1px solid #ccc;
            padding: 5px 10px;
            margin-top: 5px;
            line-height: 16px;
        }
        .carousel .item .btn:hover, .carousel .item .btn:focus {
            color: #fff;
            background: #000;
            border-color: #000;
            box-shadow: none;
        }
        .carousel .item .btn i {
            font-size: 14px;
            font-weight: bold;
            margin-left: 5px;
        }
        .carousel .thumb-wrapper {
            text-align: center;
        }
        .carousel .thumb-content {
            padding: 15px;
        }
        .carousel .carousel-control {
            height: 100px;
            width: 40px;
            background: none;
            margin: auto 0;
            background: rgba(0, 0, 0, 0.2);
        }
        .carousel .carousel-control i {
            font-size: 30px;
            position: absolute;
            top: 50%;
            display: inline-block;
            margin: -16px 0 0 0;
            z-index: 5;
            left: 0;
            right: 0;
            color: rgba(0, 0, 0, 0.8);
            text-shadow: none;
            font-weight: bold;
        }
        .carousel .item-price {
            font-size: 13px;
            padding: 2px 0;
        }
        .carousel .item-price strike {
            color: #999;
            margin-right: 5px;
        }
        .carousel .item-price span {
            color: #86bd57;
            font-size: 110%;
        }
        .carousel .carousel-control.left i {
            margin-left: -3px;
        }
        .carousel .carousel-control.left i {
            margin-right: -3px;
        }
        .carousel .carousel-indicators {
            bottom: -50px;
        }
        .carousel-indicators li, .carousel-indicators li.active {
            width: 10px;
            height: 10px;
            margin: 4px;
            border-radius: 50%;
            border-color: transparent;
        }
        .carousel-indicators li {
            background: rgba(0, 0, 0, 0.2);
        }
        .carousel-indicators li.active {
            background: rgba(0, 0, 0, 0.6);
        }
        .star-rating li {
            padding: 0;
        }
        .star-rating i {
            font-size: 14px;
            color: #ffc000;
        }
        /*********************  Demo-9 **********************/
        .product-grid9,
        .product-grid9 .product-image9 {
            position: relative;
        }
        .product-grid9 {
            font-family: Poppins, sans-serif;
            z-index: 1;
        }
        .product-grid9 .product-image9 a {
            display: block;
        }
        .product-grid9 .product-image9 img {
            /*width: 100%;*/
            /*height: auto;*/
        }
        .product-grid9 .pic-1 {
            /*opacity: 1;*/
            /*transition: all 0.5s ease-out 0s;*/
            width: 200px;
            height: 250px;
            object-fit: cover;


        }
        .product-grid9:hover .pic-1 {
            /*opacity: 0;*/
        }
        .product-grid9 .pic-2 {
            position: absolute;
            top: 0;
            left: 0;
            opacity: 0;
            transition: all 0.5s ease-out 0s;
        }
        .product-grid9:hover .pic-2 {
            opacity: 1;
        }
        .product-grid9 .product-full-view {
            color: #505050;
            background-color: #fff;
            font-size: 16px;
            height: 45px;
            width: 45px;
            padding: 18px;
            border-radius: 100px 0 0;
            display: block;
            opacity: 0;
            position: absolute;
            right: 0;
            bottom: 0;
            transition: all 0.3s ease 0s;
        }
        .product-grid9 .product-full-view:hover {
            color: #c0392b;
        }
        .product-grid9:hover .product-full-view {
            opacity: 1;
        }
        .product-grid9 .product-content {
            padding: 12px 12px 0;
            overflow: hidden;
            position: relative;
        }
        .product-content .rating {
            padding: 0;
            margin: 0 0 7px;
            list-style: none;
        }
        .product-grid9 .rating li {
            font-size: 12px;
            color: #ffd200;
            transition: all 0.3s ease 0s;
        }
        .product-grid9 .rating li.disable {
            color: rgba(0, 0, 0, 0.2);
        }
        .product-grid9 .title {
            font-size: 16px;
            font-weight: 400;
            text-transform: capitalize;
            margin: 0 0 3px;
            transition: all 0.3s ease 0s;
        }
        .product-grid9 .title a {
            color: rgba(0, 0, 0, 0.5);
        }
        .product-grid9 .title a:hover {
            color: #c0392b;
        }
        .product-grid9 .price {
            color: #050505;
            font-size: 17px;
            margin: 0;
            display: block;
            transition: all 0.5s ease 0s;
        }
        .product-grid9:hover .price {
            opacity: 0;
        }
        .product-grid9 .add-to-cart {
            display: block;
            color: #c0392b;
            font-weight: 600;
            font-size: 14px;
            opacity: 0;
            position: absolute;
            left: 10px;
            bottom: -20px;
            transition: all 0.5s ease 0s;
        }
        .product-grid9:hover .add-to-cart {
            opacity: 1;
            bottom: 0;
        }
        @media only screen and (max-width: 990px) {
            .product-grid9 {
                margin-bottom: 30px;
            }
        }

        .line-through {
            text-decoration: line-through;
            margin-left: 10px;
            font-size: 14px;
            vertical-align: middle;
            color: #a5a5a5;
        }
    </style>
</head>
<body>
<%@include file="top.jsp"%>
<%@include file="nav.jsp"%>
<br/>
<div class="container">
    <div class="row">
        <c:forEach items="${list}" var="list">
            <div class="col-md-3 col-sm-6">
                <div class="product-grid9">
                    <div class="product-image9">
                        <a href="/productDetail/${list.id}">
                            <img class="pic-1"  width="200px" height="250px" src="${list.image_url}">
                        </a>
                        <a href="/productDetail/${list.id}" class="fa fa-search product-full-view"></a>
                    </div>
                    <div class="product-content">
                        <h3 class="title"><a href="/productDetail/${list.id}"> ${list.product_name}</a></h3>
                        <div class="price">
                            <div class="product-price-discount">
                                <span><fmt:formatNumber value="${list.product_price - (list.product_price*list.product_discount)}" pattern="#,### 원" /></span>
                                <span class="line-through"><fmt:formatNumber value="${list.product_price}" pattern="#,### 원" /></span>
                            </div>
                        </div>
                        <a class="add-to-cart" href="">VIEW PRODUCTS</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>