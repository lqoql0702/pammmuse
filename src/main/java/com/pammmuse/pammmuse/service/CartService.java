package com.pammmuse.pammmuse.service;

import com.pammmuse.pammmuse.model.CartDto;

import java.util.List;

public interface CartService {

    /* 장바구니 추가 */
    public int addCart(CartDto cart);
    /* 장바구니 정보 리스트 */
    public List<CartDto> getCartList(String username);
    /* 카트 수량 수정 */
    public int modifyCount(CartDto cart);

    /* 카트 삭제 */
    public int deleteCart(int id);

}
