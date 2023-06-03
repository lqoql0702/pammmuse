package com.pammmuse.pammmuse.service;

import com.pammmuse.pammmuse.controller.MainController;
import com.pammmuse.pammmuse.model.UserVo;
import com.pammmuse.pammmuse.repository.UserMapper;
import org.apache.catalina.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class UserServiceImpl implements UserService{

    private static final Logger logger = LoggerFactory.getLogger(MainController.class);
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

    public String getReturnAccessToken(String code) {
        String access_token = "";
        String refresh_token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //HttpURLConnection 설정 값 셋팅
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);


            // buffer 스트림 객체 값 셋팅 후 요청
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=2ec9b40569d051b3dd40afa8bf9a0a9d");  //앱 KEY VALUE
            sb.append("&redirect_uri=http://ec2-3-37-36-176.ap-northeast-2.compute.amazonaws.com:8080/user/kakao/callback"); // 앱 CALLBACK 경로
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            //  RETURN 값 result 변수에 저장
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String br_line = "";
            String result = "";

            while ((br_line = br.readLine()) != null) {
                result += br_line;
            }

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);


            // 토큰 값 저장 및 리턴
            access_token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_token);
            System.out.println("refresh_token : " + refresh_token);
            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return access_token;
    }

    public Map<String,Object> getUserInfo(String access_token) {
        Map<String,Object> resultMap =new HashMap<>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");


            //요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String br_line = "";
            String result = "";

            while ((br_line = br.readLine()) != null) {
                result += br_line;
            }
            System.out.println("response:" + result);


            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String id = element.getAsJsonObject().get("id").getAsString();
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();

            resultMap.put("nickname", nickname);
            resultMap.put("id", id);
            resultMap.put("email", email);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return resultMap;
    }

    @Override
    public UserVo kakaoLogin(Map<String, Object> result, String kakaoToken){
        //카카오에서 받아온 사용자의 정보
        String sns_id = (String) result.get("id");
        String nickname = (String) result.get("nickname");
        String email = (String) result.get("email");

        //카카오 로그인을 통해 이미 회원가입한 회원인지 확인하기 위해 카카오ID를 통해 검색
        UserVo userVo = userMapper.kakaoSelect(sns_id);

        //중복된 사용자가 없다면(처음으로 카카오 로그인을 하는 경우 카카오에서 받은 정보를 통한 회원가입 진행)
        if(userVo == null) {
            UserVo sameEmailMember = userMapper.findUserByEmail(email);
            if(email.equals(sameEmailMember.getEmail())){
                //카카오로그인은 처음인데 이미 그냥 회원가입은 돼있는경우
                userVo = sameEmailMember;
                userVo.setSns_id(sns_id);    //이미 저장되어있는 회원 정보에 카카오 ID만 추가해서 다시 저장한다.
                userMapper.updateUser(userVo);     //기존 회원에 카카오 아이디만 추가해준다

            } else {
                String username = nickname;
                String password = sns_id + kakaoToken;
                userVo.setUsername(email);
                userVo.setName(username);
                userVo.setSns_id(sns_id);
                userVo.setEmail(email);
                userVo.setPassword(passwordEncoder.encode(password));
                userMapper.kakaoInsert(userVo);
            }
        }
        return userVo;
    }

    @Override
    public UserVo findUserIdBy2(String sns_id){
        return userMapper.findUserIdBy2(sns_id);
    }
    @Override
    public UserVo findUserByEmail(String email){
            return findUserByEmail(email);
        }

    /* 주문자 정보 */
    @Override
    public UserVo getOrderUserInfo(String username) {
        return userMapper.getOrderUserInfo(username);
    }
}