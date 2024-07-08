package com.project.npnc.security.common;

import java.io.IOException;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ExceptionHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		request.setAttribute("msg", accessDeniedException.getMessage());
		request.setAttribute("loc", "/");
		request.getRequestDispatcher("/WEB-INF/views/msg.jsp")
		.forward(request, response);

	}

}
