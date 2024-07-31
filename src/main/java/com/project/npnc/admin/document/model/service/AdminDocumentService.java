package com.project.npnc.admin.document.model.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileExistsException;
import org.apache.commons.io.FileUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.project.npnc.admin.document.model.dao.AdminDocumentDao;
import com.project.npnc.admin.document.model.dto.AdminDocument;
import com.project.npnc.admin.document.model.dto.Storage;
import com.project.npnc.admin.document.model.dto.StorageFolder;
import com.project.npnc.security.dto.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminDocumentService {
	private final SqlSessionTemplate session;
	private final AdminDocumentDao dao;
	@Value("${file.upload-dir}")
    private String uploadPath;
	
	public List<StorageFolder> selectAdminDocumentFormAll (){
		return dao.selectAdminDocumentFormAll(session);
	}
	
	public List<AdminDocument> selectDocAll(int folderKey){
		return dao.selectDocAll(session,folderKey);
	}
	public StorageFolder selectStorageFolder(int folderKey) {
		return dao.selectStorageFolderAll(session,folderKey);
	}
	public int updateStorageGroup(Map<String,Object>folderInfo) {
		StorageFolder targetFolder = (StorageFolder) folderInfo.get("targetFolder");
		StorageFolder draggedFolder = (StorageFolder) folderInfo.get("draggedFolder");

		if(targetFolder.getFolderGroup()!=draggedFolder.getFolderGroup()) {
			int result1 = dao.updateFolderGroup(session, draggedFolder);
			System.out.println(draggedFolder.getFolderLevel());
			System.out.println(result1);
			if(draggedFolder.getFolderLevel()==2) {	
					String targetParentName= dao.selectParentFolderName(session, targetFolder.getFolderGroup());
					String draggedParentName = dao.selectParentFolderName(session, draggedFolder.getFolderGroup());
					String path = uploadPath+"dochtml/";
					File from = new File(path+draggedParentName+"/"+draggedFolder.getFolderName());
					File to = new File(path+targetParentName+"/"+draggedFolder.getFolderName());
					System.out.println("===========result=======");
					try {
						FileUtils.moveDirectory(from, to);
						System.out.println("Directory moved successfully.");
					}
					catch (FileExistsException ex) {
						ex.printStackTrace();
					}catch (IOException e) {
						e.printStackTrace();
					}
				
			}
		}
		
		int result =dao.updateStorageGroup(session,folderInfo);
		
		return result;
	}
	public int increaseFolderOrder(Map<String,Object>folderInfo) {
		return dao.increaseFolderOrder(session,folderInfo);
	}
	public int removeFolder(int draggedFolderKey) {
		StorageFolder storageFolder = selectStorageFolder(draggedFolderKey);
		int result = 0;
		if(storageFolder.getFolderLevel()==1) {
			result=dao.removeFolderLv1(session,storageFolder.getFolderGroup());
			dao.updateFolderLv1Order(session,storageFolder.getFolderGroup());
		}else {			
			result =dao.removeFolder(session,draggedFolderKey);
		}
		return result;	
	}
	public int createFolderGroup() {
		return dao.createFolderGroup(session);
	}
	public int selectFolderKey() {
		return dao.selectFolderKey(session);
	}
	public int insertFolder(StorageFolder storageFolder) {
    	int folderKey = dao.selectFolderKey(session);
    	storageFolder.setFolderKey(folderKey);
    	
    	if(storageFolder.getFolderLevel()==1) {
    		int folderGroup = dao.createFolderGroup(session);
    		storageFolder.setFolderGroup(folderGroup+1);
    	}else {
    		int folderOrderBy = dao.selectFolderOrderBy(session,storageFolder.getFolderGroup());
    		storageFolder.setFolderOrderBy(folderOrderBy);
    	}
    	
		return dao.insertFolder(session, storageFolder);
	}
	public List<Member>selectAllMembers(){
		return dao.selectAllMembers(session);
	}
	public List<AdminDocument> insertStorage(Storage storage) {
		int order = dao.selectStorageOrder(session,storage.getStorageFolderKey());
		storage.setStorageOrderBy(order);
		dao.insertStorage(session,storage);
		return dao.selectDocAll(session,storage.getStorageFolderKey());
	}
	public int deleteStorage(List<Integer>deleteKeys) {
		int result=0;
		int temp=0;
	    for(Integer key : deleteKeys) {
	    	Storage storage = dao.selectStorage(session,key);
	    	temp = dao.deleteStorage(session, key);
	    	if(temp>0) {
        		String path = "/dochtml/";
        		StorageFolder parentFolder = dao.selectStorageFolderAll(session,storage.getStorageFolderKey());
        		path+=(dao.selectParentFolderName(session, parentFolder.getFolderGroup())+"/");
        		path+=parentFolder.getFolderName()+"/";
        		
        		
        		File folder = new File(uploadPath+path+storage.getStorageName());
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
	    	result+=temp;
	    }
	    return result;
	}
	public int updateStorage(Storage storage) {
		return dao.updateStorage(session,storage);
	}
	public String selectParentFolderName(int folderGroup) {
		return dao.selectParentFolderName(session,folderGroup);
	}

}
