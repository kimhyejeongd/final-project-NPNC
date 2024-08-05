package com.project.npnc.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsUtils;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.project.npnc.security.CustomAuthenticationSuccessHandler;
import com.project.npnc.security.common.MyAuthority;
import com.project.npnc.security.controller.UserPasswordAuthencationProvider;

import lombok.RequiredArgsConstructor;

@Configuration //스프링 설정 클래스임을 나타냄 / sping이 이 클래스를 설정으로 사용하도록 지정
@EnableWebSecurity //spring security를 활성화, 이 어노테이션을 사용하면 웹 보안 구성이 가능해짐
@RequiredArgsConstructor
public class SecuirtyConfig{
	private final UserPasswordAuthencationProvider provider;
	private final CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler;
	
	@Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
	
	//SecurityFilterChain인터페이스를 반환하는 메소드를 bean
	@Bean //스프링 빈 등록, 반환된 객체를 스프링 컨텍승트에서 관리
	SecurityFilterChain authenticationFilter(HttpSecurity http) throws Exception { //SecurityFilterChain 설정
		CharacterEncodingFilter encodingFilter=new CharacterEncodingFilter("UTF-8",true);
		encodingFilter.setEncoding("UTF-8");
		return http 
					//iframe허용하는 설정
					.headers(header->header.frameOptions(frame->frame.sameOrigin()))
					.csrf(csrf -> csrf.disable()) //csfr보호 기능 비활성화, 개발 초기 단계나 특정 요구사항이 있을 때 사용됨(람다를 매개변수로 받음)
					.authorizeHttpRequests(request->request //()-> 요청에 대한 것을 처리
							.requestMatchers("/loginpage/**","/logout/**","/admin/documentForm/selectDoc/**").permitAll() 
							//사원
							.requestMatchers("/","/document/**","/calendar/**","/board/**","/overwork/**","/attendance/**","/notice/**","/external/**","/notehome","/sendNoteHome","/noteSendMe","/noteBookMark","/member/**"
									,"/chat","/organ","/schedule/**")
							.hasAnyAuthority(MyAuthority.PERSON.name(),MyAuthority.MANAGE.name(),MyAuthority.USER.name())
							.requestMatchers("/admin/personAdminMain/**") 
							.hasAnyAuthority(MyAuthority.PERSON.name())
							.requestMatchers("/admin/attendance/**","/admin/member/**") 
							.hasAnyAuthority(MyAuthority.PERSON.name(),MyAuthority.ADMIN.name())
							//경영
							.requestMatchers("/admin/manageAdminMain/**") 
							.hasAnyAuthority(MyAuthority.MANAGE.name())
							.requestMatchers("/admin/dept/**","/admin/job/**","/admin/vacation/**","/admin/reservation/**","/admin/documentForm/**","/admin/board/**","/admin/manageAdminMain/**","/admin/notice/**") 
							.hasAnyAuthority(MyAuthority.MANAGE.name(),MyAuthority.ADMIN.name())
							//관리자
							.requestMatchers("/admin/**") ///admin으로 시작하는 모든 경로에게 ADMIN권한을 가진 사용자만 접근 할 수 있게 함
							.hasAnyAuthority(MyAuthority.ADMIN.name())
							.requestMatchers("/*/**").permitAll()//루트 경로에 대한 모든 요청을 허용
							.requestMatchers(req->CorsUtils.isPreFlightRequest(req)).permitAll()
							.anyRequest().authenticated() // 위에 지정한 경로를 제외한 모든 요청에 대해 인증을 요구
							//.requestMatchers("/api/**","/boad/**").hasAnyAuthority(MyAuthority.USER.name()) //'/api/'로 시작하는 모든 경로에 대해 user 권한을 가진 사용자만 접근할 수 있게 함
					)
					.addFilterBefore(encodingFilter, UsernamePasswordAuthenticationFilter.class)
					.authenticationProvider(provider) //인증 제공자를 설정(실제 인증 로직을 구현한 클래스를 등록해야함) 
					.formLogin(form->form
							.loginPage("/loginpage")
							.loginProcessingUrl("/logincheck")
							.successHandler(customAuthenticationSuccessHandler) // 커스텀 성공 핸들러 설정
//							.defaultSuccessUrl("/")
							)
					.logout(logout->logout
							.logoutUrl("/logout")
							//.logoutSuccessUrl(null)
					)
//					.exceptionHandling(exception->exception //예외처리 설정을 정의함 ( 접근 거부 시 사용자 정의 예외 처리 핸들러를 설정)
//							.accessDeniedHandler(new ExceptionHandler()))
					.build();
				
					
	}
		
}
