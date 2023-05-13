package com.pammmuse.pammmuse.controller;

import com.pammmuse.pammmuse.model.UserVo;
import com.pammmuse.pammmuse.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @GetMapping("/")
    public String home(Model model) { // 인증된 사용자의 정보를 보여줌
        Long id = (Long) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        // token에 저장되어 있는 인증된 사용자의 id 값

        UserVo userVo = userService.getUserById(id);
        userVo.setPassword(null); // password는 보이지 않도록 null로 설정
        model.addAttribute("user", userVo);
        return "main";
    }

    @GetMapping("/user/mypage")
    public void myPage(Model model) { // 인증된 사용자의 정보를 보여줌
        Long id = (Long) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        // token에 저장되어 있는 인증된 사용자의 id 값

        UserVo userVo = userService.getUserById(id);
        userVo.setPassword(null); // password는 보이지 않도록 null로 설정
        model.addAttribute("user", userVo);
    }


    @GetMapping("/user/login")
    public String loginPage() { // 로그인되지 않은 상태이면 로그인 페이지를, 로그인된 상태이면 home 페이지를 보여줌
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof AnonymousAuthenticationToken)
            return "/user/login";
        return "/";
    }

    @GetMapping("/user/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response){

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if(authentication != null){
            new SecurityContextLogoutHandler().logout(request,response,authentication);
        }

        return "main";
    }

    @GetMapping("/user/signup")
    public String signupPage() {  // 회원 가입 페이지
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof AnonymousAuthenticationToken)
            return "/user/signup";

        return "redirect:/";
    }

    @PostMapping("/user/signup")
    public String signup(UserVo userVo) { // 회원 가입
        try {
            userService.signup(userVo);
        } catch (DuplicateKeyException e) {
            return "redirect:/signup?error_code=-1";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/signup?error_code=-99";
        }
        return "redirect:/user/login";
    }

    @GetMapping("/user/update")
    public String editPage(Model model) { // 회원 정보 수정 페이지
        Long id = (Long) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserVo userVo = userService.getUserById(id);
        model.addAttribute("user", userVo);
        return "/user/edit";
    }

    @PostMapping("/user/update")
    public String edit(UserVo userVo) { // 회원 정보 수정
        Long id = (Long) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        userVo.setId(id);
        userService.edit(userVo);
        return "redirect:/";
    }

    @PostMapping("/user/delete")
    public String withdraw(HttpSession session) { // 회원 탈퇴
        Long id = (Long) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (id != null) {
            userService.withdraw(id);
        }
        SecurityContextHolder.clearContext(); // SecurityContextHolder에 남아있는 token 삭제
        return "redirect:/";
    }

    @GetMapping("/user/kakao/callback")
    public String kakaoLogin(@RequestParam String code) throws IOException {
        // 접속토큰 get
        String kakaoToken = userService.getReturnAccessToken(code);
        logger.info("token"+kakaoToken);

        // 접속자 정보 get
        Map<String, Object> result = userService.getUserInfo(kakaoToken);

        String sns_id = (String) result.get("id");
        String username = (String) result.get("nickname");
        String email = (String) result.get("email");
        String userpw = sns_id;

        UserVo userVo = new UserVo();
        logger.info("snsid" + userService.kakaoLogin(sns_id));
        //일치하는 sns_id 없을 시 회원가입
        if(userService.kakaoLogin(sns_id) == null){
            userVo.setUsername(email);
            userVo.setPassword(userpw);
            userVo.setName(username);
            userVo.setSns_id(sns_id);
            userVo.setEmail(email);
            userService.kakaoJoin(userVo);
        }
        userService.kakaoLogin(sns_id);
        logger.info("snsid" + userService.kakaoLogin(sns_id));
        return "redirect:/";
    }
}
