package com.project.npnc.config;

import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.w3c.dom.views.AbstractView;


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

	
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 문서 기안 요청을 클래스패스(static)의 /uploads/dochtml 디렉토리로 매핑
        registry.addResourceHandler("/document/writeend/**")
                .addResourceLocations("classpath:/static/uploads/dochtml/");
    }
}
