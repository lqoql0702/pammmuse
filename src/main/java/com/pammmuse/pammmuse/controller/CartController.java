package com.pammmuse.pammmuse.controller;

import com.pammmuse.pammmuse.dto.CartVo;
import com.pammmuse.pammmuse.dto.UserVo;
import com.pammmuse.pammmuse.service.CartService;
import com.pammmuse.pammmuse.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.PortResolverImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
public class CartController {

    private static final Logger log = LoggerFactory.getLogger(CartController.class);

    @Autowired
    private CartService cartService;
    @Autowired
    private UserService userService;

    @PostMapping("/cart/add")
    @ResponseBody
    public String addCartPOST(CartVo cart) {
        String user = cart.getUsername();
        if(user == "") {
            return "5";
        }

        log.info("장바구니  추가");

        // 카트 등록
        int result = cartService.addCart(cart);

        log.info("결과"+result);

        return result + "";
    }

    @GetMapping("/cart/{username}")
    public String cartPageGET(@PathVariable("username") String username, Model model) {

        model.addAttribute("cartInfo", cartService.getCartList(username));

        return "/cart";
    }
}
