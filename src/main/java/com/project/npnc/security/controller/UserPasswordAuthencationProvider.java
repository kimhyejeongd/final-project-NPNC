package com.project.npnc.security.controller;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.project.npnc.security.common.mappers.MemberMapper;
import com.project.npnc.security.dto.Member;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import lombok.RequiredArgsConstructor;

@Component//자바 bean에 등록하라고 알려줌
@RequiredArgsConstructor
public class UserPasswordAuthencationProvider implements AuthenticationProvider{
	private final MemberMapper mapper;
	private BCryptPasswordEncoder pwencoder=new BCryptPasswordEncoder();
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		//아이디 패스워드의 값을 authentication이 가지고 있음
		String userId=authentication.getName(); //아이디 들어옴
		String password=(String)authentication.getCredentials();
		System.out.println(userId);
		System.out.println(password);
		System.out.println();
		Member loginMember=mapper.selectMemberById(userId);
		System.out.println(loginMember);
		//if(loginMember!=null&&pwencoder.matches(password, loginMember.getPassword())) {
		if(loginMember!=null&&password.equals(loginMember.getPassword())) {
			System.out.println("이우석");
			
			return new UsernamePasswordAuthenticationToken(loginMember,loginMember.getPassword(),loginMember.getAuthorities());
			
		}else {
			throw new BadCredentialsException("인증실패");
		}
	}
	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class
					.isAssignableFrom(authentication);
	}

}
