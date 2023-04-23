package com.pammmuse.pammmuse.service;

import com.pammmuse.pammmuse.dto.ProductVo;

import java.util.List;

public interface ProductService {
    /* 상품 리스트 */
    public List<ProductVo> productGetList();

    /* 상품 조회 페이지 */
    public ProductVo getProductInfo(int id);

    /*카테고리별 상품 리스트*/
    public List<ProductVo> productGetCateList(int cate_code);

}
