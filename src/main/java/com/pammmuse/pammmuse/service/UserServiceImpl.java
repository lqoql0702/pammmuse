package com.pammmuse.pammmuse.service;

import com.pammmuse.pammmuse.dto.UserVo;
import com.pammmuse.pammmuse.repository.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;

    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();//비밀번호 인코딩, 일치여부 확인

    public UserVo getUserById(Long id) {
        return userMapper.getUserById(id);
    }

    public UserVo getUserByUsername(String username) {
        return userMapper.getUserByUserName(username);
    }

    public void signup(UserVo userVo) { // 회원 가입
        if (!userVo.getUsername().equals("") && !userVo.getEmail().equals("")) {
            // password는 암호화해서 DB에 저장
            userVo.setPassword(passwordEncoder.encode(userVo.getPassword()));
            userMapper.insertUser(userVo);
        }
    }

    public void edit(UserVo userVo) { // 회원 정보 수정
        // password는 암호화해서 DB에 저장
        userVo.setPassword(passwordEncoder.encode(userVo.getPassword()));
        userMapper.updateUser(userVo);
    }

    public void withdraw(Long id) { // 회원 탈퇴
        userMapper.deleteUser(id);
    }

    public PasswordEncoder passwordEncoder() {
        return this.passwordEncoder;
    }
}