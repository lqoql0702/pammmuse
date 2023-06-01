package com.pammmuse.pammmuse.controller;

import com.pammmuse.pammmuse.model.CartDto;
import com.pammmuse.pammmuse.model.UserVo;
import com.pammmuse.pammmuse.service.CartService;
import com.pammmuse.pammmuse.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
    public static final String	Need_Login	= "5";

    @PostMapping("/cart/add")
    @ResponseBody
    public String addCartPOST(CartDto cart) {
        String user = cart.getUsername();
        if(user == "") {
            return Need_Login;
        }

        log.info("장바구니  추가");

        // 카트 등록
        int result = cartService.addCart(cart);

        log.info("결과"+result);

        return result + "";
    }

    @GetMapping("/cart/{username}")
    public String cartPageGET(@PathVariable("username") String username, Model model) {
        login(model);

        model.addAttribute("cartInfo", cartService.getCartList(username));

        return "/cart";
    }

    /* 장바구니 수량 수정 */
    @PostMapping("/cart/update")
    public String updateCartPOST(CartDto cart, Model model) {
        login(model);

        cartService.modifyCount(cart);

        return "redirect:/cart/" + cart.getUsername();
    }

    /* 장바구니 수량 수정 */
    @PostMapping("/cart/delete")
    public String deleteCartPOST(CartDto cart, Model model) {
        login(model);

        cartService.deleteCart(cart.getId());

        return "redirect:/cart/" + cart.getUsername();

    }

    public void login(Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof AnonymousAuthenticationToken == false){
            Long user_id = Long.valueOf(String.valueOf(SecurityContextHolder.getContext().getAuthentication().getPrincipal()));
            UserVo userVo = userService.getUserById(user_id);
            model.addAttribute("user", userVo);
        }
    }
}
