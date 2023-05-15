package com.pammmuse.pammmuse.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVo {
    private Long id;
    private String name;
    private String username;
    private String email;
    private String password;
    private String user_addr1;
    private String user_addr2;
    private String user_addr3;
    private String phone;
    private String sns_id;

}
