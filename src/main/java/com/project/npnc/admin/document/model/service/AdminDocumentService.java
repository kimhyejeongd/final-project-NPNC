package com.project.npnc.admin.document.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.project.npnc.admin.document.model.dao.AdminDocumentDao;
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
}
