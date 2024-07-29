/*
 * package com.project.npnc.interceptor;
 * 
 * import org.springframework.security.core.Authentication; import
 * org.springframework.security.core.context.SecurityContext; import
 * org.springframework.web.servlet.HandlerInterceptor;
 * 
 * import com.project.npnc.security.dto.Member;
 * 
 * import jakarta.servlet.http.HttpServletRequest; import
 * jakarta.servlet.http.HttpServletResponse; import
 * jakarta.servlet.http.HttpSession; import lombok.extern.slf4j.Slf4j;
 * 
 * 
 * @Slf4j public class LoginInterceptor implements HandlerInterceptor {
 * 
 * @Override public boolean preHandle(HttpServletRequest request,
 * HttpServletResponse response, Object handler) throws Exception {
 * 
 * HttpSession session = request.getSession(false); if(session!= null) {
 * SecurityContext context = (SecurityContext)
 * session.getAttribute("SPRING_SECURITY_CONTEXT"); if(context != null) {
 * Authentication auth = context.getAuthentication(); if(auth != null) { Member
 * member = (Member) auth.getPrincipal(); if(member == null) {
 * response.sendRedirect(request.getContextPath()+"/loginpage"); return false; }
 * } } }
 * 
 * 
 * return true; }
 * 
 * }
 */