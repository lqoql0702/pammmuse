<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <style type="text/css">
        .content_top{
            width: 100%;
            height: 400px;
        }
        .content_top:after {
            content: "";
            clear: both;
            display: table;
        }
        .ct_left_area{
            float: left;
            width: 30%;
            height: 100%;
        }
        .image_wrap{
            height: 80%;
            width: 80%;
            margin: auto;
            top: 10%;
            position: relative;
        }
        .image_wrap img{
            max-width: 100%;
            height: auto;
            display: block;
        }
        .line{
            width: 100%;
            border-top:1px solid #c6c6cf;
        }



        .ct_right_area{
            float: left;
            width: 70%;
            height: 100%;
        }
        .title{
            height: 28%;
            font-size: 17px;
            line-height: 110px;
            color: #3a60df;
            padding-left: 3%;
        }

        .price{
            line-height: 30px;
            padding: 2% 0 2% 3%;
        }
        .discount_price_number{
            line-height: 30px;
            font-size: 22px;
            color: #f84450;
            font-weight: bold;
        }
        .button{
            padding: 2% 0 2% 3%;
        }
        .button_quantity{
            margin-bottom: 2%;

        }
        .button_quantity input{
            height: 26px;
            width: 40px;
            text-align: center;
            font-weight: bold;
        }
        .button_quantity button{
            border: 1px solid #aaa;
            color: #3a60df;
            width: 20px;
            height: 20px;
            padding: 3px;
            background-color: #fff;
            font-weight: bold;
            font-size: 15px;
            line-height: 15px;
        }
        .btn_cart{
            display: inline-block;
            width: 140px;
            text-align: center;
            height: 50px;
            line-height: 50px;
            background-color: #fff;
            border: 1px solid #5e6b9f;
            color: #fff;
            margin-right: 2px;
        }
        .btn_buy{
            display: inline-block;
            width: 140px;
            text-align: center;
            height: 50px;
            line-height: 50px;
            background-color: #fff;
            border: 1px solid #7b8ed1;
            color: #fff;
        }


        .content_bottom{
            width: 100%;
            min-height: 400px;
            background-color: #e7dbdb;
        }

    </style>
</head>
<body>
<%@include file="../top.jsp"%>
<%@include file="../nav.jsp"%>

<div class="line">
</div>
<div class="content_top">
    <div class="ct_left_area">
        <div class="image_wrap">
            <img src="${productInfo.image_url}"/>
        </div>
    </div>
    <div class="ct_right_area">
        <div class="title">
            <h1>
                ${prodcutInfo.product_name}
            </h1>
        </div>
        <div class="line">
        </div>

        <div class="price">
            <div class="sale_price">정가 : <fmt:formatNumber value="${productInfo.product_price}" pattern="#,### 원" /></div>
            <div class="discount_price">
                판매가 : <span class="discount_price_number"><fmt:formatNumber value="${productInfo.product_price - (productInfo.product_price*productInfo.product_discount)}" pattern="#,### 원" /></span>
                [<fmt:formatNumber value="${productInfo.product_discount*100}" pattern="###" />%
                <fmt:formatNumber value="${productInfo.product_price*productInfo.product_discount}" pattern="#,### 원" /> 할인]</div>
        </div>
        <div class="line">
        </div>
        <div class="button">
            <div class="button_quantity">
                주문수량
                <input type="text" value="1">
                <span>
								<button>+</button>
								<button>-</button>
							</span>
            </div>
            <div class="button_set">
                <a class="btn_cart">장바구니 담기</a>
                <a class="btn_buy">바로구매</a>
            </div>
        </div>
    </div>
</div>
<%--<div class="content_bottom">--%>
<%--    리뷰--%>
<%--</div>--%>

</body>
</html>