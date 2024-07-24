package com.project.npnc.admin.document.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.npnc.admin.document.model.dto.AdminDocument;
import com.project.npnc.admin.document.model.dto.StorageFolder;
import com.project.npnc.admin.document.model.service.AdminDocumentService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/admin/documentForm")
@Controller
@RequiredArgsConstructor
public class AdminDocumentFormController {
    private final ObjectMapper objectMapper;

	private final AdminDocumentService service;
	@GetMapping("/selectAdminDocumentFormAll")
	public String selectAdminDocumentFormAll(Model model) {
		List<StorageFolder> folders = service.selectAdminDocumentFormAll();
		model.addAttribute("folders",folders);
		return "admin/document/docStorage";
		
	}
	@GetMapping("/selectDoc")
	public ResponseEntity<?> selectDocAll (@RequestParam int folderKey) {
		List<AdminDocument> docs = service.selectDocAll(folderKey);
		return ResponseEntity.ok(docs);
	}
	
    @PostMapping("/updateFolderOrder")
    @ResponseBody
    public String updateOrder(@RequestParam int draggedFolder, @RequestParam(required=false) int targetFolder) {
    	System.out.println(draggedFolder);
    	System.out.println(targetFolder);
    	return null;
    }

}
