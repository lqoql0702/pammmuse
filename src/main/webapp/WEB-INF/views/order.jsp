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
    <!-- 다음주소 -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style type="text/css">
        *{
            margin: 0;
            padding:0;
        }
        a{
            text-decoration: none;
        }

        .top_gnb_area .list li{
            list-style: none;
            float : left;
            padding: 13px 15px 0 10px;
            font-weight: 900;
            cursor: pointer;
        }

        .search_input select{
            width: 20%;
            text-align: center;
            font-size: 15px;
        }
        .search_input input{
            margin-left: 10px;
            width: 57%;
            font-size: 18px;
            padding-left: 2%;
        }

        .login_area>span{
            margin-top: 10px;
            font-weight: 900;
            display: inline-block;
        }

        table{
            border-collapse: collapse;
            width: 100%;
        }
        .table_text_align_center{
            text-align: center;
        }
        caption{
            visibility: hidden;
            width: 0;
            height: 0;
            font-size: 0;
            line-height: 0;
            overflow: hidden;
        }


        .content_subject span{
            padding-left: 30 px;
            display: inline-block;
            color: white;
            font-size: 50px;
            font-weight: bolder;
        }


        .login_success_area>a{
            font-size: 15px;
            font-weight: 900;
            display: inline-block;
            margin-top: 5px;
            background: #e1e5e8;
            width: 82px;
            height: 22px;
            line-height: 22px;
            border-radius: 25px;
            color: #606267;
        }
        .login_success_area>span{
            display : block;
            text-align: left;
            margin-left: 10%;
        }



        .filter_button_wrap button {
            width: 50%;
        }
        .filter_button{
            background-color: #04AA6D;
            border: 1px solid green;
            color: white;
            padding: 10px 24px;
            cursor: pointer;
            float: left;
        }
        .filter_button_wrap:after {
            content: "";
            clear: both;
            display: table;
        }
        .filter_button_wrap button:not(:last-child) {
            border-right: none;
        }
        .filter_button:hover {
            background-color: #3e8e41;
        }
        .filter_active{
            background-color: #045d3c;
        }
        .filter_content{
            padding:20px 50px 20px 50px;
            border: 1px solid gray;
        }
        .filter_content a:not(:first-child){
            margin-left: 10px;
        }




        .content_main{
            min-height: 700px;
            padding-right: 350px;
            position: relative;
        }
        table{
            border-collapse: collapse;
        }

        /* 사용자 정보  */
        .memberInfo_table{
            width: 100%;
            border-spacing: 0;
            border-top: 2px solid #363636;
            border-bottom: 1px solid #b6b6b6;
        }
        .member_info_div td{
            padding : 12px;
            text-align: left;
        }
        /* 사용자 정보  */
        .memberInfo_table{
            width: 100%;
            border-spacing: 0;
            border-top: 2px solid #363636;
            border-bottom: 1px solid #b6b6b6;
        }
        .member_info_div td{
            padding : 12px;
            text-align: left;
        }
        /* 사용자 주소 정보 */
        .addressInfo_div{
            margin-top: 30px;
        }
        .addressInfo_input_div_wrap{
            border-bottom: 1px solid #f3f3f3;
            height: 225px;
        }
        .address_btn {
            background-color: #555;
            color: white;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            font-size: 17px;
            width: 50%;
        }

        .address_btn:hover{
            background-color: #777;
        }
        .addressInfo_button_div::after{
            content:'';
            display:block;
            clear:both;
        }
        .addressInfo_input_div{
            padding:12px;
            text-align: left;
            display: none;
            line-height: 40px;
        }
        .addressInfo_input_div th{
            border-color: transparent;
            background-color: transparent;
        }
        .addressInfo_input_div th{
            padding : 12px 5px 12px 20px;
            vertical-align: top;
        }
        .addressInfo_input_div td{
            padding : 8px 12px;
        }
        .addressInfo_input_div_2 input{
            padding: 6px 5px;
        }
        .address_search_btn{
            vertical-align: middle;
            display: inline-block;
            border: 1px solid #aaa;
            width: 90px;
            text-align: center;
            height: 30px;
            line-height: 30px;
            color: #555;
            cursor: pointer;
        }
        .orderGoods_div{
            margin-top:30px;
        }
        .goods_kind_div{
            font-size: 25px;
            line-height: 35px;
            font-weight: bold;
        }
        .goods_subject_table{
            font-size: 14px;
            line-height: 20px;
            width: 100%;
            text-align: center;
        }
        .goods_subject_table th{
            text-align: center;
            color: #333;
            border-bottom: 1px solid #e7e7e7;
            border-top: 2px solid #333;
            background: white;
            padding: 2px 0;
        }
        .goods_table{
            font-size: 14px;
            line-height: 20px;
            border-bottom: 1px solid #e7e7e7;
        }

        .goods_table tr{
            height: 110px;
        }
        .goods_table_price_td{
            text-align: center;
        }

        /* 이미지 */

        .img-product {
            width: 180px;
            float: left;
            margin-left: 8px;
            margin-right: 31px;
            margin-top: 8px;
            line-height: 63px;
        }
        .img-product img {
            width: 80%;
        }
        /* 주문 종합 정보 */
        .total_info_div{
            position:absolute;
            top: 0;
            right : 0;
            width : 300px;
            border : 1px solid #333;
            border-top-width:2px;

        }
        .total_info_price_div{
            width: 90%;
            margin: auto;
            position: relative;
        }
        .total_info_div ul{
            list-style: none;
        }
        .total_info_div li{
            text-align: right;
            margin-top:10px;
        }
        .price_span_label{
            float: left;
        }
        .price_total_li{
            border-top: 1px solid #ddd;
            padding-top: 20px;
        }
        .strong_red{
            color: black;
        }
        .total_price_red{
            font-size: 25px;
        }
        .total_price_label{
            margin-top: 5px;
        }
        .point_li{
            padding: 15px;
            border-top: 1px solid #ddd;
            margin: 10px -15px 0;
        }
        .total_info_btn_div{
            border-top: 1px solid #ddd;
            text-align: center;
            padding: 15px 20px;
        }
        .order_btn{
            display: inline-block;
            font-size: 21px;
            line-height: 50px;
            width: 200px;
            height: 50px;
            background-color: black;
            color: white;
            font-weight: bold;
        }
        /* float 속성 해제 */
        .clearfix{
            clear: both;
        }
    </style>
