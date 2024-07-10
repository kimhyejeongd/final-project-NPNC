package com.project.npnc.document.member.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.npnc.document.model.dto.Document;
import com.project.npnc.document.model.dto.DocumentForm;
import com.project.npnc.document.model.dto.DocumentFormFolder;
import com.project.npnc.document.model.dto.approversList;
import com.project.npnc.document.model.service.MemberDocumentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/document")
@RequiredArgsConstructor
@Slf4j 
public class MemberDocumentController {
	private final MemberDocumentService serv;
	@Value("${file.upload-dir}")
    private String uploadDir;
	
	@GetMapping("/home")
	public void docHome() {}
	
	@GetMapping("/form")
	public void formChoice(Model m){
		log.debug("----전자문서 양식 조회----");
		List<DocumentFormFolder> result = serv.selectformFolders();
		log.debug("{}", result);
		m.addAttribute("folderlist", result);
	}
	@GetMapping("/inprocess")
	public void inprocessDoc(Model m){
		log.debug("----진행중인 문서 조회----");
		int memberNo=3;
		List<Document> result = serv.selectInprocessDocs(memberNo);
		log.debug("{}", result);
		m.addAttribute("doclist", result);
	}
	@PostMapping("/formlist.do")
	@ResponseBody
	public List<DocumentForm> formList(int folderNo, Model m) {
		log.debug("----전자문서 양식 "+ folderNo+"번 폴더 조회----");
		List<DocumentForm> result = serv.selectForms(folderNo);
		log.debug("{}", result);
//		m.addAttribute("formlist", result);
		return result;
	}
	@PostMapping("/formsearch.do")
	@ResponseBody
	public List<DocumentForm> formList(String target, Model m) {
		log.debug("----전자문서 양식명 "+ target+" 조회----");
		List<DocumentForm> result = serv.selectFormsBySearch(target);
		log.debug("{}", result);
//		m.addAttribute("formlist", result);
		return result;
	}
	@GetMapping("/write")
	public String formWrite(int form, Model m) {
		switch(form) {
		case 1 :
			//log.debug("----전자문서 작성시작----");
			//DocumentForm f = serv.selectFormByNo(form);
			return "document/write/normal";
		}
		return "document/formlist.do";
	}
	@GetMapping("/doc1")
	public void doc1Write() {
	}
	@GetMapping("/doc2")
	public void doc2Write() {
	}
	@GetMapping("/doc3")
	public void doc3Write() {
	}
	@GetMapping("/doc4")
	public void doc4Write() {
	}
	@PostMapping("/writeend") //전자문서 기안(기안자번호, 기안자결재의견, 기본정보, 결재자들, 첨부파일)
	public String insertDoc(String msg, Document doc, String html, @ModelAttribute approversList request, Model m) {
		int no = 3; //로그인 사원번호
		doc.setErDocWriter(no);
		doc.setErDocKey("D2F3"); //문서구분키 생성을 위한 사전세팅(부서코드양식코드)
		doc.setErDocStorage("보관함명"); //문서보관함 임시세팅
		doc.setErDocFilename(doc.getErDocTitle()+".html"); //문서파일 저장을 위한 사전세팅
		log.debug(no+ "번 사원의 문서 기안 -> " + msg);
		log.debug("{}", doc);
		log.debug("{}", request);
		int result=0;
		
		//문서, 결재자 insert
		try { result = serv.insertDoc(doc, request);
			} catch (Exception e) {e.printStackTrace();}
		
		//기안, 결재자 등록 성공시
		if(result > 0) {
			//첨부파일 있으면 파일 등록 진행 TODO
			
			//html파일로 문서 저장
			try {
				fileUpload(doc.getErDocTitle(), html);
	            log.debug("[3] html저장 성공");
			}catch(IOException e) {
				log.debug("[3] html저장 실패");
				new Exception("[3] html저장 실패");
			}
		} else {//기안, 결재자 등록 실패시
			log.debug("[2] 결재자 insert 실패");
//			m.addAttribute("msg", "[2] 결재자 저장 실패");
//			m.addAttribute("loc", "/document/write");
//			return "common/msg";
			new Exception("[2] 결재자 저장 실패");
		}
		return "redirect:home"; //모두 성공시 홈으로
	}
	
	//html파일로 문서 저장 메소드
	private void fileUpload(String title, String content) throws IOException {
		String path = uploadDir + "dochtml/"+title +".html";
			File file = new File(path);
			// 필요한 경우, 부모 디렉토리가 존재하지 않으면 생성
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
            }
			BufferedWriter writer = new BufferedWriter(new FileWriter(path));
            writer.write(content);
            writer.close();
	}
}
