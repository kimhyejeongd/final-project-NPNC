package com.project.npnc.document.member.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		List<DocumentFormFolder> result = serv.selectformFolders();
		log.debug("{}", result);
		m.addAttribute("folderlist", result);
	}
}
