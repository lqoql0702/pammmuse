<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%--    <meta name="_csrf_header" th:content="${_csrf.headerName}">--%>
<%--    <meta name="_csrf" th:content="${_csrf.token}">--%>
    <meta name="_csrf" content="${_csrf.token}"/>
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <style type="text/css">
        .pd-wrap {
            padding: 40px 0;
            font-family: 'Poppins', sans-serif;
        }
        .heading-section {
            text-align: center;
            margin-bottom: 20px;
        }
        .sub-heading {
            font-family: 'Poppins', sans-serif;
            font-size: 12px;
            display: block;
            font-weight: 600;
            color: #2e9ca1;
            text-transform: uppercase;
            letter-spacing: 2px;
        }
        .heading-section h2 {
            font-size: 32px;
            font-weight: 500;
            padding-top: 10px;
            padding-bottom: 15px;
            font-family: 'Poppins', sans-serif;
        }
        .user-img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            position: relative;
            min-width: 80px;
            background-size: 100%;
        }
        .carousel-testimonial .item {
            padding: 30px 10px;
        }
        .quote {
            position: absolute;
            top: -23px;
            color: #2e9da1;
            font-size: 27px;
        }
        .name {
            margin-bottom: 0;
            line-height: 14px;
            font-size: 17px;
            font-weight: 500;
        }
        .position {
            color: #adadad;
            font-size: 14px;
        }
        .owl-nav button {
            position: absolute;
            top: 50%;
            transform: translate(0, -50%);
            outline: none;
            height: 25px;
        }
        .owl-nav button svg {
            width: 25px;
            height: 25px;
        }
        .owl-nav button.owl-prev {
            left: 25px;
        }
        .owl-nav button.owl-next {
            right: 25px;
        }
        .owl-nav button span {
            font-size: 45px;
        }
        .product-thumb .item img {
            height: 100px;
        }
        .product-name {
            font-size: 22px;
            font-weight: 500;
            line-height: 22px;
            margin-bottom: 4px;
        }
        .product-price-discount {
            font-size: 22px;
            font-weight: 400;
            padding: 10px 0;
            clear: both;
        }
        .product-price-discount span.line-through {
            text-decoration: line-through;
            margin-left: 10px;
            font-size: 14px;
            vertical-align: middle;
            color: #a5a5a5;
        }
        .display-flex {
            display: flex;
        }
        .align-center {
            align-items: center;
        }
        .product-info {
            width: 100%;
        }
        .reviews-counter {
            font-size: 13px;
        }
        .reviews-counter span {
            vertical-align: -2px;
        }
        .rate {
            float: left;
            padding: 0 10px 0 0;
        }
        .rate:not(:checked) > input {
            position:absolute;
            top:-9999px;
        }
        .rate:not(:checked) > label {
            float: right;
            width: 15px;
            overflow: hidden;
            white-space: nowrap;
            cursor: pointer;
            font-size: 21px;
            color:#ccc;
            margin-bottom: 0;
            line-height: 21px;
        }
        .rate:not(:checked) > label:before {
            content: '\2605';
        }
        .rate > input:checked ~ label {
            color: #ffc700;
        }
        .rate:not(:checked) > label:hover,
        .rate:not(:checked) > label:hover ~ label {
            color: #deb217;
        }
        .rate > input:checked + label:hover,
        .rate > input:checked + label:hover ~ label,
        .rate > input:checked ~ label:hover,
        .rate > input:checked ~ label:hover ~ label,
        .rate > label:hover ~ input:checked ~ label {
            color: #c59b08;
        }
        .product-dtl p {
            font-size: 14px;
            line-height: 24px;
            color: #7a7a7a;
        }
        .product-dtl .form-control {
            font-size: 15px;
        }
        .product-dtl label {
            line-height: 16px;
            font-size: 15px;
        }
        .form-control:focus {
            outline: none;
            box-shadow: none;
        }
        .product-count {
            margin-top: 15px;
        }
        .product-count .qtyminus,
        .product-count .qtyplus {
            width: 34px;
            height: 34px;
            background: #212529;
            text-align: center;
            font-size: 19px;
            line-height: 36px;
            color: #fff;
            cursor: pointer;
        }
        .product-count .qtyminus {
            border-radius: 3px 0 0 3px;
        }
        .product-count .qtyplus {
            border-radius: 0 3px 3px 0;
        }
        .product-count .qty {
            width: 60px;
            text-align: center;
        }
        .btn_cart {
            border-radius: 4px;
            background: #212529;
            color: #fff;
            padding: 7px 45px;
            display: inline-block;
            margin-top: 20px;
            border: solid 2px #212529;
            transition: all 0.5s ease-in-out 0s;
        }
        .btn_cart:hover,
        .btn_cart:focus {
            background: transparent;
            color: #212529;
            text-decoration: none;
        }
        .btn_buy {
            border-radius: 4px;
            background: #212529;
            color: #fff;
            padding: 7px 45px;
            display: inline-block;
            margin-top: 20px;
            border: solid 2px #212529;
            transition: all 0.5s ease-in-out 0s;
        }
        .btn_buy:hover,
        .btn_buy:focus {
            background: transparent;
            color: #212529;
            text-decoration: none;
        }

        .product-info-tabs {
            margin-top: 25px;
        }
        .product-info-tabs .nav-tabs {
            border-bottom: 2px solid #d8d8d8;
        }
        .product-info-tabs .nav-tabs .nav-item {
            margin-bottom: 0;
        }
        .product-info-tabs .nav-tabs .nav-link {
            border: none;
            border-bottom: 2px solid transparent;
            color: #323232;
        }
        .product-info-tabs .nav-tabs .nav-item .nav-link:hover {
            border: none;
        }
        .product-info-tabs .nav-tabs .nav-item.show .nav-link,
        .product-info-tabs .nav-tabs .nav-link.active,
        .product-info-tabs .nav-tabs .nav-link.active:hover {
            border: none;
            border-bottom: 2px solid #d8d8d8;
            font-weight: bold;
        }
        .product-info-tabs .tab-content .tab-pane {
            padding: 30px 20px;
            font-size: 15px;
            line-height: 24px;
            color: #7a7a7a;
        }
        .review-form .form-group {
            clear: both;
        }
        .mb-20 {
            margin-bottom: 20px;
        }

        .review-form .rate {
            float: none;
            display: inline-block;
        }
        .review-heading {
            font-size: 24px;
            font-weight: 600;
            line-height: 24px;
            margin-bottom: 6px;
            text-transform: uppercase;
            color: #000;
        }
        .review-form .form-control {
            font-size: 14px;
        }
        .review-form input.form-control {
            height: 40px;
        }
        .review-form textarea.form-control {
            resize: none;
        }
        .review-form .round-black-btn {
            text-transform: uppercase;
            cursor: pointer;
        }

    </style>
