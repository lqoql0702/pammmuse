package com.pammmuse.pammmuse.repository;

import com.pammmuse.pammmuse.domain.Criteria;
import com.pammmuse.pammmuse.model.ProductVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductMapper {

    /* 상품 리스트 */
    public List<ProductVo> productGetList();

    /* 상품 조회 */
    public ProductVo getProductInfo(int id);

    /*카테고리별 상품 리스트*/
    public  List<ProductVo> productGetCateList(int cate_code);

    /* 상품 검색 */
    public List<ProductVo> searchProduct(Criteria cri);


}
