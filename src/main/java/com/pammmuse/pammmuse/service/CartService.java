package com.pammmuse.pammmuse.service;

import com.pammmuse.pammmuse.dto.CartVo;

import java.util.List;

public interface CartService {

    /* 장바구니 추가 */
    public int addCart(CartVo cart);
    /* 장바구니 정보 리스트 */
    public List<CartVo> getCartList(String username);
}
