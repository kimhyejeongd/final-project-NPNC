package com.project.npnc.admin.document.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.npnc.admin.document.model.dto.AdminDocument;
import com.project.npnc.admin.document.model.dto.Storage;
import com.project.npnc.admin.document.model.dto.StorageFolder;
import com.project.npnc.security.dto.Member;

@Repository
public class AdminDocumentDao {
	public List<StorageFolder> selectAdminDocumentFormAll(SqlSessionTemplate session){
		return session.selectList("admindoc.selectAdminDocumentFormAll");
	}
	
	public List<AdminDocument> selectDocAll(SqlSessionTemplate session, int folderKey){
		return session.selectList("admindoc.selectDocAll",folderKey);
	}
	
	public StorageFolder selectStorageFolderAll(SqlSessionTemplate session,int folderKey) {
		return session.selectOne("admindoc.selectStorageFolder",folderKey);
	}
	public int updateStorageGroup(SqlSessionTemplate session, Map<String,Object>folderInfo) {
		return session.update("admindoc.updateStorageGroup",folderInfo);
	}
	public int increaseFolderOrder(SqlSessionTemplate session,Map<String,Object>folderInfo) {
		return session.update("admindoc.increaseFolderOrder",folderInfo);
	}
	public int removeFolder(SqlSessionTemplate session, int draggedFolderKey) {
		return session.delete("admindoc.removeFolder",draggedFolderKey);
	}
	public int createFolderGroup(SqlSessionTemplate session) {
		return session.selectOne("admindoc.createFolderGroup");
	}
	public int insertFolder(SqlSessionTemplate session, StorageFolder storageFolder) {
		return session.insert("admindoc.insertFolder",storageFolder);
	}
	public int selectFolderKey(SqlSessionTemplate session) {
		return session.selectOne("admindoc.selectFolderKey");
	}
	public int selectFolderOrderBy(SqlSessionTemplate session,int folderGroup) {
		return session.selectOne("admindoc.selectFolderOrderBy",folderGroup);
	}
	public List<Member>selectAllMembers(SqlSessionTemplate session){
		return session.selectList("admindoc.selectAllMembers");
	}
	public int insertStorage(SqlSessionTemplate session, Storage storage) {
		return session.insert("admindoc.insertStorage",storage);
	}
}
