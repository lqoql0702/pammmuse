package com.pammmuse.pammmuse.service;

import com.pammmuse.pammmuse.model.UserVo;
import org.apache.catalina.User;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Map;

public interface UserService {

    public UserVo getUserById(Long id);
    public UserVo getUserByUsername(String username);
    public void signup(UserVo userVo);
    public void edit(UserVo userVo);
    public void withdraw(Long id);
    public PasswordEncoder passwordEncoder();

    /* 주문자 정보 */
    public UserVo getOrderUserInfo(String username);


    /*카카오 로그인*/
    public String getReturnAccessToken(String code);
    public Map<String,Object> getUserInfo(String access_token);
    public UserVo kakaoLogin(Map<String, Object> result, String kakaoToken);
    public UserVo findUserIdBy2(String sns_id);
    public UserVo findUserByEmail(String email);





}
