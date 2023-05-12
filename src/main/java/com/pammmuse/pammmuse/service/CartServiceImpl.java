package com.pammmuse.pammmuse.service;

import com.pammmuse.pammmuse.dto.CartVo;
import com.pammmuse.pammmuse.repository.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartMapper cartMapper;

    @Override
    public int addCart(CartVo cart) {
        // 장바구니 데이터 체크
        CartVo checkCart = cartMapper.checkCart(cart);

        if(checkCart != null) {
            return 2;
        }

        // 장바구니 등록 & 에러 시 0반환
        try {
            return cartMapper.addCart(cart);
        } catch (Exception e) {
            return 0;
        }

    }

    @Override
    /* 장바구니 정보 리스트 */
    public List<CartVo> getCartList(String username){
        List<CartVo> cart = cartMapper.getCart(username);

        for(CartVo vo : cart) {
            vo.initSaleTotal();
        }

        return cart;

    }

    @Override
    /* 카트 수량 수정 */
    public int modifyCount(CartVo cart){
        return cartMapper.modifyCount(cart);
    }

    @Override
    public int deleteCart(int id) {

        return cartMapper.deleteCart(id);
    }
}
