package com.pammmuse.pammmuse.dto;

import lombok.AllArgsConstructor;
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
    private String address;
    private String phone;

}
