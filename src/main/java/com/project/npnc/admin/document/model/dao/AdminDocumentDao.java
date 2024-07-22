package com.project.npnc.admin.document.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.npnc.admin.document.model.dto.AdminDocument;
import com.project.npnc.admin.document.model.dto.StorageFolder;

@Repository
public class AdminDocumentDao {
	public List<StorageFolder> selectAdminDocumentFormAll(SqlSessionTemplate session){
		return session.selectList("admindoc.selectAdminDocumentFormAll");
	}
	
	public List<AdminDocument> selectDocAll(SqlSessionTemplate session, int folderKey){
		return session.selectList("admindoc.selectDocAll",folderKey);
	}
}
