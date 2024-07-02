package com.project.npnc.admin.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.admin.member.model.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/member")
public class MemberController {
	
	private final MemberService service;
	
	
	
	
	
	
}
