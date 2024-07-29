package com.project.npnc.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.project.npnc.common.MultipartFileToDocFileConverter;


@Configuration
public class WebMVCConfig implements WebMvcConfigurer{

	
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/job/insertjob.do").setViewName("admin/job/insertjob");
		registry.addViewController("/loginpage").setViewName("Login");
		registry.addViewController("/admin/adminMain").setViewName("admin/adminMain");

	}
	
	@Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")  // 모든 경로에 대해 CORS 설정을 적용
                .allowedOrigins("*")  // 모든 출처에서의 요청 허용
                .allowedMethods("*");  // 모든 HTTP 메소드 허용
    }

	@Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(new MultipartFileToDocFileConverter());
    }
	
	
	/*
	 * @Override public void addInterceptors(InterceptorRegistry registry) {
	 * registry.addInterceptor(new LoginInterceptor()) .addPathPatterns("/**")
	 * .excludePathPatterns("/loginpage","/logincheck", "/resources/**",
	 * "/static/**", "/css/**", "/js/**", "/images/**"); // 정적 리소스 경로 제외 }
	 */
	
}
