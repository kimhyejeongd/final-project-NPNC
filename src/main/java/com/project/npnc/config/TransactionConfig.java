package com.project.npnc.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableTransactionManagement
@RequiredArgsConstructor
public class TransactionConfig implements TransactionManagementConfigurer {
	private final DataSource dataSource;
	
	//전자결재 트랜잭션을 위해 생성, 함께 활용해도 됨
    @Bean
    PlatformTransactionManager transactionManager() {
        return new DataSourceTransactionManager(dataSource);
    }
	
	@Override
	public TransactionManager annotationDrivenTransactionManager() {
		return transactionManager();
	}

}
