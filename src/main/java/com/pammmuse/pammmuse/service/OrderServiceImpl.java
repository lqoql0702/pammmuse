package com.pammmuse.pammmuse.service;


import com.pammmuse.pammmuse.model.OrderDto;
import com.pammmuse.pammmuse.model.OrderItemDto;
import com.pammmuse.pammmuse.repository.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<OrderItemDto> getProductsInfo(List<OrderItemDto> orders){
        List<OrderItemDto> result = new ArrayList<OrderItemDto>();

        for(OrderItemDto ord : orders) {

            OrderItemDto productsInfo = orderMapper.getProductsInfo(ord.getId());

            productsInfo.setProduct_count(ord.getProduct_count());

            productsInfo.initSaleTotal();

            result.add(productsInfo);
        }

        return result;
    }
}
