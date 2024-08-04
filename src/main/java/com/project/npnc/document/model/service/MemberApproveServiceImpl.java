package com.project.npnc.document.model.service;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.npnc.alarm.AlarmWebsocketController;
import com.project.npnc.alarm.dto.AlarmMessage;
import com.project.npnc.document.member.controller.DocHtmlController;
import com.project.npnc.document.member.controller.DocS3Controller;
import com.project.npnc.document.model.dao.MemberDocumentDao;
import com.project.npnc.document.model.dto.Approver;
import com.project.npnc.document.model.dto.Document;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Service
@RequiredArgsConstructor
@Slf4j
public class MemberApproveServiceImpl implements MemberApproveService {
	private final SqlSession session;
	private final MemberDocumentDao dao;
	private final MemberDocumentService serv;
	private final DocS3Controller scCon;
	private final AlarmWebsocketController alarm;
	
	//결재 : 승인
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateApproveDoc(int memberKey, String serial, String msg, int formNo, String html) 
			throws Exception {
		int result = 0;
		int lastApCk = 0;
		
		try {
			
			//결재 상태 변경
			result = dao.updateApprovalState(session, serial, memberKey, msg, "승인");
			if(result <= 0) {
				throw new Exception("결재 상태 승인으로 변경 실패");
			}
			log.debug("결재 상태 -> 승인");
			
			//결재자 정보 조회
			Approver p = dao.selectApproverByKey(session, memberKey, serial);

			//문서 파일 내 결재라인 업데이트
			String newhtml = DocHtmlController.updateApproverTableHtmlForApprove(html, p);
			result = scCon.docHtmlUpload("upload/dochtml",serial, newhtml);
			if(result <= 0) {
				throw new Exception("문서 html 업데이트 실패");
			}
			log.debug("문서 html 업데이트 성공");
			
			//마지막 결재자인지 확인
			lastApCk = lastApproverCk(memberKey, serial);
			
			//마지막 결재자 승인일 때 문서 처리 완료 등록
			if(lastApCk > 0) {
				result = dao.updateDocStatefinalize(session, serial);
				if(result <= 0) {
					throw new Exception("문서 상태 처리완료로 변경 실패");
				}
				log.debug("문서 상태 -> 처리 완료");
				
				switch(formNo) {
				case 2:
					//추가근무 문서라면 승인상태 적용
					result = serv.updateOvertiemApply(serial, "승인");
					if(result <= 0) throw new Exception("추가근무 신청 상태 승인으로 변경 실패");
					log.debug("추가근무 신청 상태 -> 승인");
					break;
				case 3:
					//휴가 문서라면 승인상태 적용
					result = serv.updateVacationApply(serial, "승인");
					if(result <= 0) throw new Exception("휴가 신청 상태 승인으로 변경 실패");
					log.debug("휴가 신청 상태 -> 승인");
					
					//차감 진행
					result = dao.updateVacationCalc(session, memberKey, serial);
					if(result <= 0) throw new Exception("휴가 차감 실패");
					log.debug("휴가 차감 성공");
					break;
				}
				
				//승인 완료 알람 발송
				log.debug("----- 승인 완료 알람 발송 -----");
				int writerKey = dao.selecetDocWriter(session, serial);
				AlarmMessage a = AlarmMessage.builder()
							.alarmType("DocComplete")
							.alarmPath("document/list/employee/complete")
							.alarmReMember(writerKey) //글 작성자
							.alarmSendMember(0)
							.docSerialKey(serial)
							.build();
				log.debug(a.toString());
				alarm.test(writerKey, a);
				
			}
		}catch(Exception e) {
			log.error("문서 결재 처리 중 예외 발생: ", e);
			throw e;
		}
		return result;
	}

	//결재 : 반려
	@Override
	@Transactional
	public int updateRejectDoc(int memberKey, String serial, String msg, String html) throws Exception {
		int result = 0;
		
		try {
			
			//결재 상태 변경
			result = dao.updateApprovalState(session, serial, memberKey, msg, "반려");
			if(result <= 0) {
				throw new Exception("결재 상태 반려로 변경 실패");
			}
			log.debug("결재 상태 -> 반려(문서 종결)");
			
			result = dao.updateDocStateReject(session, serial);
			if(result <= 0) {
				throw new Exception("문서 상태 반려로 변경 실패");
			}
			log.debug("문서 상태 -> 반려");
			
			//결재자 정보 조회
			Approver p = dao.selectApproverByKey(session, memberKey, serial);
			
			//문서 파일 내 결재라인 업데이트
			String newhtml = DocHtmlController.updateApproverTableHtmlForReject(html, p);
			result = scCon.docHtmlUpload("upload/dochtml",serial, newhtml);
			if(result <= 0) {
				throw new Exception("문서 html 업데이트 실패");
			}
			log.debug("문서 html 업데이트 성공");
			
		}catch(Exception e) {
			log.error("문서 결재 처리 중 예외 발생: ", e);
			throw e;
		}
		return result;
	}
	//결재 : 보류
	@Override
	@Transactional
	public int updatePendDoc(int memberKey, String serial, String msg) throws Exception {
		int result = 0;
		
		try {
			
			//결재 상태 변경
			result = dao.updateApprovalState(session, serial, memberKey, msg, "보류");
			if(result <= 0) {
				throw new Exception("결재 상태 보류로 변경 실패");
			}
			log.debug("결재 상태 -> 보류");
			
			
		}catch(Exception e) {
			log.error("문서 결재 처리 중 예외 발생: ", e);
			throw e;
		}
		return result;
	}


	@Override
	public List<Approver> selectDocApprovers(String serial){
		log.debug("----- "+ serial + " 문서 전체 결재자 조회 -----");
		return dao.selectDocApprovers(session, serial);
	}
	
	
	@Transactional(rollbackFor = Exception.class)
	public int lastApproverCk(int memberKey, String serial) throws Exception {
		//문서 결재자 정보 조회
		try {
			List<Approver> apList = selectDocApprovers(serial);
			if(apList == null || apList.isEmpty()) {
				throw new Exception("결재자 조회 실패");
			}
			log.debug("결재자 -> " + apList.toString());
			
			//마지막 결재자 탐색
			Optional<Approver> lastAp = apList.stream().max((ap1, ap2) -> 
											Integer.compare(ap1.getOrderby(), ap2.getOrderby()));
//										.filter(ap -> ap.getOrderby() == apList.size())
//										.findFirst();
			log.debug(lastAp.toString());
			//체크
			if(lastAp.isPresent() && lastAp.get().getMemberKey() == memberKey) {
				log.debug("마지막 결재자입니다.(" + lastAp.toString() + ")");
				return 1;
			}else {
				return 0;
			}
		}catch(Exception e) {
			log.error("문서 결재 처리 중 예외 발생: ", e);
			throw e;
		}
		
	}

	@Override
	public Document selectInprocessDocApproveNow(int docId) {
		return dao.selectInprocessDocApproveNow(session, docId);
	}
}
