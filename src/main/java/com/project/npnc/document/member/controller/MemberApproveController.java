package com.project.npnc.document.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amazonaws.services.s3.AmazonS3;
import com.project.npnc.document.model.service.MemberApproveService;
import com.project.npnc.security.dto.Member;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/document")
@RequiredArgsConstructor
@Slf4j 
public class MemberApproveController {
	private final MemberApproveService serv;
	
	//결재 승인
	@PostMapping("/approve")
	public ResponseEntity<Map<String,Object>> updateApproveDoc(
			@RequestBody Map<String, Object> requestBody,
			HttpSession session
			){
		log.debug("{}", requestBody);
		String html = (String) requestBody.get("html");
	    String msg = (String) requestBody.get("msg");
	    String serial = (String) requestBody.get("serial");
	    int no = Integer.parseInt((String) requestBody.get("no"));
	    int formNo = Integer.parseInt((String) requestBody.get("formNo"));
		log.debug("----- " + serial + "문서 결재 : " + msg + " -----");
		log.debug("html -> " + html);
		Map<String,Object> response = new HashMap<>();
		
		int result=0;
		try {
			String uploadDir = session.getServletContext().getRealPath("/upload/");
			result = serv.updateApproveDoc(no, serial, msg, formNo, html, uploadDir);
			if(result <=0) {
				response.put("status", "error");
				response.put("message", "문서 결재 실패");
			}else {
				response.put("status","success");
				response.put("message", "문서 결재 완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", "문서 결재 실패");
		}
		return ResponseEntity.ok(response);
	}
	//결재 반려
	@PostMapping("/reject")
	public ResponseEntity<Map<String,Object>> updateRejectDoc(
			@RequestBody Map<String, Object> requestBody
			){
		log.debug("{}", requestBody);
		String html = (String) requestBody.get("html");
		String msg = (String) requestBody.get("msg");
		String serial = (String) requestBody.get("serial");
		int no = Integer.parseInt((String) requestBody.get("no"));
		log.debug("----- " + serial + "문서 반려 : " + msg + " -----");
		log.debug("html -> " + html);
		Map<String,Object> response = new HashMap<>();
		
		int result=0;
		try {
			result = serv.updateRejectDoc(no, serial, msg);
			if(result <=0) {
				response.put("status", "error");
				response.put("message", "문서 결재 실패");
			}else {
				response.put("status","success");
				response.put("message", "문서 결재 완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", "문서 결재 실패");
		}
		return ResponseEntity.ok(response);
	}
	//결재 보류
	@PostMapping("/pend")
	public ResponseEntity<Map<String,Object>> updatePendDoc(
			@RequestBody Map<String, Object> requestBody
			){
		log.debug("{}", requestBody);
		String html = (String) requestBody.get("html");
		String msg = (String) requestBody.get("msg");
		String serial = (String) requestBody.get("serial");
		int no = Integer.parseInt((String) requestBody.get("no"));
		log.debug("----- " + serial + "문서 보류 : " + msg + " -----");
		log.debug("html -> " + html);
		Map<String,Object> response = new HashMap<>();
		
		int result=0;
		try {
			result = serv.updatePendDoc(no, serial, msg);
			if(result <=0) {
				response.put("status", "error");
				response.put("message", "문서 결재 실패");
			}else {
				response.put("status","success");
				response.put("message", "문서 결재 완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", "문서 결재 실패");
		}
		return ResponseEntity.ok(response);
	}
	
}
