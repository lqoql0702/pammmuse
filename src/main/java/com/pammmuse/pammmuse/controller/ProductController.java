package com.pammmuse.pammmuse.controller;

import com.pammmuse.pammmuse.domain.Criteria;
import com.pammmuse.pammmuse.dto.PageVo;
import com.pammmuse.pammmuse.dto.ProductVo;
import com.pammmuse.pammmuse.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    // 카테고리별 상품 리스트
    @GetMapping(value = "/product/list")
    public void getList(@RequestParam("c") int cate_code,
                        @RequestParam("l") int level, Model model) throws Exception {

        List<ProductVo> list = productService.productGetCateList(cate_code);

        model.addAttribute("list", list);

    }
    @GetMapping(value = "/product/dress")
    public void dress(@RequestParam("c") int cate_code,
                      @RequestParam("l") int level, Model model) throws Exception {

        List<ProductVo> list = productService.productGetCateList(cate_code);

        model.addAttribute("list", list);

    }

    /*상품 상세 */
    @GetMapping("/productDetail/{id}")
    public String productDetailGET(@PathVariable("id")int id, Model model) {

        model.addAttribute("productInfo", productService.getProductInfo(id));

        return "/product/detail";
    }

    /*상품 검색*/
    @GetMapping("/product/search")
    public String searchProductGet(Criteria cri, Model model){
        List<ProductVo> list = productService.searchProduct(cri);

        if(!list.isEmpty()){
            model.addAttribute("list", list);
        }else{
            model.addAttribute("pageMaker",new PageVo(cri, productService.getProductTotal(cri)));
        }
        return "/product/search";
    }
}
