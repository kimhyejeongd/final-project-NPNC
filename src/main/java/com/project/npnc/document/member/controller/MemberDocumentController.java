package com.project.npnc.document.member.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.npnc.document.model.dto.DocumentForm;
import com.project.npnc.document.model.dto.DocumentFormFolder;
import com.project.npnc.document.model.service.MemberDocumentServiceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/document")
@RequiredArgsConstructor
@Slf4j
public class MemberDocumentController {
	private final MemberDocumentServiceImpl serv;
	@GetMapping("/home")
	public void docHome() {}
	@GetMapping("/form")
	public void formChoice(Model m){
		log.debug("----전자문서 양식 조회----");
		List<DocumentFormFolder> result = serv.selectformFolders();
		log.debug("{}", result);
		m.addAttribute("folderlist", result);
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
			return "/document/write/normal";
		}
		return "/document/formlist.do";
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
	@PostMapping("/writeend")
	public void insertDoc() {
		
	}
}
