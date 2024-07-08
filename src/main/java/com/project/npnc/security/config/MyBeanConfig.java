package com.project.npnc.security.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.fasterxml.jackson.databind.ObjectMapper;

@Configuration
@MapperScan("com.project.npnc.security.common.mappers")
public class MyBeanConfig {
	
	@Bean
	ObjectMapper getMapper() {
		return new ObjectMapper();
	}

}
