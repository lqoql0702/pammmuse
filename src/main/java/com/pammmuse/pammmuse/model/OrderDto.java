package com.pammmuse.pammmuse.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Getter
@Setter
public class OrderDto {
    /* 주문 번호 */
    private String order_id;

    /* 배송 받는이 */
    private String addressee;

    /* 주문 회원 아이디 */
    private String username;

    /* 우편번호 */
    private String user_addr1;

    /* 회원 주소 */
    private String user_addr2;

    /* 회원 상세주소 */
    private String user_addr3;

    /* 주문 상태 */
    private String order_state;

    /* 배송비 */
    private int delivery_cost;

    /* 주문 날짜 */
    private Date order_date;

    /* 주문 상품 */
    private List<OrderItemDto> orders;


    /* DB테이블 존재 하지 않는 데이터 */

    /* 판매가(모든 상품 비용) */
    private int order_sale_price;

    /* 최종 판매 비용 */
    private int order_final_sale_price;

    public void getOrderPriceInfo() {
        /* 상품 비용 */
        for(OrderItemDto order : orders) {
            order_sale_price += order.getTotal_price();
        }
        /* 배송비용 */
        if(order_sale_price >= 50000) {
            delivery_cost = 0;
        } else {
            delivery_cost = 3000;
        }
        /* 최종 비용(상품 비용 + 배송비 - 사용 포인트) */
        order_final_sale_price = order_sale_price + delivery_cost;
    }
}
