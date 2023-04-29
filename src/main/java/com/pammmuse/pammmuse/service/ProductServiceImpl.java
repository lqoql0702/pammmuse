package com.pammmuse.pammmuse.service;

import com.pammmuse.pammmuse.domain.Criteria;
import com.pammmuse.pammmuse.dto.ProductVo;
import com.pammmuse.pammmuse.repository.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService{

    @Autowired
    private ProductMapper productMapper;

    /* 상품 리스트 */
    @Override
    public List<ProductVo> productGetList() {
//        log.info("productGetTotalList()..........");
        return productMapper.productGetList();
    }

    /* 상품 조회 페이지 */
    @Override
    public ProductVo getProductInfo(int id) {

//        log.info("(service)productGetDetail......." + id);

        return productMapper.getProductInfo(id);
    }

    /*카테고리별 상품 리스트*/
    @Override
    public List<ProductVo> productGetCateList(int cate_code){

        return productMapper.productGetCateList(cate_code);
    }

    /* 상품 검색 */
    @Override
    public List<ProductVo> searchProduct(Criteria cri){
        return productMapper.searchProduct(cri);
    }

    /* 상품 총 갯수 */
    @Override
    public int getProductTotal(Criteria cri){
        return productMapper.getProductTotal(cri);
    }


}
