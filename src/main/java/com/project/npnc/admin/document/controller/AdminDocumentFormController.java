package com.project.npnc.admin.document.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
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
import com.project.npnc.document.model.dto.DocumentForm;
import com.project.npnc.document.model.dto.DocumentFormFolder;
import com.project.npnc.organization.dto.OrganizationDto;
import com.project.npnc.organization.service.OrganizationService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
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
	@GetMapping("selectAdminFormAll")
	public String selectAdminFormAll(Model model) {
		List<DocumentFormFolder>folders = service.selectDocFormFolderAll();
		model.addAttribute("folders",folders);
		return "admin/document/docForm";
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
    @PostMapping("/updateFolder")
    public ResponseEntity<?>updateFolder(@RequestBody StorageFolder storageFolder){
    	
    	int result = service.updateStorageFolder(storageFolder);
    	return ResponseEntity.ok(result);
    }
    @PostMapping("/selectForm")
    public ResponseEntity<List<DocumentForm>> selectForm(@RequestParam int folderKey){
    	List<DocumentForm> result = service.selectForm(folderKey);
    	return ResponseEntity.ok(result);
    }
    @PostMapping("/createDocFolder")
    public ResponseEntity<?> createDocFolder(@RequestBody DocumentFormFolder folder) throws IOException{
    	int result =service.createDocFolder(folder);

    	
    	String path = "src/main/webapp/resources/upload/docFile";

        if (result >0 ) {
        	 File folder1 = new File(path+"/"+folder.getErFormFolderName());
        	 System.out.println(folder1);
             // 디렉토리가 이미 존재하는지 확인
             if (!folder1.exists()) {
                 // 디렉토리 생성
                 folder1.mkdir();
             } else {
                 throw new IOException("Folder already exists");
             }
        }
    	return ResponseEntity.ok(result);
    }
    @PostMapping("/updateDocFolder")
    public ResponseEntity<?>updateDocFolder(@RequestBody DocumentFormFolder folder,HttpSession session) throws IOException {
    	DocumentFormFolder oldFolder = service.selectDocFormFolderOne(folder.getErFormFolderKey());
    	int result = service.updateDocFolder(folder);
    	String path = "src/main/webapp/resources/upload/docFile";
        if (result >0 ) {
        	 File fromFolder = new File(path+"/"+oldFolder.getErFormFolderName());
        	 File toFolder = new File(path+"/"+folder.getErFormFolderName());
             // 디렉토리가 이미 존재하는지 확인
             if (fromFolder.exists()) {
         		FileUtils.moveDirectory(fromFolder, toFolder);
             } else {
                 throw new IOException("Folder already exists");
             }
        }

    	return ResponseEntity.ok(result); 
    }
    @PostMapping("/removeDocFolder")
    public ResponseEntity<?> removeDocFolder (@RequestParam int draggedFolderKey) {
    	DocumentFormFolder draggedFolder = service.selectDocFormFolderOne(draggedFolderKey);
    	int result = service.removeDocFolder(draggedFolderKey);
    	String path = "src/main/webapp/resources/upload/docFile";
		File folder = new File(path+"/"+draggedFolder.getErFormFolderName());
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
    	return ResponseEntity.ok(result);
    }
    @GetMapping("/form")
    public String showForm() {
        return "admin/document/form";
    }
    
    @PostMapping("/insertForm")
    public ResponseEntity<?> insertForm(@RequestParam("htmlContent") String htmlContent, @RequestParam(value = "erFormFolderKey", required = false) int erFormFolderKey) {
        System.out.println(erFormFolderKey + "11111111111111111");
        System.out.println("11111111111111111");

        // 저장할 경로 지정 (예: webapps 폴더 내 resources/upload/docformhtml)
        String filePath = servletContext.getRealPath("/resources/upload/docformhtml/savedDocument.html");

        // 파일에 HTML 내용 저장
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            writer.write(htmlContent);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Error saving file");
        }

        return ResponseEntity.ok("File saved successfully");
    }
    @GetMapping("/selectFolder")
    public String selectFolder(Model m){
    	System.out.println("-----------");
    	List<DocumentFormFolder>folders= service.selectDocFormFolderAll();
    	m.addAttribute("folders", folders);
    	return "admin/document/selectFolder";
    }
}
