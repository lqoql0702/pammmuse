package com.pammmuse.pammmuse.service;

import com.pammmuse.pammmuse.model.CartDto;
import com.pammmuse.pammmuse.repository.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartMapper cartMapper;

    public static final int Already_In_Cart	= 2;
    public static final int Cannot_Update_Cart	= 0;

    @Override
    public int addCart(CartDto cart) {
        // 장바구니 데이터 체크
        CartDto checkCart = cartMapper.checkCart(cart);

        if(checkCart != null) {
            return Already_In_Cart;
        }

        // 장바구니 등록 & 에러 시 0반환
        try {
            return cartMapper.addCart(cart);
        } catch (Exception e) {
            return Cannot_Update_Cart;
        }

    }

    @Override
    /* 장바구니 정보 리스트 */
    public List<CartDto> getCartList(String username){
        List<CartDto> cart = cartMapper.getCart(username);

        for(CartDto vo : cart) {
            vo.initSaleTotal();
        }

        return cart;

    }

    @Override
    /* 카트 수량 수정 */
    public int modifyCount(CartDto cart){
        return cartMapper.modifyCount(cart);
    }

    @Override
    public int deleteCart(int id) {

        return cartMapper.deleteCart(id);
    }
}
