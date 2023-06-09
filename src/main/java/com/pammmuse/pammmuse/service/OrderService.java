package com.pammmuse.pammmuse.service;

import com.pammmuse.pammmuse.model.OrderDto;
import com.pammmuse.pammmuse.model.OrderItemDto;

import java.util.List;

public interface OrderService {

    /* 주문 정보 */
    public List<OrderItemDto> getProductsInfo(List<OrderItemDto> orders);
    /* 주문 */
    public void  order(OrderDto ord);
}
