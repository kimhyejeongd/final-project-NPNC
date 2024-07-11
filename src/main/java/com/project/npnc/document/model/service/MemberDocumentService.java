package com.project.npnc.document.model.service;

import java.util.List;

import com.project.npnc.document.model.dto.Document;
import com.project.npnc.document.model.dto.DocumentForm;
import com.project.npnc.document.model.dto.DocumentFormFolder;
import com.project.npnc.document.model.dto.approversList;

public interface MemberDocumentService {
	
	List<DocumentFormFolder> selectformFolders();
	List<DocumentForm> selectForms(int no);
	List<DocumentForm> selectFormsBySearch(String target);
	DocumentForm selectFormByNo(int no);
	
	int insertDoc(Document d, approversList request) throws Exception;
	List<Document> selectInprocessDocs(int no);
	List<Document> selectRetrieveDocs(int no);
	int retrieveDoc(String docSerial) throws Exception;
	
	Document selectDocBySerial(String docId);
}