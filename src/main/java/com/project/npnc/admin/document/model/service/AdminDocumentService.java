package com.project.npnc.admin.document.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
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
			dao.updateFolderGroup(session, draggedFolder);
		}
		
		int result =dao.updateStorageGroup(session,folderInfo);
		
		return result;
	}
	public int increaseFolderOrder(Map<String,Object>folderInfo) {
		return dao.increaseFolderOrder(session,folderInfo);
	}
	public int removeFolder(int draggedFolderKey) {
		int result = dao.removeFolder(session,draggedFolderKey);
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
	    for(Integer key : deleteKeys) {
	    	result += dao.deleteStorage(session, key);
	    }
	    return result;
	}
	public int updateStorage(Storage storage) {
		return dao.updateStorage(session,storage);
	}
}
