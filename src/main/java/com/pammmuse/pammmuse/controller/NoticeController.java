package com.pammmuse.pammmuse.controller;

import com.pammmuse.pammmuse.service.NoticeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {

    private static final Logger log = LoggerFactory.getLogger(NoticeController.class);

    @Autowired
    private NoticeService noticeService;

    /* 게시판 목록 페이지 접속 */
    @GetMapping("/notice/list")
    public void noticeListGET(Model model) {

        log.info("게시판 목록 페이지 진입");

        model.addAttribute("list", noticeService.getNotice());

    }

    /* 게시판 조회 */
    @GetMapping("/notice/detail")
    public void nooticeDetaillGET(int id, Model model) {

        model.addAttribute("pageInfo", noticeService.getDetail(id));

    }


}
