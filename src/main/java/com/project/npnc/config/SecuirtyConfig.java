package com.project.npnc.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsUtils;

import com.project.npnc.security.common.ExceptionHandler;
import com.project.npnc.security.common.MyAuthority;
import com.project.npnc.security.controller.UserPasswordAuthencationProvider;

import lombok.RequiredArgsConstructor;

@Configuration //스프링 설정 클래스임을 나타냄 / sping이 이 클래스를 설정으로 사용하도록 지정
@EnableWebSecurity //spring security를 활성화, 이 어노테이션을 사용하면 웹 보안 구성이 가능해짐
@RequiredArgsConstructor
public class SecuirtyConfig {
	private final UserPasswordAuthencationProvider provider;
	//SecurityFilterChain인터페이스를 반환하는 메소드를 bean
	@Bean //스프링 빈 등록, 반환된 객체를 스프링 컨텍승트에서 관리
	SecurityFilterChain authenticationFilter(HttpSecurity http) throws Exception { //SecurityFilterChain 설정
		return http 
					.csrf(csrf -> csrf.disable()) //csfr보호 기능 비활성화, 개발 초기 단계나 특정 요구사항이 있을 때 사용됨(람다를 매개변수로 받음)
					.authorizeHttpRequests(request->request //()-> 요청에 대한 것을 처리
							.requestMatchers(req->CorsUtils.isPreFlightRequest(req)).permitAll()
							.requestMatchers("/loginpage","/WEB-INF/views/**").permitAll()//루트 경로에 대한 모든 요청을 허용
							//.requestMatchers("/api/**","/boad/**").hasAnyAuthority(MyAuthority.USER.name()) //'/api/'로 시작하는 모든 경로에 대해 user 권한을 가진 사용자만 접근할 수 있게 함
							.requestMatchers("/admin/**")
									.hasAnyAuthority(MyAuthority.ADMIN.name())
							.anyRequest().authenticated() // 위에서 지정한 경로를 제외한 모든 요청에 대해 인증을 요구
					)
					.authenticationProvider(provider) //인증 제공자를 설정(실제 인증 로직을 구현한 클래스를 등록해야함) 
					.formLogin(form->form
							.loginProcessingUrl("/loginpage")
							.loginPage("/loginpage")
							.successForwardUrl("/")
							)
					.logout(logout->logout
							.logoutUrl("/logout")
							//.logoutSuccessUrl(null)
					)
					.exceptionHandling(exception->exception
							.accessDeniedHandler(new ExceptionHandler()))
					.build();
				
					
	}
		
}