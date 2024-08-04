package com.project.npnc.security;

import java.io.IOException;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.project.npnc.security.dto.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		Member loginMem=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("로그인 테스트 : "+loginMem.getAccessKey() );
		if (loginMem != null && loginMem.getAccessKey()==1) {
            response.sendRedirect("/"+request.getContextPath()+"/admin/adminMain");
        } else {
            response.sendRedirect("/"+request.getContextPath());
        }
	}

}
