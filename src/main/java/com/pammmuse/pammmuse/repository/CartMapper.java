package com.pammmuse.pammmuse.repository;

import com.pammmuse.pammmuse.model.CartDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CartMapper {

    /* 카트 추가 */
    public int addCart(CartDto cart) throws Exception;

    /* 카트 삭제 */
    public int deleteCart(int id);

    /* 카트 수량 수정 */
    public int modifyCount(CartDto cart);

    /* 카트 목록 */
    public List<CartDto> getCart(String username);

    /* 카트 확인 */
    public CartDto checkCart(CartDto cart);
}
