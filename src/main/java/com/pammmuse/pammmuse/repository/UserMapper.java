package com.pammmuse.pammmuse.repository;

import com.pammmuse.pammmuse.dto.UserVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import java.util.List;

@Mapper
public interface UserMapper {
    void insertUser(UserVo userVo); // 회원 가입
    UserVo getUserByUserName(String usename); // 회원 정보 가져오기
    UserVo getUserById(Long id);
    void updateUser(UserVo userVo); // 회원 정보 수정
    void deleteUser(Long id); // 회원 탈퇴

    /* 카카오 로그인 */

    // 카카오 회원가입
    void kakaoInsert(UserVo userVo);

    //snsId로 회원정보얻기
    UserVo kakaoSelect(String sns_id);

    //snsId로 회원 아이디찾기
    String findUserIdBy2(String sns_id);


}