</head>
<body>
<%@include file="top.jsp"%>
<%@include file="nav.jsp"%>
<div class="content_main">
    <!-- 회원 정보 -->
    <div class="member_info_div">
        <table class="table_text_align_center memberInfo_table">
            <tbody>
            <tr>
                <th style="width: 25%;">주문자</th>
                <td style="width: *">${userInfo.name} | ${userInfo.email}</td>
            </tr>
            </tbody>
        </table>
    </div>
    <!-- 배송지 정보 -->
    <div class="addressInfo_div">
        <div class="addressInfo_button_div">
            <button class="address_btn address_btn_1" onclick="showAdress('1')" style="background-color: #3c3838;">상용자 정보 주소록</button>
            <button class="address_btn address_btn_2" onclick="showAdress('2')">직접 입력</button>
        </div>
        <div class="addressInfo_input_div_wrap">
            <div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
                <table>
                    <colgroup>
                        <col width="25%">
                        <col width="*">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>이름</th>
                        <td>
                            ${userInfo.name}
                        </td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>
                            ${userInfo.address}
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="addressInfo_input_div addressInfo_input_div_2">
                <table>
                    <colgroup>
                        <col width="25%">
                        <col width="*">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>이름</th>
                        <td>
                            <input class="addressee_input">
                        </td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>

                            <input class="address1_input" readonly="readonly"> <a class="address_search_btn" onclick="execution_daum_address()">주소 찾기</a><br>
                            <input class="address2_input" readonly="readonly"><br>
                            <input class="address3_input" readonly="readonly">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- 상품 정보 -->
    <div class="orderGoods_div">
        <!-- 상품 종류 -->
        <div class="goods_kind_div">
            주문상품 (<span class="goods_kind_div_kind"></span>종 <span class="goods_kind_div_count"></span>개)
        </div>
        <!-- 상품 테이블 -->
        <table class="goods_subject_table">
            <colgroup>
                <col width="15%">
                <col width="45%">
                <col width="40%">
            </colgroup>
            <tbody>
            <tr>
                <th>이미지</th>
                <th>상품 정보</th>
                <th>판매가</th>
            </tr>
            </tbody>
        </table>
        <table class="goods_table">
            <colgroup>
                <col width="15%">
                <col width="45%">
                <col width="40%">
            </colgroup>
            <tbody>
            <c:forEach items="${orderList}" var="ol">
                <tr>
                    <td>
                        <div class="img-product">
                            <img src="${ol.image_url}" alt="" class="mCS_img_loaded">
                        </div>
                    </td>
                    <td>${ol.product_name}</td>
                    <td class="goods_table_price_td">
                        <fmt:formatNumber value="${ol.sale_price}" pattern="#,### 원" /> | 수량 ${ol.product_count}개
                        <br><fmt:formatNumber value="${ol.total_price}" pattern="#,### 원" />
                        <input type="hidden" class="individual_product_price_input" value="${ol.product_price}">
                        <input type="hidden" class="individual_sale_price_input" value="${ol.sale_price}">
                        <input type="hidden" class="individual_product_count_input" value="${ol.product_count}">
                        <input type="hidden" class="individual_total_price_input" value="${ol.sale_price * ol.product_count}">
                        <input type="hidden" class="individual_id_input" value="${ol.id}">
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
    <!-- 주문 종합 정보 -->
    <div class="total_info_div">
        <!-- 가격 종합 정보 -->
        <div class="total_info_price_div">
            <ul>
                <li>
                    <span class="price_span_label">상품 금액</span>
                    <span class="total_price_span">100000</span>원
                </li>
                <li>
                    <span class="price_span_label">배송비</span>
                    <span class="delivery_price_span">100000</span>원
                </li>
                <li class="price_total_li">
                    <strong class="price_span_label total_price_label">최종 결제 금액</strong>
                    <strong class="strong_red">
						<span class="total_price_red final_total_price_span">
							1500000
						</span>원
                    </strong>
                </li>
            </ul>
        </div>
        <!-- 버튼 영역 -->
        <div class="total_info_btn_div">
            <a class="order_btn">주문하기</a>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>

