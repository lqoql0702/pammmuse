package com.pammmuse.pammmuse.repository;

import com.pammmuse.pammmuse.dto.NoticeVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeMapper {

    /* 게시판 목록 */
    public List<NoticeVo> getNotice();

    /* 게시판 조회 */
    public NoticeVo getDetail(int id);
}
