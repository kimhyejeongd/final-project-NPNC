package com.project.npnc.document.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.npnc.document.model.dto.Approver;
import com.project.npnc.document.model.dto.ApproverLine;
import com.project.npnc.document.model.dto.ApproverLineStorage;
import com.project.npnc.document.model.dto.DocFile;
import com.project.npnc.document.model.dto.Document;
import com.project.npnc.document.model.dto.DocumentForm;
import com.project.npnc.document.model.dto.DocumentFormFolder;
import com.project.npnc.document.model.dto.Referer;

public interface MemberDocumentDao {
	List<DocumentFormFolder> selectformFolders(SqlSession session);
	List<DocumentForm> selectForms(SqlSession session, int no);
	List<DocumentForm> selectFormsBySearch(SqlSession session, String target);
	DocumentForm selectFormByNo(SqlSession session, int no);
	
 	int insertDoc(SqlSession session, Document d);
	int insertApprovers(SqlSession session, List<Approver> list);
	int insertReferer(SqlSession session, List<Referer> list);
	int retrieveDoc(SqlSession session, String erDocSerialKey);
	int selectDocFile(SqlSession session, String erDocSerialKey);
	int deleteDocFile(SqlSession session, String erDocSerialKey);
	int updateDocFilename(SqlSession session, String erDocFilename);
	int retrieveDocFile(SqlSession session, String erDocSerialKey);
	
	List<Document> selectRetrieveDocs(SqlSession session, int no);
	List<Document> selectInprocessDocs(SqlSession session, int no);
	List<Document> selectWaitingDocs(SqlSession session, int no);
	Document selectDocById(SqlSession session, String docId);
	
	int insertApproverLineStorage(SqlSession session, Map<String,Object> map);
	int insertApproverLine(SqlSession session, Map<String,Object> map);
	List<ApproverLine> selectApproverLineList(SqlSession session, Map<String,Integer> map);
	List<ApproverLineStorage> selectApproverLines(SqlSession session, int no);
	int deleteApproverLines(SqlSession session, int no);
	
	int insertDocFile(SqlSession session, DocFile d);
}
