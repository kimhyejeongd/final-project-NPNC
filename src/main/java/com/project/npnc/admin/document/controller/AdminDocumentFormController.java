package com.project.npnc.admin.document.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.npnc.admin.document.model.dto.AdminDocument;
import com.project.npnc.admin.document.model.dto.Storage;
import com.project.npnc.admin.document.model.dto.StorageFolder;
import com.project.npnc.admin.document.model.service.AdminDocumentService;
import com.project.npnc.organization.dto.OrganizationDto;
import com.project.npnc.organization.service.OrganizationService;

import jakarta.servlet.ServletContext;
import lombok.RequiredArgsConstructor;

@RequestMapping("/admin/documentForm")
@Controller
@RequiredArgsConstructor
public class AdminDocumentFormController {
    private final ObjectMapper objectMapper;
	private final OrganizationService orserv;
	private final ServletContext servletContext;
	

	private final AdminDocumentService service;
	@GetMapping("/selectAdminDocumentFormAll")
	public String selectAdminDocumentFormAll(Model model) {
		List<StorageFolder> folders = service.selectAdminDocumentFormAll();
		List<OrganizationDto> members = orserv.selectOrganAll();
		model.addAttribute("folders",folders);
		model.addAttribute("members",members);
		return "admin/document/docStorage";
		
	}
	@GetMapping("/selectDoc")
	public ResponseEntity<?> selectDocAll (@RequestParam int folderKey) {
		List<AdminDocument> docs = service.selectDocAll(folderKey);
		return ResponseEntity.ok(docs);
	}
	
    @PostMapping("/updateFolderOrder")
    public ResponseEntity<?> updateOrder(@RequestBody Map<String,Object>folderKeys) {
    
    	StorageFolder draggedFolder = service.selectStorageFolder((int)folderKeys.get("draggedFolder"));
    	StorageFolder targetFolder = service.selectStorageFolder((int)folderKeys.get("targetFolder"));
    	

    	
    	Map<String,Object>folderInfo = new HashMap<>();
    	folderInfo.put("draggedOrder",draggedFolder.getFolderOrderBy());
    	folderInfo.put("draggedFolder", draggedFolder);
    	folderInfo.put("targetFolder", targetFolder);
    	System.out.println(draggedFolder+"draggedFolderdraggedFolderdraggedFolder");
    	System.out.println(targetFolder+"targetFoldertargetFoldertargetFolder");
    	service.increaseFolderOrder(folderInfo); // 대상 order의 크기에 따라 남은 order의 크기를 조절함

    	int targetOrder = targetFolder.getFolderOrderBy();
    	if(targetFolder.getFolderLevel()==1) {
    		targetOrder+=1;
    		} //대상 폴더가 대분류면 순서를 1로 설정

    	draggedFolder.setFolderOrderBy(targetOrder);
    	System.out.println(targetOrder);
    	
    	service.updateStorageGroup(folderInfo);
    	return ResponseEntity.ok(folderInfo);
    }

    @PostMapping("/removeFolder")
    public ResponseEntity<?>removeFolder(@RequestParam int draggedFolderKey){
    	int result = service.removeFolder(draggedFolderKey);
    	System.out.println(draggedFolderKey);
    	return ResponseEntity.ok(result);
    }
    @PostMapping("/createFolder")
    public ResponseEntity<?> createFolder(@RequestBody StorageFolder storageFolder,ServletContext servletContext  ) throws IOException{
    	int result = service.insertFolder(storageFolder);
    	
		
//        if (result > 0) {
//            // 실제 업로드 디렉토리 경로 얻기
//            String realPath = servletContext.getRealPath("/resources/upload");
//            Path path = Paths.get(realPath, storageFolder.getFolderName());
//
//            // 디렉토리가 이미 존재하는지 확인
//            if (!Files.exists(path)) {
//                // 디렉토리 생성
//                Files.mkdir(path);
//            } else {
//                throw new IOException("Folder already exists");
//            }
//        }
//		 
    	
    	return ResponseEntity.ok(storageFolder);
    }
    @PostMapping("/createStorage")
    public ResponseEntity<?>createStorage(@RequestBody Storage storage){
    	System.out.println(storage);
    	List<AdminDocument> result = service.insertStorage(storage);
    	return ResponseEntity.ok(result); 
    }
    @PostMapping("/deleteStorage")
    public ResponseEntity<?> deleteStorage(@RequestBody List<Integer>deleteKeys) {
    	int result = service.deleteStorage(deleteKeys);
    	return ResponseEntity.ok(result);
    }
    @PostMapping("/updateStorage")
    public ResponseEntity<?>updateStorage(@RequestBody Storage storage){
    	int result = service.updateStorage(storage);
    	return ResponseEntity.ok(result);
    }
}
