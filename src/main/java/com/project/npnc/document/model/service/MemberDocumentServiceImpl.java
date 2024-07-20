package com.project.npnc.document.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.npnc.document.model.dao.MemberDocumentDaoImpl;
import com.project.npnc.document.model.dto.Approver;
import com.project.npnc.document.model.dto.ApproverLine;
import com.project.npnc.document.model.dto.ApproverLineStorage;
import com.project.npnc.document.model.dto.Document;
import com.project.npnc.document.model.dto.DocumentForm;
import com.project.npnc.document.model.dto.DocumentFormFolder;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberDocumentServiceImpl implements MemberDocumentService {
	private final SqlSession session;
	private final MemberDocumentDaoImpl dao;
	@Override
	public List<DocumentFormFolder> selectformFolders() {
		return dao.selectformFolders(session);
	}
	@Override
	public List<DocumentForm> selectForms(int no) {
		return dao.selectForms(session, no);
	}
	@Override
	public List<DocumentForm> selectFormsBySearch(String target) {
		return dao.selectFormsBySearch(session, target);
	}
	@Override
	public DocumentForm selectFormByNo(int no) {
		return dao.selectFormByNo(session, no);
	}
	@Override
	public List<Document> selectInprocessDocs(int no) {
		return dao.selectInprocessDocs(session, no);
	}
	@Override
	public List<Document> selectWaitingDocs(int no) {
	    List<Document> result = dao.selectWaitingDocs(session, no);
//	     Document 리스트에서 본인이 이미 승인한 결과 제거
	    result.removeIf(doc -> doc.getApprovers().stream()
	                        .anyMatch(approver -> 
                    		approver.getMemberKey() == no && approver.getState().equals("승인")));
	    return result;
	}

	@Override
	public List<Document> selectRetrieveDocs(int no) {
		return dao.selectRetrieveDocs(session, no);
	}
//	@Override
//	@Transactional	
//	public int insertDoc(Document d, ApproversList request, RefererList referers) throws Exception {
//		int result = dao.insertDoc(session, d); //문서 등록
//		if(result>0) {
//			log.debug("[1]문서 insert 성공 : " + d.getErDocKey());
//			request.getApprovers().forEach(e->{
//				e.setErDocSerialKey(d.getErDocSerialKey()); //등록된 문서키 정보로 넘겨주기
//			});
//			result=dao.insertApproval(session, request); //결재자 등록
////			result=dao.insertApproval(session, request); //결재자 등록
//			if(result>0) {
//				log.debug("[2] 결재자 insert 성공");
//				if(referers != null) {
//					referers.getReferers().forEach(e->{
//						e.setErDocSerialKey(d.getErDocSerialKey()); //등록된 문서키 정보로 넘겨주기
//					});
////					result = dao.insertReferer(session, referers);
//					if(result>0) {
//						log.debug("[3] 참조인 insert 성공");
//					}else if(result<=0) {
//						throw new Exception("[3] 참조인 insert 실패");
//					}
//				}else if(referers == null) {
//					log.debug("[3] 참조인 없음");
//				} 
//			}else {
//				log.debug("[2] 결재자 insert 실패");
//				throw new Exception("[2] 결재자 insert 실패");
//			}
//		}else {
//			log.debug("[1]문서 insert 실패");
//			throw new Exception("[1]문서 insert 실패");
//		}
//		return result;
//	}
	@Override
	@Transactional	
	public int insertDoc(Document d) throws Exception {
		int result = dao.insertDoc(session, d); //문서 등록
		if(result>0) {
			log.debug("[1]문서 insert 성공 : " + d.getErDocKey());
			d.getApprovers().forEach(e->{
				e.setErDocSerialKey(d.getErDocSerialKey()); //등록된 문서키 정보로 넘겨주기
			});
			d.setErDocFilename(d.getErDocSerialKey()+".html"); //문서파일명 설정
			//문서파일 등록
			String erDocSerialKey = d.getErDocSerialKey();
			result = session.update("document.updateDocFilename", erDocSerialKey);
			if(result>0) {
				log.debug("[1]문서.html 등록 성공");
				result=dao.insertApproval(session, d.getApprovers()); //결재자 등록
				if(result>0) {
					log.debug("[2] 결재자 insert 성공");
					if(d.getReferers().size()>0) {
						d.getReferers().forEach(e->{
							e.setErDocSerialKey(d.getErDocSerialKey()); //등록된 문서키 정보로 넘겨주기
						});
						result = dao.insertReferer(session, d.getReferers());
						if(result>0) {
							log.debug("[3] 참조인 insert 성공");
						}else if(result<=0) {
							throw new Exception("[3] 참조인 insert 실패");
						}
					}else {
						log.debug("[3] 참조인 없음");
					} 
				}else {
					log.debug("[2] 결재자 insert 실패");
					throw new Exception("[2] 결재자 insert 실패");
				}
			}else {
				throw new Exception("[1]문서.html 등록 실패");
			}
			
		}else {
			log.debug("[1]문서 insert 실패");
			throw new Exception("[1]문서 insert 실패");
		}
		return result;
	}
	@Override
	@Transactional	
	public int retrieveDoc(String docKey) throws Exception {
		int result = dao.retrieveDoc(session, docKey); //전자문서 테이블 상태변경
		if(result>0) {
			log.debug("[1]문서 회수 완료");
//			//첨부파일 있는지 확인
			int fileCk = dao.selectDocFile(session, docKey);
			if(fileCk > 0) {
				//첨부파일 상태 
				log.debug("첨부파일 있음");
				result = dao.deleteDocFile(session, docKey);
				if(result>0) {
					log.debug("[2]첨부파일 삭제 완료");
				}else {
					throw new Exception("[2]첨부파일 삭제 실패");
				}
			}else {
				log.debug("첨부파일 없음");
			}
		}else {
			throw new Exception("[1]문서 회수 실패");
		}
		return result;
	}
	@Override
	public Document selectDocById(String docId) {
		return dao.selectDocById(session, docId);
	}
	@Override
	@Transactional	
	public int insertApproverLine(int ownerMemberKey, String name, List<ApproverLine> list) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("no", ownerMemberKey);
		map.put("name", name);
		//결재라인 저장
		int result = dao.insertApproverLineStorage(session, map);
		if(result <= 0) {
			throw new Exception("결재라인 저장 실패");
		}else{
			log.debug("결재라인 저장 성공");
			//결재라인별 결재자 저장
			for(ApproverLine e : list) {
//				log.debug("{}", map);
				e.setErApLineStorageKey((int) map.get("erApLineStorageKey"));
				map.put("approver", e);
				log.debug("{}", map);
				result += dao.insertApproverLine(session, map);
			}
			if(result < list.size()+1) {
				throw new Exception("결재라인 저장 실패 : " + result + "/" + list.size());
			}else {
				log.debug("결재라인 결재자 등록 성공");
			}
		}
		return result;
	}
	@Override
	public List<ApproverLine> selectApproverLineList(int storageKey, int memberNo) {
		Map<String,Integer> map = new HashMap<>();
			map.put("storageKey", storageKey);
			map.put("memberNo", memberNo);
		return dao.selectApproverLineList(session, map);
	}
	@Override
	@Transactional
	public List<ApproverLineStorage> selectApproverLines(int memberNo) {
		Map<String,Integer> map = new HashMap<>();
		//저장된 결재라인 조회
		List<ApproverLineStorage> result = dao.selectApproverLines(session, memberNo);
//		for(ApproverLineStorage r : result) {
//			map.put("storageKey", r.getErApLineStorageKey());
//			map.put("memberNo", memberNo);
//			//해당 결재라인에 해당하는 결재자들 매칭
//			r.setApprovers(dao.selectApproverLineList(session, map)); 
//		}
		return result;
	}
	@Override
	public int deleteApproverLine(int no) {
		return dao.deleteApproverLines(session, no);
	}
}
