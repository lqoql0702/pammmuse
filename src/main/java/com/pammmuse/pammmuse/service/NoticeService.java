package com.pammmuse.pammmuse.service;

import com.pammmuse.pammmuse.model.NoticeVo;

import java.util.List;

public interface NoticeService {

    /* 게시판 목록 */
    public List<NoticeVo> getNotice();

    /* 게시판 조회 */
    public NoticeVo getDetail(int id);
}
