package com.pammmuse.pammmuse.service;


import com.pammmuse.pammmuse.controller.CartController;
import com.pammmuse.pammmuse.model.*;
import com.pammmuse.pammmuse.repository.CartMapper;
import com.pammmuse.pammmuse.repository.OrderMapper;
import com.pammmuse.pammmuse.repository.ProductMapper;
import com.pammmuse.pammmuse.repository.UserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{

    private static final Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private CartMapper cartMapper;

    @Autowired
    private ProductMapper productMapper;

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

    @Override
    @Transactional
    public void order(OrderDto ord) {
        /* 사용할 데이터가져오기 */
        /* 회원 정보 */
        UserVo user = userMapper.getUserByUserName(ord.getUsername());

        /* 주문 정보 */
        List<OrderItemDto> ords = new ArrayList<>();
        for (OrderItemDto oit : ord.getOrders()) {
            OrderItemDto orderItem = orderMapper.getOrderInfo(oit.getId());
            // 수량 셋팅
            orderItem.setProduct_count(oit.getProduct_count());
            // 기본정보 셋팅
            orderItem.initSaleTotal();
            //List객체 추가
            ords.add(orderItem);
        }
        /* OrderDTO 셋팅 */
        ord.setOrders(ords);
        ord.getOrderPriceInfo();

        /*DB 주문,주문상품(,배송정보) 넣기*/

        /* orderId만들기 및 OrderDTO객체 orderId에 저장 */
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
        String order_id = user.getUsername() + format.format(date);
        ord.setOrder_id(order_id);

        /* db넣기 */
        orderMapper.enrollOrder(ord);        //order 등록
        for (OrderItemDto oit : ord.getOrders()) {        //order_item 등록
            oit.setOrder_id(order_id);
            orderMapper.enrollOrderItem(oit);
        }

        /* 재고 변동 적용 */
        for(OrderItemDto oit : ord.getOrders()) {
            /* 변동 재고 값 구하기 */
            ProductVo product = productMapper.getProductInfo(oit.getId());
            product.setProduct_stock(product.getProduct_stock() - oit.getProduct_count());
            /* 변동 값 DB 적용 */
            orderMapper.deductStock(product);
        }

        /* 장바구니 제거 */
        for(OrderItemDto oit : ord.getOrders()) {
            CartDto dto = new CartDto();
            dto.setUsername(ord.getUsername());
            dto.setId(oit.getId());

            cartMapper.deleteOrderCart(dto);
        }
    }
}
