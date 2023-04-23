package com.pammmuse.pammmuse.controller;

import com.pammmuse.pammmuse.dto.ProductVo;
import com.pammmuse.pammmuse.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public void productList(Model model){
        List list = productService.productGetList();
        model.addAttribute("list", list);
    }




}
