package com.project.npnc.aws.s3.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

@Configuration
public class S3Config {
	//채팅 관련 저장
    @Value("${cloud.aws.credentials.accessKey}")
    private String accessKey;
    @Value("${cloud.aws.credentials.secretKey}")
    private String secretKey;
    @Value("${cloud.aws.s3.bucketName}")
    private String bucketName;
    @Value("${cloud.aws.region.static}")
    private String region;
    
    //문서 관련 저장
    @Value("${cloud.aws.credentials.accessKeyForDoc}")
    private String accessKeyForDoc;
    @Value("${cloud.aws.credentials.secretKeyForDoc}")
    private String secretKeyForDoc;
    @Value("${cloud.aws.s3.bucketNameForDoc}")
    private String bucketNameForDoc;
    @Value("${cloud.aws.region.staticForDoc}")
    private String regionForDoc;
    
    @Bean(name = "amazonS3")
    public AmazonS3 s3Builder() {
        AWSCredentials basicAWSCredentials = new BasicAWSCredentials(accessKey, secretKey);

        return AmazonS3ClientBuilder.standard()
                .withCredentials(new AWSStaticCredentialsProvider(basicAWSCredentials))
                .withRegion(region).build();
    }
    @Bean(name = "s3ForDoc")
    public AmazonS3 s3BuilderForDoc() {
    	AWSCredentials basicAWSCredentials = new BasicAWSCredentials(accessKeyForDoc, secretKeyForDoc);
    	
    	return AmazonS3ClientBuilder.standard()
    			.withCredentials(new AWSStaticCredentialsProvider(basicAWSCredentials))
    			.withRegion(regionForDoc).build();
    }
}