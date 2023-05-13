package com.pammmuse.pammmuse.controller;

import com.pammmuse.pammmuse.model.UserVo;
import com.pammmuse.pammmuse.service.ProductService;
import com.pammmuse.pammmuse.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public void productList(Model model){

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof AnonymousAuthenticationToken == false){
            Long id = (Long) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            UserVo userVo = userService.getUserById(id);
            model.addAttribute("user", userVo);
        }

        List list = productService.productGetList();
        model.addAttribute("list", list);
    }




}
