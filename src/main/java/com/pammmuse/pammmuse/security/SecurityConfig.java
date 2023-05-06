package com.pammmuse.pammmuse.security;

import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        // 권한에 따라 허용하는 url 설정
        http
                .authorizeRequests()
                .antMatchers("/user/mypage","/user/edit").authenticated()
                .anyRequest().permitAll();

        // login 설정
        http
                .formLogin()
                .loginPage("/user/login")    // GET 요청 (login form을 보여줌)
                .loginProcessingUrl("/auth")    // POST 요청 (login 창에 입력한 데이터를 처리)
                .passwordParameter("password")	// login에 필요한 password 값을 password(default)로 설정
                .defaultSuccessUrl("/");   // login에 성공하면 /로 redirect


        // logout 설정
        http
                .logout()
                .logoutUrl("/user/logout")
                .logoutSuccessUrl("/main");	// logout에 성공하면 /로 redirect

        return http.build();
    }
}
