package com.project.npnc.admin.document.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.project.npnc.admin.document.model.dao.AdminDocumentDao;
import com.project.npnc.admin.document.model.dto.AdminDocument;
import com.project.npnc.admin.document.model.dto.StorageFolder;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminDocumentService {
	private final SqlSessionTemplate session;
	private final AdminDocumentDao dao;
	
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
		return dao.updateStorageGroup(session,folderInfo);
	}
	public int removeFolder(int draggedFolderKey) {
		return dao.removeFolder(session,draggedFolderKey);
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
}
