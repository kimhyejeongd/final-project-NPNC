package com.project.npnc.document.model.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.project.npnc.document.model.dao.MemberDocumentDaoImpl;
import com.project.npnc.document.model.dto.Approver;
import com.project.npnc.document.model.dto.ApproverLine;
import com.project.npnc.document.model.dto.ApproverLineStorage;
import com.project.npnc.document.model.dto.DocFile;
import com.project.npnc.document.model.dto.Document;
import com.project.npnc.document.model.dto.DocumentForm;
import com.project.npnc.document.model.dto.DocumentFormFolder;
import com.project.npnc.document.model.dto.OvertimeApply;
import com.project.npnc.document.model.dto.Referer;
import com.project.npnc.document.model.dto.VacationApply;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberDocumentServiceImpl implements MemberDocumentService {
	private final SqlSession session;
	private final MemberDocumentDaoImpl dao;
	@Value("${file.upload-dir}")
    private String uploadDir;
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
	public List<Document> selectDraftDocs(int no) {
		return dao.selectDraftDocs(session, no);
	}
	@Override
	public List<Document> selectWaitingDocs(int no) {
	    List<Document> result = dao.selectWaitingDocs(session, no);
	    log.debug("[1] 조회" + result.toString());
	    //Document 리스트에서 본인이 이미 결재한 결과 제거
	    result.removeIf(doc -> doc.getApprovers().stream()
	                        .anyMatch(approver -> 
                    		approver.getMemberKey() == no && !(approver.getState().equals("대기"))));
	    return result;
	}

	@Override
	public List<Document> selectRetrieveDocs(int no) {
		return dao.selectRetrieveDocs(session, no);
	}
	
	@Override
	public int insertApprovers(Document d) throws Exception {
		//등록된 문서키 정보로 넘겨주기
		log.debug("insertApprovers : " + d.getErDocSerialKey());
		d.getApprovers().forEach(e -> e.setErDocSerialKey(d.getErDocSerialKey()));
		return dao.insertApprovers(session, d.getApprovers());
	}
	@Override
	public int insertReferers(Document d) throws Exception {
		//등록된 문서키 정보 넘겨주기
	    d.getReferers().forEach(e -> e.setErDocSerialKey(d.getErDocSerialKey()));
	    return dao.insertReferer(session, d.getReferers());
	}
	
	@Override
	@Transactional	
	public int insertDoc(Document d, MultipartFile[] file, String html) throws Exception {
//		d.setErDocFilename(d.getErDocSerialKey()+".html"); //문서파일명 설정
		
		int result = dao.insertDoc(session, d);
		//"erDocSerialKey" selectKey
		if (result <= 0) {
	        throw new Exception("[1]문서 insert 실패");
	    }
		log.debug("[1]문서 insert 성공 : " + d.getErDocKey());
		
		//첨부파일 있으면 파일 insert 및 업로드
		if (file.length > 0 || file != null) {
			int count=0;
			DocFile docFile = null;
			List<DocFile> list = new ArrayList<>();
			
			for(MultipartFile f : file) {
				count++;
				if(f.isEmpty()) {
					continue;
				}//debug
				log.debug("첨부파일 있음");
				log.debug("파일 이름: " + f.getOriginalFilename());
	            // 고유한 파일 이름 생성 (UUID 사용)
	            String fileName = UUID.randomUUID().toString() + "_" + f.getOriginalFilename();
	
	            // 절대 경로 설정
	            String upload = Paths.get(uploadDir+"/docfile").toAbsolutePath().toString();
	
	            // 파일 저장 경로 설정
	            Path filePath = Paths.get(upload, fileName);
	            // 부모 디렉토리가 존재하지 않으면 생성
	            File parentDir = filePath.getParent().toFile();
	            if (!parentDir.exists()) {
	                parentDir.mkdirs(); // 디렉토리 생성
	            }	            
	            // 파일 저장
	            Files.copy(f.getInputStream(), filePath);
	            log.debug("파일 업로드 : " + filePath);
	            // 파일 메타 데이터 생성
	//    		// 파일을 DocFile 객체로 변환
	    		docFile = docFile.builder()
	    				.fileOriName(f.getOriginalFilename())
	    				.fileRename(fileName)
	    				.erDocKey(d.getErDocKey())
	    				.erDocSerialKey(d.getErDocSerialKey())
	    				.fileSize(Long.toString(f.getSize()))
	    				.fileForm(f.getOriginalFilename().substring(f.getOriginalFilename().lastIndexOf(".")+1))
	    				.fileOrderby(count)
	    				.fileUploader(d.getErDocWriter())
	    				.build();
	            
	            //db insert
	    		//er_document erDocKey selectKey
	            result = dao.insertDocFile(session, docFile);
	            log.debug("{}",docFile);
	            //Document 객체의 files 리스트에 추가
	            //list.add(docFile);
	            if(result <= 0) {
					throw new Exception("파일 insert 실패 : " + count + "/" + file.length);
				}
	            log.debug("파일 저장, insert 성공 : " + count + "/" + file.length);
	            d.setFiles(list);
			}//for
        }//if

	    result = insertApprovers(d);
	    if (result <= 0) {
	        throw new Exception("[2] 결재자 insert 실패");
	    }
	    log.debug("[2] 결재자 insert 성공");

	    if (d.getReferers().size() > 0) {
	    	log.debug("참조인 있음");
	        result = insertReferers(d);
	        if (result <= 0) {
	            throw new Exception("[3] 참조인 insert 실패");
	        }
	        log.debug("[3] 참조인 insert 성공");
	    }else {
	    	log.debug("참조인 없음");
	    }
	    
	    //시리얼번호 문서 내 등록
	    html=html.replace("[문서번호]", d.getErDocSerialKey());
	    
	    result = htmlFileUpload("dochtml",d.getErDocSerialKey(), html);
    	if(result <= 0) {
    		throw new Exception("[4] 문서 html 등록 실패");
    	}
	    log.debug("[4] 문서 html 등록 성공");
	    
		return result;
	}
	
	@Override
	@Transactional
	public int insertVacDoc(Document d, MultipartFile[] file, String html, VacationApply vac) throws Exception {
		int result = insertDoc(d, file, html);
		vac.setVacationDocSerialKey(d.getErDocSerialKey());
		
		log.debug("휴가 신청 등록 -> " + vac.toString());
		result = dao.insertVacationApply(session, vac);
		if(result <= 0) {
			throw new Exception("휴가 신청 등록 실패");
		}
		log.debug("휴가 신청 등록 성공 -> " + vac.toString());
		
		return result;
	}
	@Override
	@Transactional
	public int insertOvertimeDoc(Document d, MultipartFile[] file, String html, OvertimeApply ot) throws Exception {
		//문서 등록
		int result = insertDoc(d, file, html);
		ot.setErDocSerialKey(d.getErDocSerialKey());
		
		log.debug("추가근무 신청 등록 -> " + ot.toString());
		result = dao.insertOvertimeApply(session, ot);
		if(result <= 0) {
			throw new Exception("추가근무 신청 등록 실패");
		}
		log.debug("추가근무 신청 등록 성공 -> " + ot.toString());
		
		return result;
	}
	@Override
	public int insertVacationApply(VacationApply vac) {
		return dao.insertVacationApply(session, vac);
	}
	
	@Override
	@Transactional	
	public int insertDraftDoc(Document d, MultipartFile[] file, String html) throws Exception {
//		d.setErDocFilename(d.getErDocSerialKey()+".html"); //문서파일명 설정
		
		int result = dao.insertDraftDoc(session, d);
		//selectKey
		if (result <= 0) {
			throw new Exception("[1]draft 문서 insert 실패");
		}
		log.debug("[1]draft 문서 insert 성공 : " + d.getErDocKey());
		
		//첨부파일 있으면 파일 insert 및 업로드
		if (file.length > 0 || file != null) {
			log.debug("첨부파일 있음");
			int count=0;
			DocFile docFile = null;
			List<DocFile> list = new ArrayList<>();
			
			for(MultipartFile f : file) {
				count++;
				log.debug("파일 이름: " + f.getOriginalFilename());
				// 고유한 파일 이름 생성 (UUID 사용)
				String fileName = UUID.randomUUID().toString() + "_" + f.getOriginalFilename();
				
				// 절대 경로 설정
				String upload = Paths.get(uploadDir+"/docfile").toAbsolutePath().toString();
				
				// 파일 저장 경로 설정
				Path filePath = Paths.get(upload, fileName);
				// 부모 디렉토리가 존재하지 않으면 생성
				File parentDir = filePath.getParent().toFile();
				if (!parentDir.exists()) {
					parentDir.mkdirs(); // 디렉토리 생성
				}	            
				// 파일 저장
				Files.copy(f.getInputStream(), filePath);
				// 파일 메타 데이터 생성
				// 파일을 DocFile 객체로 변환
				docFile = docFile.builder()
						.fileOriName(f.getOriginalFilename())
						.fileRename(fileName)
						.erDocKey(d.getErDocKey())
						.erDocSerialKey(d.getErDocSerialKey())
						.fileSize(Long.toString(f.getSize()))
						.fileForm(f.getOriginalFilename().substring(f.getOriginalFilename().lastIndexOf(".")+1))
						.fileOrderby(count)
						.fileUploader(d.getErDocWriter())
						.build();
				
				//db insert
				result = dao.insertDraftDocFile(session, docFile);
				log.debug("{}",docFile);
				//Document 객체의 files 리스트에 추가
				//list.add(docFile);
				if(result <= 0) {
					throw new Exception("파일 insert 실패 : " + count + "/" + file.length);
				}
				log.debug("파일 저장 성공 : " + count + "/" + file.length);
				d.setFiles(list);
			}
		}
		//시리얼키 사용
		result = insertApprovers(d);
		if (result <= 0) {
			throw new Exception("[2] 결재자 insert 실패");
		}
		log.debug("[2] 결재자 insert 성공");
		
		if (d.getReferers().size() > 0) {
			log.debug("참조인 있음");
			result = insertReferers(d);
			if (result <= 0) {
				throw new Exception("[3] 참조인 insert 실패");
			}
			log.debug("[3] 참조인 insert 성공");
		}
		
		result = htmlFileUpload("dochtml",d.getErDocSerialKey(), html);
		if(result <= 0) {
			throw new Exception("[4] 문서 html 등록 실패");
		}
		log.debug("[4] 문서 html 등록 성공");
		
		return result;
	}
	@Override
	@Transactional	
	public int insertDraftVacDoc(Document d, MultipartFile[] file, String html, VacationApply vac) throws Exception {
		int result = insertDraftDoc(d, file, html);
		vac.setVacationDocSerialKey(d.getErDocSerialKey());
		
		result = dao.insertVacationApplyDraft(session, vac);
		if(result <= 0) {
			throw new Exception("휴가 신청 상태 임시저장으로 등록");
		}
		log.debug("휴가 신청 -> 임시저장");
		
		return result;
	}
	@Override
	@Transactional	
	public int retrieveDoc(String docKey) throws Exception {
		//전자문서 테이블 상태변경 (처리중 -> 회수)
		int result = dao.retrieveDoc(session, docKey); 
		//selectKey "fileRename"
		if(result<=0) {
			throw new Exception("[1]문서 회수 실패");
		}
		log.debug("[1]문서 회수 완료");
		
		//추가근무 신청서인 경우
		if(docKey.contains("F2")) {
			log.debug("추가근무 신청 문서입니다");
			result = dao.deleteOvertimeApply(session, docKey);
			if(result <= 0) throw new Exception("[2]추가근무 신청 삭제 실패");
			log.debug("[2]추가근무 신청 삭제 완료");
		}
		//휴가 신청서인 경우
		if(docKey.contains("F3")) {
			log.debug("휴가 신청 문서입니다");
			result = dao.deleteVacationApply(session, docKey);
			if(result <= 0) throw new Exception("[2]휴가 신청 삭제 실패");
			log.debug("[2]휴가 신청 삭제 완료");
		}
		
		return result;
	}
	@Override
	@Transactional	
	public int deleteDraftDoc(int docKey) throws Exception {
		//문서 전체 정보 가져오기
		Document d = dao.selectDocById(session, docKey);
		log.debug("{}", d);
		
		//전자결재 테이블 삭제
		int result = dao.deleteDraftDoc(session, d.getErDocSerialKey());
		if(result<=0) {
			throw new Exception("[1]임시보관 문서 삭제 실패");
		}
		log.debug("[1]임시보관 문서 삭제 완료");
		
		
		//첨부파일 있는지 확인
		List<DocFile> files = dao.selectDocFile(session, d.getErDocSerialKey());
		if(files.size() > 0) {
			log.debug("첨부파일 있음");
			int count = 0;
			result = dao.deleteDocFile(session, d.getErDocSerialKey());
			if(result<=0) {
				throw new Exception("[2]첨부파일 삭제 실패");
			}
			log.debug("[2]첨부파일 삭제 완료");
			
			//서버에서 삭제
			for(DocFile f : files) {
				count++;
				result=fileRemove("docfile", f.getFileRename());
				if(result<=0) {
					throw new Exception("[2]첨부파일 삭제 실패" + count + "/" + files.size());
				}
			}
			
		}else {
			log.debug("첨부파일 없음");
		}
		
		result = fileRemove("dochtml", d.getErDocSerialKey()+ ".html");
		if(result<=0) {
			throw new Exception("[3]임시보관 문서 html 삭제 실패");
		}
		log.debug("[3]임시보관 문서 html 삭제 완료");
		//결재자 있으면 삭제
		//참조인 있으면 삭제
		return result;
	}
	@Override
	public Document selectDocById(int docId) {
		log.debug("-----" + docId + "조회-----");
		Document d = dao.selectDocById(session, docId);
		log.debug("{}", d);
		List<Referer> r = dao.selectReferer(session, d.getErDocSerialKey());
		if(r != null) {
			log.debug("참조인 없음");
			d.setReferers(r);
		}
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
	
//	첨부파일
	@Override
	public int insertDocFile(List<DocFile> d) throws Exception {
		int result = 0;
		int count = 0;
		for(DocFile f : d) {
			count++;
			//첨부파일 등록
			result = dao.insertDocFile(session, f);
			if(result>0) {
				log.debug("첨부파일 등록 성공");
				log.debug("{}", d);
			}else {
				throw new Exception("첨부파일 등록 실패 : " + count + "/" + d.size());
			}
		};
		return result;
	}
	//문서 파일 삭제
	@Override
	public int deleteDocFile(String docSerial) throws Exception {
//		//첨부파일 있는지 확인 -> 삭제 안하기
//		List<DocFile> files = dao.selectDocFile(session, docKey);
//		if(files.size() > 0) {
//			log.debug("첨부파일 있음");
//			int count =0;
//			
//			//db 삭제
//			result = dao.deleteDocFile(session, docKey);
//			if(result<=0) {
//				throw new Exception("[2]첨부파일 삭제 실패");
//			}
//			log.debug("[2]첨부파일 삭제 완료");
//			
//			//서버에서 삭제
//			for(DocFile f : files) {
//				count++;
//				result=fileRemove("docfile", f.getFileRename());
//				if(result<=0) {
//					throw new Exception("[2]첨부파일 삭제 실패" + count + "/" + files.size());
//				}
//			}
//		}

		return dao.deleteDocFile(session, docSerial);
	}
	//html파일로 문서 저장 메소드
	private int htmlFileUpload(String dir, String title, String content) throws IOException {
		String path = uploadDir+ dir + "/" +title + ".html";
		log.debug("문서 저장 경로 : " + path);
			File file = new File(path);
			// 필요한 경우, 부모 디렉토리가 존재하지 않으면 생성
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
            }
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(path, false))) {
				log.debug(content);
	            writer.write(content);
	            writer.close();
	            return 1;
            }
	}
	//파일 삭제 메소드
	private int fileRemove(String dir, String title) throws IOException {
		String path = uploadDir + dir + "/" +title;
		log.debug("문서 경로 : " + path);
		File file = new File(path);
		
		if (file.exists()) {
	        if (file.delete()) {
	            log.debug("파일 삭제 성공: " + path);
	            return 1; // 성공
	        } else {
	            log.debug("파일 삭제 실패: " + path);
	            throw new IOException("파일 삭제 실패: " + path);
	        }
	    } else {
	        log.debug("파일이 존재하지 않음: " + path);
	        return -1; // 파일 없음
	    }
	}
	@Override
	public Document selectDocBySerial(String serial) {
		log.debug("-----" + serial + "조회-----");
		Document d = dao.selectDocBySerial(session, serial);
		log.debug("{}", d);
		List<Referer> r = dao.selectReferer(session, serial);
		if(r != null) {
			log.debug("참조인 없음");
			d.setReferers(r);
		}
		return d;
	}
	
	//결재 : 승인
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateApproveDoc(int memberKey, String serial, String msg, int formNo) throws Exception {
		int result = 0;
		int lastApCk = 0;
		
		try {
			
			//결재 상태 변경
			result = dao.updateApprovalState(session, serial, memberKey, msg, "승인");
			if(result <= 0) {
				throw new Exception("결재 상태 승인으로 변경 실패");
			}
			log.debug("결재 상태 -> 승인");
			
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
					result = updateOvertiemApply(serial, "승인");
					if(result <= 0) throw new Exception("추가근무 신청 상태 승인으로 변경 실패");
					log.debug("추가근무 신청 상태 -> 승인");
					break;
				case 3:
					//휴가 문서라면 계산 진행
					result = updateVacationApply(serial, "승인");
					if(result <= 0) throw new Exception("휴가 신청 상태 승인으로 변경 실패");
					log.debug("휴가 신청 상태 -> 승인");
					
					//차감 진행
					result = dao.updateVacationCalc(session, memberKey, serial);
					if(result <= 0) throw new Exception("휴가 차감 실패");
					log.debug("휴가 차감 성공");
					break;
				}
	
			}
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
	//결재 : 반려
	@Override
	@Transactional
	public int updateRejectDoc(int memberKey, String serial, String msg) throws Exception {
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
	public List<Document> selectPendingDocs(int no) {
		return dao.selectPendingDocs(session, no);
	}
	@Override
	public List<Document> selectMyCompleteDocs(int no) {
		return dao.selectMyCompleteDocs(session, no);
	}
	@Override
	public List<Document> selectMyRejectDocs(int no) {
		return dao.selectMyRejectDocs(session, no);
	}
	@Override
	public List<Document> selectCompleteDocs(int no) {
		return dao.selectCompleteDocs(session, no);
	}
	@Override
	public List<Document> selectRejectedDocs(int no) {
		return dao.selectRejectedDocs(session, no);
	}
	@Override
	public List<Document> selectReferenceDocs(int no) {
		return dao.selectReferenceDocs(session, no);
	}
	
//	휴가
	@Override
	public int selectRemainingVac(int memberKey) {
		return dao.selectRemainingVac(session, memberKey);
	}
	@Override
	public int updateVacationApply(String docSerial, String status) {
		return dao.updateVacationApply(session, docSerial, status);
	}
	
// 추가근무
	@Override
	public int updateOvertiemApply(String docSerial, String status) {
		return dao.updateOvertimeApply(session, docSerial, status);
	}
	
}
