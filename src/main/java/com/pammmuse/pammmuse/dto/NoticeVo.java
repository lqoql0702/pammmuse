package com.pammmuse.pammmuse.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class NoticeVo {

    private int id;
    private String title;
    private String content;
    private Date reg_date;
    private Date update_date;
}
