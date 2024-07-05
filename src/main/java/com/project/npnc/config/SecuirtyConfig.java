package com.project.npnc.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration //스프링 설정 클래스임을 나타냄 / sping이 이 클래스를 설정으로 사용하도록 지정
@EnableWebSecurity //spring security를 활성화, 이 어노테이션을 사용하면 웹 보안 구성이 가능해짐

public class SecuirtyConfig {

		@Bean //스프링 빈 등록, 반환된 객체를 스프링 컨텍승트에서 관리
		SecurityFilterChain authenticationFilter(HttpSecurity http) throws Exception { //SecurityFilterChain 설정
			return http 
						.csrf(csft -> csft.disable()) //csfr보호 기능 비활성화, 개발 초기 단계나 특정 요구사항이 있을 때 사용됨(람다를 매개변수로 받음)
						.authorizeHttpRequests(request->request //()-> 요청에 대한 것을 처리
								.requestMatchers("/").permitAll()//루트 경로에 대한 모든 요청을 허용
								.requestMatchers("/api/**").hasAnyAuthority("user") //'/api/'로 시작하는 모든 경로에 대해 user 권한을 가진 사용자만 접근할 수 있게 함
								.anyRequest().authenticated() // 위에서 지정한 경로를 제외한 모든 요청에 대해 인증을 요구
						)
						.authenticationProvider(null) //인증 제공자를 설정(실제 인증 로직을 구현한 클래스를 등록해야함) null말고  실제 구현 필요
						.build();
					
						
		}
		
}