<script>
    $(document).ready(function(){

        /* 주문 조합정보란 최신화 */
        setTotalInfo();

    });
    /* 주소입력란 버튼 동작(숨김, 등장) */
    /* 주소입력란 버튼 동작(숨김, 등장) */
    function showAdress(className){
        /* 컨텐츠 동작 */
        /* 모두 숨기기 */
        $(".addressInfo_input_div").css('display', 'none');
        /* 컨텐츠 보이기 */
        $(".addressInfo_input_div_" + className).css('display', 'block');

        /* 버튼 색상 변경 */
        /* 모든 색상 동일 */
        $(".address_btn").css('backgroundColor', '#555');
        /* 지정 색상 변경 */
        $(".address_btn_"+className).css('backgroundColor', '#3c3838');
    }

    /* 다음 주소 연동 */
    function execution_daum_address(){
        console.log("동작");
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 추가해야할 코드
                    // 주소변수 문자열과 참고항목 문자열 합치기
                    addr += extraAddr;

                } else {
                    addr += ' ';
                }

                // 제거해야할 코드
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".address1_input").val(data.zonecode);
                $(".address2_input").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                $(".address3_input").attr("readonly", false);
                $(".address3_input").focus();


            }
        }).open();

    }

    /* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
    function setTotalInfo(){

        let total_price = 0;				// 총 가격
        let total_count = 0;				// 총 갯수
        let total_kind = 0;				// 총 종류
        let delivery_price = 0;			// 배송비
        let final_total_price = 0; 		// 최종 가격(총 가격 + 배송비)

        $(".goods_table_price_td").each(function(index, element){
            // 총 가격
            total_price += parseInt($(element).find(".individual_total_price_input").val());
            // 총 갯수
            total_count += parseInt($(element).find(".individual_product_count_input").val());
            // 총 종류
            total_kind += 1;

        });

        /* 배송비 결정 */
        if(total_price >= 50000){
            delivery_price = 0;
        } else if(total_price == 0){
            delivery_price = 0;
        } else {
            delivery_price = 3000;
        }

        final_total_price = total_price + delivery_price;

        /* 값 삽입 */
        // 총 가격
        $(".total_price_span").text(total_price.toLocaleString());
        // 총 갯수
        $(".goods_kind_div_count").text(total_count);
        // 총 종류
        $(".goods_kind_div_kind").text(total_kind);
        // 배송비
        $(".delivery_price_span").text(delivery_price.toLocaleString());
        // 최종 가격(총 가격 + 배송비)
        $(".final_total_price_span").text(final_total_price.toLocaleString());

    }
</script>
</body>
</html>