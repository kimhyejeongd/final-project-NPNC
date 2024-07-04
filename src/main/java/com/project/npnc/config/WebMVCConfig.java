package com.project.npnc.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebMVCConfig implements WebMvcConfigurer{

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("admin/job/insertjob.do").setViewName("admin/job/insertjob");
		registry.addViewController("admin/member/insertmember.do").setViewName("admin/member/insertmember");
	}

	
	
}
