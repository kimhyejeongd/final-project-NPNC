package com.project.npnc.document.model.service;

import java.util.List;

import com.project.npnc.document.model.dto.Approver;
import com.project.npnc.document.model.dto.ApproverLine;
import com.project.npnc.document.model.dto.ApproverLineStorage;
import com.project.npnc.document.model.dto.Document;
import com.project.npnc.document.model.dto.DocumentForm;
import com.project.npnc.document.model.dto.DocumentFormFolder;

public interface MemberDocumentService {
	
	List<DocumentFormFolder> selectformFolders();
	List<DocumentForm> selectForms(int no);
	List<DocumentForm> selectFormsBySearch(String target);
	DocumentForm selectFormByNo(int no);
	
	int insertDoc(Document d) throws Exception;
//	int insertDoc(Document d, ApproversList request, RefererList referers) throws Exception;
	List<Document> selectInprocessDocs(int no);
	List<Document> selectWaitingDocs(int no);
	List<Document> selectRetrieveDocs(int no);
	int retrieveDoc(String docSerial) throws Exception;
	
	Document selectDocById(String docId);
	
	int insertApproverLine(int no, String name, List<ApproverLine> list) throws Exception;
	List<ApproverLine> selectApproverLineList(int storageKey, int memberNo);
	List<ApproverLineStorage> selectApproverLines(int memberNo);
	int deleteApproverLine(int no);
}