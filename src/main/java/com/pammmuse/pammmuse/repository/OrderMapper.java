package com.pammmuse.pammmuse.repository;

import com.pammmuse.pammmuse.model.OrderDto;
import com.pammmuse.pammmuse.model.OrderItemDto;
import com.pammmuse.pammmuse.model.ProductVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {

    /* 주문 상품 정보 */
    public OrderItemDto getProductsInfo(int id);
    /* 주문 상품 정보(주문 처리) */
    public OrderItemDto getOrderInfo(int id);
    /* 주문 테이블 등록 */
    public int enrollOrder(OrderDto ord);
    /* 주문 아이템 테이블 등록 */
    public int enrollOrderItem(OrderItemDto orid);
    /* 주문 재고 차감 */
    public int deductStock(ProductVo product);

}
