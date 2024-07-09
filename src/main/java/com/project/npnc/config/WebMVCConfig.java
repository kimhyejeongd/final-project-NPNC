package com.project.npnc.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebMVCConfig implements WebMvcConfigurer{

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/job/insertjob.do").setViewName("admin/job/insertjob");
		registry.addViewController("/loginpage").setViewName("Login");
	}
	@Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")  // 모든 경로에 대해 CORS 설정을 적용
                .allowedOrigins("*")  // 모든 출처에서의 요청 허용
                .allowedMethods("*");  // 모든 HTTP 메소드 허용
    }

	
	
}
