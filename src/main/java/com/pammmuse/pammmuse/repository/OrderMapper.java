package com.pammmuse.pammmuse.repository;

import com.pammmuse.pammmuse.model.OrderItemDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {

    /* 주문 상품 정보 */
    public OrderItemDto getProductsInfo(int id);
}
