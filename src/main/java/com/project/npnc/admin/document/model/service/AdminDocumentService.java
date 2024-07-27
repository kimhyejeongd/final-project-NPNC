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
}
