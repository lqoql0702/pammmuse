package com.pammmuse.pammmuse.service;

import com.pammmuse.pammmuse.model.NoticeVo;
import com.pammmuse.pammmuse.repository.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService{

    @Autowired
    private NoticeMapper noticeMapper;

    /*게시판 등록*/
    @Override
    public List<NoticeVo> getNotice(){
        return noticeMapper.getNotice();
    }

    @Override
    /* 게시판 조회 */
    public NoticeVo getDetail(int id){
        return noticeMapper.getDetail(id);
    }
}
