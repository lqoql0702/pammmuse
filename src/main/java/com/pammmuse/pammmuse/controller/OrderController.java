package com.pammmuse.pammmuse.controller;

import com.pammmuse.pammmuse.model.OrderDto;
import com.pammmuse.pammmuse.model.OrderPageDto;
import com.pammmuse.pammmuse.model.UserVo;
import com.pammmuse.pammmuse.service.OrderService;
import com.pammmuse.pammmuse.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class OrderController {

    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;

    @GetMapping("/order/{username}")
    public String orderPgaeGET(@PathVariable("username") String username, OrderPageDto od, Model model) {

        login(model);

        model.addAttribute("orderList", orderService.getProductsInfo(od.getOrders()));
        model.addAttribute("userInfo", userService.getOrderUserInfo(username));

        return "/order";

    }

    @PostMapping("/order")
    public String orderPagePost(OrderDto od) {

        System.out.println(od);
        orderService.order(od);


        return "redirect:/main";
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
