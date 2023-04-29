<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <style type="text/css">
        body{
            margin-top:20px;
        }
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
<%@include file="../top.jsp"%>
<%@include file="../nav.jsp"%>

<div class="search_wrap" style="text-align: center">
    <form id="searchForm" action="/product/search" method="get">
        <div class="search_input">
            <select name="type">
                <option value="T">상품명</option>
<%--                <option value="T">카테고리</option>--%>
            </select>
            <input type="text" name="keyword">
            <button class='btn search_btn'>검 색</button>
        </div>
    </form>
</div>

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

</body>
<script>

</script>
</html>