<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style type="text/css">
        .cart-wrap {
            padding: 40px 0;
            font-family: 'Open Sans', sans-serif;
        }
        .main-heading {
            font-size: 19px;
            margin-bottom: 20px;
        }
        .table-cart table {
            width: 100%;
        }
        .table-cart thead {
            border-bottom: 1px solid #e5e5e5;
            margin-bottom: 5px;
        }
        .table-cart thead tr th {
            padding: 8px 0 18px;
            color: #484848;
            font-size: 15px;
            font-weight: 400;
        }
        .table-cart tr td {
            padding: 40px 0 27px;
            vertical-align: middle;
        }
        .table-cart tr td:nth-child(1) {
            width: 52%;
        }
        .table-cart tr td:nth-child(2) {
            width: 26%;
        }
        .table-cart tr td:nth-child(3) {
            width: 13.333%;
        }
        .table-cart tr td:nth-child(4) {
            width: 8.667%;
            text-align: right;
        }
        .table-cart tr td .img-product {
            width: 230px;
            float: left;
            margin-left: 8px;
            margin-right: 31px;
            line-height: 63px;
        }
        .table-cart tr td .img-product img {
            width: 100%;
        }
        .table-cart tr td .name-product {
            font-size: 15px;
            color: #484848;
            padding-top: 8px;
            line-height: 24px;
            width: 50%;
        }
        .table-cart tr td .price {
            text-align: right;
            line-height: 64px;
            margin-right: 40px;
            color: #989898;
            font-size: 13px;
            font-family: 'Nunito';
        }
        .table-cart tr td .quanlity {
            position: relative;
        }
        .product-count .qtyminus,
        .product-count .qtyplus {
            width: 30px;
            height: 30px;
            background: transparent;
            text-align: center;
            font-size: 17px;
            line-height: 30px;
            color: #000;
            cursor: pointer;
            font-weight: 600;
        }
        .product-count .qtyminus {
            line-height: 32px;
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
            border: none;
        }
        /*.count-inlineflex {*/
        /*    display: inline-flex;*/
        /*    border: solid 2px #ccc;*/
        /*    border-radius: 20px;*/
        /*}*/
        .table_text_align_center quantity_div{
            display: inline-flex;
            border: solid 2px #ccc;
            border-radius: 20px;
        }
        .total {
            font-size: 18px;
            font-weight: 600;
            color: black;
        }
        .display-flex {
            display: flex;
        }
        .align-center {
            align-items: center;
        }

        .coupon-box {
            padding: 63px 0 58px;
            text-align: center;
            border: 2px dotted #e5e5e5;
            border-radius: 10px;
            margin-top: 55px;
        }
        .coupon-box form input {
            display: inline-block;
            width: 264px;
            margin-right: 13px;
            height: 44px;
            border-radius: 25px;
            border: solid 2px #cccccc;
            padding: 5px 15px;
            font-size: 14px;
        }
        input:focus {
            outline: none;
            box-shadow: none;
        }
        .round-black-btn {
            border-radius: 25px;
            background: #212529;
            color: #fff;
            padding: 8px 35px;
            display: inline-block;
            border: solid 2px #212529;
            transition: all 0.5s ease-in-out 0s;
            cursor: pointer;
        }
        .td_width_4 table_text_align_center delete_btn{
            border-radius: 18px;
            background: #212529;
            color: #fff;
            padding: 5px 15px;
            display: inline-block;
            border: solid 2px #212529;
            transition: all 0.5s ease-in-out 0s;
            cursor: pointer;
        }
        .round-black-btn:hover,
        .round-black-btn:focus {
            background: transparent;
            color: #212529;
            text-decoration: none;
        }
        .cart-totals {
            border-radius: 3px;
            background: #e7e7e7;
            padding: 25px;
        }
        .cart-totals h3 {
            font-size: 19px;
            color: #3c3c3c;
            letter-spacing: 1px;
            font-weight: 500;
        }
        .cart-totals table {
            width: 100%;
        }
        .cart-totals table tr th,
        .cart-totals table tr td {
            width: 50%;
            padding: 3px 0;
            vertical-align: middle;
        }
        .cart-totals table tr td:last-child {
            text-align: right;
        }
        .cart-totals table tr td.subtotal {
            font-size: 20px;
            color: #6f6f6f;
        }
        .cart-totals table tr td.free-shipping {
            font-size: 14px;
            color: #6f6f6f;
        }
        .cart-totals table tr.total-row td {
            padding-top: 25px;
        }
        .cart-totals table tr td.price-total {
            font-size: 24px;
            font-weight: 600;
            color: #8660e9;
        }
        .btn-cart-totals {
            text-align: center;
            margin-top: 60px;
            margin-bottom: 20px;
        }
        .btn-cart-totals .round-black-btn {
            margin: 10px 0;
        }
        .quantity_div{
            position: relative;
            width: 42px;
            height: 25px;
            text-align: left;
            margin: 5px auto;
        }
        .quantity_input{
            position: absolute;
            width: 27px;
            height: 23px;
            text-align: center;
            border: 1px solid #c6c6c6;
            border-right: 0px;
            line-height: 19px;
            font-size: 12px;
            color: #4c4848;
            left: 0;
        }
        .quantity_btn{
            position: absolute;
            border: 1px solid #aaa;
            color: #3a60df;
            width: 14px;
            height: 13px;
            padding: 0px;
            background-color: #fff;
            font-weight: bold;
            font-size: 7px;
            line-height: 6px;
            vertical-align: middle;
        }
        .plus_btn{
            top: 0;
            right: 0
        }
        .minus_btn{
            bottom: 0;
            right: 0
        }
        .quantity_modify_btn{
            border: 1px solid #d0d0d0;
            height: 13px;
            line-height: 13px;
            background-color: #fff;
            text-align: center;
            width: 35px;
            display: inline-block;
            padding: 3px 6px 2px;
            margin-top: 3px;
        }
        .table_text_align_center{
            text-align: center;
        }

    </style>
