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
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.project.npnc.document.model.dao.MemberDocumentDaoImpl;
import com.project.npnc.document.model.dto.ApproverLine;
import com.project.npnc.document.model.dto.ApproverLineStorage;
import com.project.npnc.document.model.dto.DocFile;
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
	
	@Override
	public int insertApprovers(Document d) throws Exception {
		//등록된 문서키 정보로 넘겨주기
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
	            result = dao.insertDocFile(session, docFile);
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
	    
    	fileUpload("dochtml",d.getErDocSerialKey(), html);
    	if(result <= 0) {
    		throw new Exception("[4] 문서 html 등록 실패");
    	}
	    log.debug("[4] 문서 html 등록 성공");
	    
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
	@Override
	public int deleteDocFile(String docSerial) throws Exception {
		return dao.deleteDocFile(session, docSerial);
	}
	//html파일로 문서 저장 메소드
	private int fileUpload(String dir, String title, String content) throws IOException {
		String path = uploadDir+ dir + "/" +title + ".html";
		log.debug("문서 저장 경로 : " + path);
			File file = new File(path);
			// 필요한 경우, 부모 디렉토리가 존재하지 않으면 생성
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
            }
			BufferedWriter writer = new BufferedWriter(new FileWriter(path));
			log.debug(content);
            writer.write(content);
            writer.close();
            return 1;
	}
}
