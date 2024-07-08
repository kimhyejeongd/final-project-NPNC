package com.project.npnc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;


@SpringBootApplication
@EnableScheduling
public class NpncApplication{
	
	public static void main(String[] args) {
		SpringApplication.run(NpncApplication.class, args);
	}
	
}
 