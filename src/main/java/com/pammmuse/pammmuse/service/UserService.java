package com.pammmuse.pammmuse.service;

import com.pammmuse.pammmuse.dto.UserVo;
import com.pammmuse.pammmuse.repository.UserMapper;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;
import java.util.Map;

public interface UserService {

    public UserVo getUserById(Long id);
    public UserVo getUserByUsername(String username);
    public void signup(UserVo userVo);
    public void edit(UserVo userVo);
    public void withdraw(Long id);
    public PasswordEncoder passwordEncoder();

    /*카카오 로그인*/
    public String getReturnAccessToken(String code);
    public Map<String,Object> getUserInfo(String access_token);
    public void kakaoJoin(UserVo userVo);
    public UserVo kakaoLogin(String sns_id);
//    public String findUserIdBy2(String sns_id);





}
