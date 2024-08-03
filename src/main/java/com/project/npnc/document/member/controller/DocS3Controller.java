package com.project.npnc.document.member.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.PutObjectResult;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.project.npnc.document.model.dto.DocFile;
import com.project.npnc.document.model.service.MemberDocumentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@RequestMapping("/document")
@Controller
public class DocS3Controller {
	@Qualifier("s3ForDoc")
	private final AmazonS3 s3ForDoc;
	@Value("${cloud.aws.s3.bucketNameForDoc}")
    private String bucketName;
	
	//문서 html 업로드 메소드
	public int docHtmlUpload(String dir, String filename, String content) throws IOException {
		// 파일명 및 경로 정의
        String key = dir + "/" + filename + ".html";
        log.debug("업로드 -> " + key);
        
        // 임시 파일을 생성하여 S3에 업로드
        File tempFile = File.createTempFile("temp-file-", ".html");
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {
            writer.write(content);
        }
        
        // S3에 업로드
        try {
            PutObjectRequest request = new PutObjectRequest(bucketName, key, tempFile);
            PutObjectResult result = s3ForDoc.putObject(request);
            tempFile.delete();  // 업로드 후 임시 파일 삭제
            return 1;  // 성공
        } catch (Exception e) {
            e.printStackTrace();
            return 0;  // 실패
        }
	}
	
	// S3에서 HTML 파일 읽기
    public String readHtmlFile(String dir, String filename) {
        String key = dir + "/" + filename;
        log.debug("파일 html 읽기 -> " + key);
        StringBuilder content = new StringBuilder();

        try (S3Object s3Object = s3ForDoc.getObject(bucketName, key);
             S3ObjectInputStream s3InputStream = s3Object.getObjectContent();
             BufferedReader br = new BufferedReader(
                     new InputStreamReader(s3InputStream, StandardCharsets.UTF_8))) {
            String line;
            while ((line = br.readLine()) != null) {
                content.append(line).append("\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return content.toString();
    }
	
	//파일 업로드
	public int uploadBinaryFile(String dir, String filename, InputStream fileInputStream) throws IOException {
	    // 파일명 및 경로 정의
	    String key = dir + "/" + filename;
	    log.debug("업로드 -> " + key);

	    try {
	        // S3에 업로드
	        PutObjectRequest request = new PutObjectRequest(bucketName, key, fileInputStream, new ObjectMetadata());
	        PutObjectResult result = s3ForDoc.putObject(request);
	        return 1;  // 성공
	    } catch (Exception e) {
	        e.printStackTrace();
	        return 0;  // 실패
	    }
	}
	
	//파일 다운로드
	@GetMapping("/files/download/{filename:.+}")
    public ResponseEntity<Resource> downloadFile(
    		@PathVariable String filename,
    		HttpServletRequest request,
    		HttpSession session) {

		log.debug("----- 파일 다운로드 -----");
		//파일 원본 이름 추출
		String oriname = filename.substring(filename.indexOf('_') + 1);
		
        try {
        	
        	// S3에서 객체 가져오기
            S3Object s3Object = s3ForDoc.getObject(bucketName, "upload/docfile/" + filename);
            S3ObjectInputStream s3InputStream = s3Object.getObjectContent();

            // 파일의 콘텐츠 타입 추출 (옵션: 필요시)
            String contentType = s3Object.getObjectMetadata().getContentType();
            
            // 파일 인코딩
            String encodedFilename = URLEncoder.encode(oriname, "UTF-8").replaceAll("\\+", "%20");

            // ResponseEntity 생성
            Resource resource = new InputStreamResource(s3InputStream);
            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=UTF-8''" + encodedFilename)
                    .header(HttpHeaders.CONTENT_TYPE, contentType)
                    .body(resource);
            
        } catch (UnsupportedEncodingException e) {
            log.error("파일 이름 인코딩 오류: " + e.getMessage(), e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        } catch (Exception e) {
            log.error("파일 다운로드 오류: " + e.getMessage(), e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
	 }
	
	//파일 자세히보기
		@GetMapping("/files/detail/{filename:.+}")
		@ResponseBody
		public ResponseEntity<Map<String, Object>> getFileDetail(
				@PathVariable String filename) {
			log.debug("파일 자세히보기 요청 -> " + filename);
			try {
				
				// 인코딩된 파일 이름 디코딩
		        String decodedFileName = URLDecoder.decode(filename, StandardCharsets.UTF_8.toString());
		        
		        // 파일 정보를 S3에서 가져오는 로직을 구현합니다.
		        S3Object s3Object = s3ForDoc.getObject(new GetObjectRequest(bucketName, "upload/docfile/" + decodedFileName));
		        ObjectMetadata metadata = s3Object.getObjectMetadata();

		        // 파일 정보 생성
		        Map<String, Object> fileInfo = new HashMap<>();
		        fileInfo.put("fileOriName", decodedFileName);
		        fileInfo.put("fileSize", metadata.getContentLength());
		        fileInfo.put("fileUploadDate", metadata.getLastModified());
		        return ResponseEntity.ok(fileInfo);
		        
		    } catch (UnsupportedEncodingException e) {
		        log.error("Error decoding filename: ", e);
		        return ResponseEntity.status(500).build();
		    }
		}
	
	//파일 삭제 메소드
	public int fileRemove(String dir, String title) throws IOException {
		String key = dir + "/" +title;
		log.debug("문서 경로 : " + key);
		
		try {
	        // 파일 삭제 요청
	        s3ForDoc.deleteObject(new DeleteObjectRequest(bucketName, key));
	        log.debug("파일 삭제 성공: " + key);
	        return 1; // 성공
	    } catch (AmazonServiceException e) {
	    	// 객체가 존재하지 않으면 성공으로 간주
            if (e.getStatusCode() == 404) {
                log.debug("파일이 존재하지 않음 (404 Not Found): " + key);
                return 1; 
            }
	        log.error("AWS S3 서비스 예외 발생: " + e.getMessage());
	        return 0; 
	    } catch (SdkClientException e) {
	        log.error("AWS SDK 클라이언트 예외 발생: " + e.getMessage());
	        return 0; 
	    }
	}
}
