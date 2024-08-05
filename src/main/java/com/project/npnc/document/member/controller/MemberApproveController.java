package com.project.npnc.document.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.npnc.document.model.dto.Approver;
import com.project.npnc.document.model.service.MemberApproveService;
import com.project.npnc.document.model.service.MemberDocumentService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/document")
@RequiredArgsConstructor
@Slf4j 
public class MemberApproveController {
	private final MemberApproveService serv;
	private final MemberDocumentService docServ;
	
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
			result = serv.updateApproveDoc(no, serial, msg, formNo, html);
			if(result <=0) {
				response.put("status", "error");
				response.put("message", "문서 결재 실패");
			}else {
				response.put("status","success");
				response.put("message", "문서 결재 완료");
				
				//전체 결재라인
				List<Approver> approvers = serv.selectDocApprovers(serial);
				
				//현재 결재자
				Approver me = approvers.stream()
						.filter(e-> {
							log.debug("Approver memberKey: " + e.getMemberKey() + ", no: " + no);
					        return e.getMemberKey() == no;	
						})
						.findFirst()
						.orElse(null);
				
				//다음 결재자 찾기
				Approver nextAprover = null;
				
				for (Approver approver : approvers) {
					log.debug("approver : orderby" + approver.getOrderby());
				    if ((me.getOrderby()+1) == approver.getOrderby()) {
				    	log.debug("다음 결재자 있음");
				        nextAprover = approver;
				        break; // 조건을 만족하는 첫 번째 객체를 찾으면 루프 종료
				    }
				}
				// 다음 결재자가 없는 최종 결재 승인 진행 중인 경우
				if (nextAprover == null) {
				    log.debug("다음 결재자 없음, 최종 결재 승인 진행 중");
				    // 참조인 정보 전달
				    response.put("referer", docServ.selectReferer(serial));
				}
				//다음 결재자 정보 전달
				response.put("nextAprover", nextAprover);
				
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
			result = serv.updateRejectDoc(no, serial, msg, html);
			if(result <=0) {
				response.put("status", "error");
				response.put("message", "문서 결재 실패");
			}else {
				response.put("status","success");
				response.put("message", "문서 결재 완료");
				
				//최종 알림 발송
				
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
