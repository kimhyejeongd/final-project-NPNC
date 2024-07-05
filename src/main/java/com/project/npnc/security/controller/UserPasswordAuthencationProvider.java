package com.project.npnc.security.controller;

import org.springframework.stereotype.Component;

@Component//자바 bean에 등록하라고 알려줌

public class UserPasswordAuthencationProvider implements AuthencationProvider{
	private final MemberMapper mapper;
	private BVryptPaasswordEncoder pwencoder=new BCryptPasswordEncoder();
	
	@Override
}
