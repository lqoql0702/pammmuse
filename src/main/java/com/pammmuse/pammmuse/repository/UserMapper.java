package com.pammmuse.pammmuse.repository;

import com.pammmuse.pammmuse.dto.UserVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    void insertUser(UserVo userVo); // 회원 가입
    UserVo getUserByUserName(String usename); // 회원 정보 가져오기
    UserVo getUserById(Long id);
    void updateUser(UserVo userVo); // 회원 정보 수정
    void deleteUser(Long id); // 회원 탈퇴
}
