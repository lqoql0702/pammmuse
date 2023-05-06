package com.pammmuse.pammmuse.controller;

import com.pammmuse.pammmuse.domain.Criteria;
import com.pammmuse.pammmuse.dto.PageVo;
import com.pammmuse.pammmuse.dto.ProductVo;
import com.pammmuse.pammmuse.dto.UserVo;
import com.pammmuse.pammmuse.service.ProductService;
import com.pammmuse.pammmuse.service.UserService;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    // 카테고리별 상품 리스트
    @GetMapping(value = "/product/list")
    public void getList(@RequestParam("c") int cate_code,
                        @RequestParam("l") int level, Model model) throws Exception {
        login(model);

        List<ProductVo> list = productService.productGetCateList(cate_code);

        model.addAttribute("list", list);

    }
    @GetMapping(value = "/product/dress")
    public void dress(@RequestParam("c") int cate_code,
                      @RequestParam("l") int level, Model model) throws Exception {
        login(model);

        List<ProductVo> list = productService.productGetCateList(cate_code);

        model.addAttribute("list", list);

    }

    /*상품 상세 */
    @GetMapping("/productDetail/{id}")
    public String productDetailGET(@PathVariable("id")int id, Model model) {

        login(model);

        model.addAttribute("productInfo", productService.getProductInfo(id));

        return "/product/detail";
    }

    /*상품 검색*/
    @GetMapping("/product/search")
    public String searchProductGet(Criteria cri, Model model){

        login(model);

        List<ProductVo> list = productService.searchProduct(cri);

        if(!list.isEmpty()){
            model.addAttribute("list", list);
        }else{
            model.addAttribute("pageMaker",new PageVo(cri, productService.getProductTotal(cri)));
        }
        return "/product/search";
    }

    public void login(Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof AnonymousAuthenticationToken == false){
            Long user_id = (Long) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            UserVo userVo = userService.getUserById(user_id);
            model.addAttribute("user", userVo);
        }
    }
}
