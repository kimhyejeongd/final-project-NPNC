package com.project.npnc.security.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SecurityController {
	@RequestMapping("/loginsuccess") //로그인 성공 시 
	public String loginsuccess() {
		log.debug("로그인성공");
		//로그인한 정보를 가져오기 
		Object o=SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //Authentication :인증 , 인증받은 정보를 authentication을 가지고 객체를 가지고 반환(getPrin.. : 반환해줌)
		log.debug("{}",o); //id, password 등 확인이 가능함 -> db에 있는 멤버를 가져올때 사용할 수있음 
		return "redirect:/"; // 로그인 성공 시 메인으로 이동 
	}
	@RequestMapping("/loginfail") //로그인 실패 시 
	public String loginFail(Model m) {
		m.addAttribute("msg","로그인 실패!");
		m.addAttribute("loc","/loginpage");
		//추가적으로 로그인실패시 추가할 로직 넣을 수 있음
		return "common/msg";
	}
}
