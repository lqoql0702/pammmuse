package com.pammmuse.pammmuse.service;

import com.pammmuse.pammmuse.dto.UserVo;
import com.pammmuse.pammmuse.repository.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;

public interface UserService {

    public UserVo getUserById(Long id);

    public UserVo getUserByUsername(String username);

    public void signup(UserVo userVo);

    public void edit(UserVo userVo);
    public void withdraw(Long id);

    public PasswordEncoder passwordEncoder();
}
