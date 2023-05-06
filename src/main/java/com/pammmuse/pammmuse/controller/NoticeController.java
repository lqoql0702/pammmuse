package com.pammmuse.pammmuse.controller;

import com.pammmuse.pammmuse.dto.UserVo;
import com.pammmuse.pammmuse.service.NoticeService;
import com.pammmuse.pammmuse.service.UserService;
import org.apache.catalina.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {

    private static final Logger log = LoggerFactory.getLogger(NoticeController.class);

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private UserService userService;


    /* 게시판 목록 페이지 접속 */
    @GetMapping("/notice/list")
    public void noticeListGET(Model model) {

        login(model);

        log.info("게시판 목록 페이지 진입");

        model.addAttribute("list", noticeService.getNotice());

    }

    /* 게시판 조회 */
    @GetMapping("/notice/detail")
    public void nooticeDetaillGET(int id, Model model) {

        login(model);

        model.addAttribute("pageInfo", noticeService.getDetail(id));

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
