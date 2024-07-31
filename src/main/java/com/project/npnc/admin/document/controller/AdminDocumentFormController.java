package com.project.npnc.admin.document.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
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
	@Value("${file.upload-dir}")
    private String uploadPath;

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
    	service.increaseFolderOrder(folderInfo); // 대상 order의 크기에 따라 남은 order의 크기를 조절함

    	int targetOrder = targetFolder.getFolderOrderBy();
    	if(targetFolder.getFolderLevel()==1) {
    		targetOrder+=1;
    		} //대상 폴더가 대분류면 순서를 1로 설정

    	draggedFolder.setFolderOrderBy(targetOrder);
    	
    	service.updateStorageGroup(folderInfo);
    	return ResponseEntity.ok(folderInfo);
    }

    @PostMapping("/removeFolder")
    public ResponseEntity<?>removeFolder(@RequestParam int draggedFolderKey){
    	StorageFolder storageFolder = service.selectStorageFolder(draggedFolderKey);
    	int result = service.removeFolder(draggedFolderKey);
    	if(result>0) {
    		String path ="/dochtml/"+storageFolder.getFolderName()+"/";;
    		if(storageFolder.getFolderLevel()==2) {
    			path+=storageFolder.getFolderName()+"/";
    		}
    		File folder = new File(uploadPath+path);
    		try {
    			if (folder.exists()) {
    				FileUtils.deleteDirectory(folder);//하위 폴더와 파일 모두 삭제
    				if (folder.isDirectory()) {
    					folder.delete(); // 대상폴더 삭제
    				}
    			}
    		} catch (IOException e) {
    			e.printStackTrace();
    		}
    	}
    	return ResponseEntity.ok(result);
    }
    @PostMapping("/createFolder")
    public ResponseEntity<?> createFolder(@RequestBody StorageFolder storageFolder) throws IOException{
    	int result = service.insertFolder(storageFolder);
    	String docPath = "/dochtml/";
		
        if (result > 0 ) {
        	if(storageFolder.getFolderLevel()==2) {
        		String parentFolderName = service.selectParentFolderName(storageFolder.getFolderGroup());
        		docPath += parentFolderName+"/";
        	}
        	System.out.println(docPath);
            File folder = new File(uploadPath+docPath+storageFolder.getFolderName());
            // 디렉토리가 이미 존재하는지 확인
            if (!folder.exists()) {
                // 디렉토리 생성
                folder.mkdir();
            } else {
                throw new IOException("Folder already exists");
            }
        }
		 
    	
    	return ResponseEntity.ok(storageFolder);
    }
    @PostMapping("/createStorage")
    public ResponseEntity<?>createStorage(@RequestBody Storage storage) throws IOException{
    	System.out.println(storage);
    	List<AdminDocument> result = service.insertStorage(storage);
    	String docPath = "/dochtml/";
    	StorageFolder parentFolder = service.selectStorageFolder(storage.getStorageFolderKey());
    	String parentFolderName = service.selectParentFolderName(parentFolder.getFolderGroup());
    	docPath+=(parentFolderName+"/"+parentFolder.getFolderName()+"/");
        if (result != null ) {
        	 File folder = new File(uploadPath+docPath+storage.getStorageName());
             // 디렉토리가 이미 존재하는지 확인
             if (!folder.exists()) {
                 // 디렉토리 생성
                 folder.mkdir();
             } else {
                 throw new IOException("Folder already exists");
             }
        }
    	return ResponseEntity.ok(result); 
    }
    @PostMapping("/deleteStorage")
    public ResponseEntity<?> deleteStorage(@RequestBody List<Integer>deleteKeys) {
    	int result = service.deleteStorage(deleteKeys);

    	return ResponseEntity.ok(result);
    }
    @PostMapping("/updateStorage")
    public ResponseEntity<?>updateStorage(@RequestBody Storage storage){
    	System.out.println(storage);
    	int result = service.updateStorage(storage);
    	if(result>0) {
    		String docPath = "/dochtml/";
    		StorageFolder storageFolder = service.selectStorageFolder(storage.getStorageFolderKey());
    		String storagePath = service.selectParentFolderName(storageFolder.getFolderGroup())+"/"+storageFolder.getFolderName()+"/";
    		File file = new File(uploadPath+docPath+storagePath+storage.getOriName());
    		File newFile = new File(uploadPath+docPath+storagePath+storage.getStorageName());
    		
    		try {
				FileUtils.moveDirectory(file, newFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}
    	return ResponseEntity.ok(result);
    }
}
