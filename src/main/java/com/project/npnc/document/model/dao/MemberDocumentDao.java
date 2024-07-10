package com.project.npnc.document.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.document.model.dto.Document;
import com.project.npnc.document.model.dto.DocumentForm;
import com.project.npnc.document.model.dto.DocumentFormFolder;
import com.project.npnc.document.model.dto.approversList;

public interface MemberDocumentDao {
	List<DocumentFormFolder> selectformFolders(SqlSession session);
	List<DocumentForm> selectForms(SqlSession session, int no);
	List<DocumentForm> selectFormsBySearch(SqlSession session, String target);
	DocumentForm selectFormByNo(SqlSession session, int no);
	
	int insertDoc(SqlSession session, Document d);
	int insertDocFile(SqlSession session, approversList request);
}