</head>
<body>
<%@include file="../top.jsp"%>
<%@include file="../nav.jsp"%>
<hr/>
    <div class="container">
        <br/>
        <div class="row">
            <div class="col-md-6">
                <div id="slider" class="owl-carousel product-slider">
                    <div class="item">
                        <img width="400px" height="450px" src="${productInfo.image_url}" />
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="product-dtl">
                    <div class="product-info">
                        <div class="product-name">${productInfo.product_name}</div>
                        <div class="product-price-discount">
                            <span><fmt:formatNumber value="${productInfo.product_price - (productInfo.product_price*productInfo.product_discount)}" pattern="#,### 원" /></span>
                            <span class="line-through"><fmt:formatNumber value="${productInfo.product_price}" pattern="#,### 원" /></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="size">Size</label>
                            <div class="size" id="size">${productInfo.product_size}</div>
                        </div>
                        <div class="col-md-6">
                            <label for="color">Color</label>
                            <div class="color" id="color">${productInfo.product_color}</div>
                        </div>
                    </div>
                    <div class="product-count">
                        <label for="size">Quantity</label>
                        <form action="#" class="display-flex">
                            <div class="qtyminus">-</div>
                            <input type="text" name="quantity" id="quantity" value="1" class="qty">
                            <div class="qtyplus">+</div>
                        </form>
                        <a class="btn_cart" type="submit">Add to Cart</a>
                        <a class="btn_buy" type="submit">Buy</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 주문 form -->
<form action="/order/${user.username}" method="get" class="order_form">
    <input type="hidden" name="orders[0].id" value="${productInfo.id}">
    <input type="hidden" name="orders[0].product_count" value="">
</form>

<div>
    <%@include file="../footer.jsp"%>
</div>

<script>
        $(".qtyminus").on("click",function(){
            var now = $(".qty").val();
            if ($.isNumeric(now)){
                if ((parseInt(now)-1) > 0)
                { now--;}
                $(".qty").val(now);
            }
        });
        $(".qtyplus").on("click",function(){
            var now = $(".qty").val();
            if ($.isNumeric(now)){
                $(".qty").val(parseInt(now)+1);
            }
        });

        // 서버로 전송할 데이터
        const form = {
            username : '${user.username}',
            product_id : '${productInfo.id}',
            product_count : ''
        }

        var csrfToken = $("meta[name='_csrf']").attr("content");
        $.ajaxPrefilter(function(options, originalOptions, jqXHR){
            if (options['type'].toLowerCase() === "post") {
                jqXHR.setRequestHeader('X-CSRF-TOKEN', csrfToken);
            }
        });
        // 장바구니 추가 버튼
        $(".btn_cart").on("click", function(e){
            form.product_count = $(".qty").val();
            console.log(form.username);
            console.log(form.product_id);
                $.ajax({
                    url: '/cart/add',
                    type: 'POST',
                    data: form,
                    success: function (result) {
                        if (result == "0") {
                            alert("장바구니에 추가를 하지 못하였습니다.");
                        } else if (result == "1") {
                            alert("장바구니에 추가되었습니다.");
                        } else if (result == "2") {
                            alert("장바구니에 이미 추가되어져 있습니다.");
                        } else if (result == "5") {
                            alert("로그인이 필요합니다.");
                        }
                    }
                })

        });

        /* 바로구매 버튼 */
        $(".btn_buy").on("click", function(){
            console.log(form.username);
            if(form.username === null|| form.username === '' || form.username === 'undefined') {
                location.href="/user/login";
            } else{
                let product_count = $("#quantity").val();
                $(".order_form").find("input[name='orders[0].product_count']").val(product_count);
                $(".order_form").submit();
            }
        });

</script>
</body>
</html>