</head>
<body>
<%@include file="top.jsp"%>
<%@include file="nav.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800&display=swap" rel="stylesheet">
<div class="cart-wrap">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="main-heading">Shopping Cart</div>
                <div class="table-cart">
                    <table>
                        <thead>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th></th>
                        </tr>
                        </thead>
                    </table>
                    <table class="cart_table">
                        <tbody>
                        <c:forEach items="${cartInfo}" var="ci">
                        <tr>
                            <td>
                                <div class="display-flex align-center">
                                    <div class="img-product">
                                        <img src="${ci.image_url}" alt="" class="mCS_img_loaded">
                                    </div>
                                    <div class="name-product">
                                        ${ci.product_name}
                                    </div>
                                    <div class="price">
                                        <del>정가 : <fmt:formatNumber value="${ci.product_price}" pattern="#,### 원" /></del><br>
                                        판매가 : <span class="red_color"><fmt:formatNumber value="${ci.sale_price}" pattern="#,### 원" /></span><br>
                                    </div>
                                </div>
                            </td>
                            <td class="td_width_4 table_text_align_center">
                                <div class="table_text_align_center quantity_div">
                                    <input type="text" value="${ci.product_count}" class="quantity_input">
                                    <button class="quantity_btn plus_btn">+</button>
                                    <button class="quantity_btn minus_btn">-</button>
                                </div>
                                <button type="button" class="quantity_modify_btn" data-cartId="${ci.id}" style="font-size:12px; padding:3px 3px;">변경</button>
                            </td>
                            <td>
                                <div class="total">
                                    <fmt:formatNumber value="${ci.sale_price * ci.product_count}" pattern="#,### 원" />
                                </div>
                            </td>
                            <td>
                                <a href="#" title="">
                                    <button type="button" class="delete_btn btn-dark" data-cartid="${ci.id}" style="font-size:15px; padding:3px 3px;">삭제</button>
                                </a>
                            </td>
                            &nbsp;
                            <td class="td_width_1 cart_info_td">
                                <div class="form-check">
                                    <input class="individual_cart_checkbox" type="checkbox"  checked="checked">
                                </div>
                                <input type="hidden" class="individual_product_price_input"  value="${ci.product_price}">
                                <input type="hidden" class="individual_sale_price_input"  value="${ci.sale_price}">
                                <input type="hidden" class="individual_product_count_input"  value="${ci.product_count}">
                                <input type="hidden" class="individual_total_price_input"  value="${ci.sale_price * ci.product_count}">
                                <input type="hidden" class="individual_product_id_input"  value="${ci.product_id}">
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <!-- 수량 조정 form -->
                    <form action="/cart/update" method="post" class="quantity_update_form">
                        <input type="hidden" name="id" class="update_id">
                        <input type="hidden" name="product_count" class="update_product_count">
                        <input type="hidden" name="username" value="${user.username}">
                    </form>

                    <!-- 삭제 form -->
                    <form action="/cart/delete" method="post" class="quantity_delete_form">
                        <input type="hidden" name="id" class="delete_id">
                        <input type="hidden" name="username" value="${user.username}">
                    </form>

                    <!-- 주문 form -->
                    <form action="/order/${user.username}" method="get" class="order_form">

                    </form>
                </div>
                <!-- /.table-cart -->
            </div>
            <!-- /.col-lg-8 -->
            <div class="col-lg-4">
                <div class="cart-totals">
                    <h3>Cart Totals</h3>
                    <form action="#" method="get" accept-charset="utf-8">
                        <table>
                            <tbody>
                            <tr>
                                <td>Subtotal</td>
                                <td class="total_price_span"></td>
                                <td>원</td>
                            </tr>
                            <tr>
                                <td>Shipping</td>
                                <td class="delivery_price"></td>
                                <td>원</td>
                            </tr>
                            <tr class="total-row">
                                <td>Total</td>
                                <td class="final_total_price_span"></td>
                                <td>원</td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="btn-cart-totals">
                            <a class="order_btn round-black-btn">Buy</a>
                        </div>
                        <!-- /.btn-cart-totals -->
                    </form>
                    <!-- /form -->
                </div>
                <!-- /.cart-totals -->
            </div>
            <!-- /.col-lg-4 -->
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>
<script>

    /* 수량버튼 */
    $(".plus_btn").on("click", function(){
        let quantity = $(this).parent("div").find("input").val();
        $(this).parent("div").find("input").val(++quantity);
    });
    $(".minus_btn").on("click", function(){
        let quantity = $(this).parent("div").find("input").val();
        if(quantity > 1){
            $(this).parent("div").find("input").val(--quantity);
        }
    });


    /* 수량 수정 버튼 */
    $(".quantity_modify_btn").on("click", function(){
        let id = $(this).data("cartid");
        let product_count = $(this).parent("td").find("input").val();
        console.log(id);
        console.log(product_count);
        $(".update_id").val(id);
        $(".update_product_count").val(product_count);
        $(".quantity_update_form").submit();

    });

    /* 장바구니 삭제 버튼 */
    $(".delete_btn").on("click", function(e){
        e.preventDefault();
        const id = $(this).data("cartid");
        $(".delete_id").val(id);
        $(".quantity_delete_form").submit();
    });

    $(document).ready(function(){
        /*종합 정보 섹션 정보 삽입*/
        setTotalInfo();

        /* 체크여부에따른 종합 정보 변화 */
        $(".individual_cart_checkbox").on("change", function(){
            setTotalInfo($(".cart_info_td"));
        });
    });
    function setTotalInfo(){
        let total_price = 0;				// 총 가격
        let total_count = 0;				// 총 갯수
        let total_kind = 0;				// 총 종류
        let delivery_price = 0;			// 배송비
        let final_total_price = 0; 		// 최종 가격(총 가격 + 배송비)

        $(".cart_info_td").each(function(index, element){
            if($(element).find(".individual_cart_checkbox").is(":checked") === true) {
                // 총 가격
                total_price += parseInt($(element).find(".individual_total_price_input").val());
                // 총 갯수
                total_count += parseInt($(element).find(".individual_product_count_input").val());
                // 총 종류
                total_kind += 1;
            }

        });

        if(total_price >= 50000){
            delivery_price = 0;
        } else if(total_price == 0){
            delivery_price = 0;
        } else {
            delivery_price = 3000;
        }

        /* 최종 가격 */
        final_total_price = total_price + delivery_price;

        /* 값 삽입 */
        // 총 가격
        $(".total_price_span").text(total_price.toLocaleString());
        // 총 갯수
        $(".total_count_span").text(total_count);
        // 총 종류
        $(".total_kind_span").text(total_kind);
        // 배송비
        $(".delivery_price").text(delivery_price);
        // 최종 가격(총 가격 + 배송비)
        $(".final_total_price_span").text(final_total_price.toLocaleString());
    }

    /* 주문 페이지 이동 */
    $(".order_btn").on("click", function(){

        let form_contents ='';
        let orderNumber = 0;

        $(".cart_info_td").each(function(index, element){

            if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부

                let product_id = $(element).find(".individual_product_id_input").val();
                let product_count = $(element).find(".individual_product_count_input").val();

                let product_id_input = "<input name='orders[" + orderNumber + "].id' type='hidden' value='" + product_id + "'>";
                form_contents += product_id_input;

                let product_count_input = "<input name='orders[" + orderNumber + "].product_count' type='hidden' value='" + product_count + "'>";
                form_contents += product_count_input;

                orderNumber += 1;

            }
        });

        console.log(form_contents);
        $(".order_form").html(form_contents);
        $(".order_form").submit();

    });
</script>
</body>
</html>