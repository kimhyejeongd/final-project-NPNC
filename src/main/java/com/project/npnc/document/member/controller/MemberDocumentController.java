package com.project.npnc.document.member.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.npnc.document.model.dto.Approver;
import com.project.npnc.document.model.dto.ApproversList;
import com.project.npnc.document.model.dto.Document;
import com.project.npnc.document.model.dto.DocumentForm;
import com.project.npnc.document.model.dto.DocumentFormFolder;
import com.project.npnc.document.model.dto.RefererList;
import com.project.npnc.document.model.service.MemberDocumentService;
import com.project.npnc.organization.service.OrganizationService;
import com.project.npnc.security.dto.Member;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/document")
@RequiredArgsConstructor
@Slf4j 
public class MemberDocumentController {
	private final MemberDocumentService serv;
	private final OrganizationService orserv;
	@Value("${file.upload-dir}")
    private String uploadDir;
	
	
	@GetMapping("/home")
	public void docHome(Model m) {
		Member user = getCurrentUser();
		m.addAttribute("doclist", serv.selectInprocessDocs(user.getMemberKey()));
		log.debug("{}", m.getAttribute("doclist"));
		m.addAttribute("waitinglist", serv.selectWaitingDocs(user.getMemberKey()));
		log.debug("{}", m.getAttribute("waitinglist"));
	}
	@GetMapping("/form")
	public void formChoice(Model m){
		log.debug("----전자문서 양식 조회----");
		List<DocumentFormFolder> result = serv.selectformFolders();
		log.debug("{}", result);
		m.addAttribute("folderlist", result);
	}
	
	@GetMapping("/list/retrieve")
	public void docRetrieve(Model m) {
		log.debug("----회수 문서 조회----");
		Member user = getCurrentUser();
		List<Document> result = serv.selectRetrieveDocs(user.getMemberKey());
		log.debug("{}", result);
		m.addAttribute("doclist", result);
	}
	
	@GetMapping("/list/inprocess")
	public void inprocessDoc(Model m){
		log.debug("----진행중인 문서 조회----");
		Member user = getCurrentUser();
		List<Document> result = serv.selectInprocessDocs(user.getMemberKey());
		log.debug("{}", result);
		m.addAttribute("doclist", result);
	}
	@GetMapping("/list/waiting")
	public void waitingDoc(Model m){
		log.debug("----결재 대기 문서 조회----");
		Member user = getCurrentUser();
		log.debug(user.getMemberKey()+"번 사원");
		List<Document> result = serv.selectWaitingDocs(user.getMemberKey());
		log.debug("{}", result);
		m.addAttribute("waitinglist", result);
	}
	
//	전자문서 상세보기
	@PostMapping("/view/docDetail{docId}")
	public void viewDoc(String docId, Model m, HttpSession session) {
		Document document = null;
		if(docId != null) {
			log.debug("----" + docId + "번 문서 상세보기----");
			session.setAttribute("docId", docId);
		}else{
			log.debug(docId);
			docId = (String) session.getAttribute("docId");
		}
		document = serv.selectDocById(docId);
		m.addAttribute("l", document);
		log.debug("{}", document);
		//문서파일 html 가져오기
//		String html = readHtmlFile("dochtml", document.getErDocFilename());
		String html = readHtmlFile("dochtml", document.getErDocFilename());
		m.addAttribute("html", html);
//		log.debug("{}", html);
	}
	
	
	@GetMapping("/request/docForm{formNo}")
	public String formDoc(String form) {
		log.debug(form + "양식 불러오기");
		return readHtmlFile("/docformhtml", form+".html");
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
	@PostMapping("/formsearch")
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
			log.debug("----전자문서 작성시작----");
			String html = readHtmlFile("/docformhtml", "F"+form+".html");
			m.addAttribute("html", html);
			return "document/write/normal";
		}
		return "document/formlist.do";
	}
	
//	팝업
	@GetMapping("/write/approver")
	public void docApprover(Model m) {
		m.addAttribute("list", orserv.selectOrganAll());
	}
	@GetMapping("/write/referer")
	public void docReferer(Model m) {
		m.addAttribute("list", orserv.selectOrganAll());
	}
//	
	
	@GetMapping("/doc4")
	public void doc4Write() {
	}
	@PostMapping(path="/writeend", consumes = {"multipart/form-data"}) //전자문서 기안(기안자번호, 기안자결재의견, 기본정보, 결재자들, 첨부파일)
	public String insertDoc(
			String msg, Document doc, String html, 
			@ModelAttribute ApproversList request, 
			@ModelAttribute RefererList referers, 
			Model m,
			@RequestParam(value="file", required = false) MultipartFile file) {
		Member user = getCurrentUser();
		log.debug("{}", request);
		log.debug("{}", user);
		doc.setErDocSerialKey("D2F3"); //문서구분키 생성을 위한 임시사전세팅(부서코드양식코드)
		doc.setErDocStorage("보관함명"); //문서보관함 임시세팅
		
		
		doc.setErDocWriter(user.getMemberKey()); //작성자=로그인유저
		//결재자에 기안자도 추가
		Approver me = Approver.builder().memberKey(user.getMemberKey())
									.memberTeam("개발팀")
									.memberJob("직급")
									.memberName(user.getMemberName())
									.category("기안")
									.opinion(msg)
									.state("승인")
									.date(Date.valueOf(LocalDate.now()))
									.orderby(0)
						.build();
		List<Approver> ap = request.getApprovers();
		ap.add(me);
		request.setApprovers(ap);
		doc.setApprovers(request.getApprovers()); //has a 관계 파라미터 매칭
		
		
		doc.setErDocFilename(doc.getErDocTitle()+".html"); //문서파일 저장을 위한 사전세팅
		
		log.debug(user.getMemberName()+ "사원의 문서 기안 -> " + msg);
		log.debug("{}", doc);
		log.debug("{}", request);
		log.debug("{}", referers);
		int result=0;
		
		//문서, 결재자 insert
		try { 
			result = serv.insertDoc(doc, request, referers);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:home";
		}
		
		//기안, 결재자 등록 성공시
		if(result > 0) {
			//첨부파일 있으면 파일 등록 진행 TODO
		    if (!file.isEmpty()) {
		    	log.debug("{}",file);
		    }	
			//html파일로 문서 저장
			try {
				fileUpload("/dochtml",doc.getErDocSerialKey(), html);
	            log.debug("[4] html저장 성공");
			}catch(IOException e) {
				log.debug("[4] html저장 실패");
				e.printStackTrace();
			}
		} 
		return "redirect:home"; //모두 성공시 전자결재홈으로
	}
	
	@PostMapping("/retrieve")
	@ResponseBody
	public int retrieveDoc(String no) {
		log.debug("------"+no + "번 문서 회수 요청------");
		int result=0;
		try {
			result = serv.retrieveDoc(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//html파일로 문서 저장 메소드
	private void fileUpload(String dir, String title, String content) throws IOException {
		String path = uploadDir+ dir + "/" +title +".html";
		log.debug("문서 저장 경로 : " + path);
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
	//html 파일 읽기
	public String readHtmlFile(String dir, String title) {
        String path = uploadDir + dir + "/" + title;
        log.debug("문서 읽기 경로 : " + path);
        File file = new File(path);
        StringBuilder content = new StringBuilder();

        try (BufferedReader br = new BufferedReader(
        		new InputStreamReader(
        				new FileInputStream(file), StandardCharsets.UTF_8))) {
            String line;
            while ((line = br.readLine()) != null) {
                content.append(line).append("\n");
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return content.toString();
    }
	private Member getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return (Member) authentication.getPrincipal();
    }
}
