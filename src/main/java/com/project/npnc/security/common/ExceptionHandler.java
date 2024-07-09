package com.project.npnc.security.common;

import java.io.IOException;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ExceptionHandler implements AccessDeniedHandler { //security에서 접근 거부가 발생했을 때 사용자 정의 처리를 제공하는 AccessDeniedHandler를 구현함/ 사용자가 접근 권한이 없는 자원에 접근하려고 할 때 호출됨

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		request.setAttribute("msg", accessDeniedException.getMessage());
		request.setAttribute("loc", "/");
		request.getRequestDispatcher("/WEB-INF/views/msg.jsp")
		.forward(request, response);

	}

}
